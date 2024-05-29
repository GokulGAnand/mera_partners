import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/service/endpoints.dart';
import 'package:mera_partners/view_model/login/login_view_model.dart';
import 'package:mera_partners/widgets/custom_toast.dart';
import 'package:mera_partners/widgets/progressbar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import 'package:http_parser/http_parser.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../model/response/payment/create_order_response.dart';
import '../../model/response/user_data/user_info_response.dart';
import '../../utils/constants.dart';
import '../../utils/enum.dart';
import '../../utils/shared_pref_manager.dart';
import '../../utils/strings.dart';

class DocumentScreenViewModel extends GetxController {
  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page3Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page4Key = GlobalKey<FormState>();
  final Rx<PageController> pageController = PageController(initialPage: 0).obs;
  var activePage = 0.obs;
  var page = Get.arguments;

  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController(text: globals.phoneNum).obs;
  Rx<TextEditingController> businessNameController = TextEditingController().obs;
  Rx<TextEditingController> businessAddressController = TextEditingController().obs;
  Rx<TextEditingController> pinCodeController = TextEditingController().obs;
  Rx<TextEditingController> districtController = TextEditingController().obs;

  Rx<File?> aadhaarFront = Rx<File?>(null);
  Rx<File?> aadhaarBack = Rx<File?>(null);
  Rx<File?> panCard = Rx<File?>(null);
  Rx<File?> shopImage = Rx<File?>(null);
  Rx<File?> visitingCard = Rx<File?>(null);
  Rx<File?> cancelledCheque = Rx<File?>(null);
  var userInfoResponse = UserInfoResponse().obs;
  var createOrderResponse = CreateOrderResponse().obs;
  final Razorpay razorpay = Razorpay();
  String? orderId;
  String? paymentId;
  String? signature;

  @override
  void onInit() {
    pageController.value = PageController(initialPage: page ?? 0);
    activePage.value = page ?? 0;
    if (Get.isRegistered<LoginScreenViewModel>()) {
      if (Get.find<LoginScreenViewModel>().userInfoResponse.value.data != null) {
        userInfoResponse.value = Get.find<LoginScreenViewModel>().userInfoResponse.value;
        loadData();
      } else {
        getDocument();
      }
    } else {
      getDocument();
    }
    super.onInit();
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    paymentId = response.paymentId;
    signature = response.signature;
    ProgressBar.instance.showProgressbar(Get.context!);
    verifyPayment();
    log('success message');
  }

  void handlePaymentError(PaymentFailureResponse response) {
    CustomToast.instance.showMsg(MyStrings.payFail);
    log('fail message');
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    log('wallet message');
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  void getDocument() async {
    try {
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId}'), headers: globals.headers);
      userInfoResponse.value = UserInfoResponse.fromJson(json.decode(response.body));
      if (userInfoResponse.value.data != null) {
        loadData();
      }
      if (globals.documentStatus != DocumentStatus.VERIFIED.name || globals.isDeposited == false) {
        globals.documentStatus = userInfoResponse.value.data?.first.isDocumentsVerified;
        globals.isDeposited = userInfoResponse.value.data?.first.isDeposited;
        SharedPrefManager.instance.setStringAsync(Constants.documentStatus, userInfoResponse.value.data!.first.isDocumentsVerified.toString());
        SharedPrefManager.instance.setBoolAsync(Constants.isDeposited, userInfoResponse.value.data!.first.isDeposited ?? false);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void loadData() {
    fullNameController.value.text = userInfoResponse.value.data?[0].fullname ?? '';
    phoneNumberController.value.text = userInfoResponse.value.data?[0].contactNo.toString() ?? '';
    businessNameController.value.text = userInfoResponse.value.data?[0].businessName ?? '';
    businessAddressController.value.text = userInfoResponse.value.data?[0].businessAddress ?? '';
    pinCodeController.value.text = userInfoResponse.value.data?[0].pincode ?? '';
    districtController.value.text = userInfoResponse.value.data?[0].district ?? '';
    if (userInfoResponse.value.data?[0].addressProofFront?.url != null) {
      aadhaarFront.value = File(userInfoResponse.value.data?[0].addressProofFront?.url ?? '');
    }
    if (userInfoResponse.value.data?[0].addressProofBack?.url != null) {
      aadhaarBack.value = File(userInfoResponse.value.data?[0].addressProofBack?.url ?? '');
    }
    if (userInfoResponse.value.data?[0].panCard?.url != null) {
      panCard.value = File(userInfoResponse.value.data?[0].panCard?.url ?? '');
    }
    if (userInfoResponse.value.data?[0].shopPicture?.url != null) {
      shopImage.value = File(userInfoResponse.value.data?[0].shopPicture?.url ?? '');
    }
    if (userInfoResponse.value.data?[0].visitingCard?.url != null) {
      visitingCard.value = File(userInfoResponse.value.data?[0].visitingCard?.url ?? '');
    }
    if (userInfoResponse.value.data?[0].canceledCheque?.url != null) {
      cancelledCheque.value = File(userInfoResponse.value.data?[0].canceledCheque?.url ?? '');
    }
  }

  Future<bool> addDocument() async {
    ProgressBar.instance.showProgressbar(Get.context!);
    try {
      var request = http.MultipartRequest('PATCH', Uri.parse('${EndPoints.baseUrl}${EndPoints.users}${globals.uniqueUserId!}'));
      request.fields.addAll({'fullname': fullNameController.value.text, 'businessName': businessNameController.value.text, 'businessAddress': businessAddressController.value.text, 'pincode': pinCodeController.value.text, 'contactNo': phoneNumberController.value.text, 'district': districtController.value.text});
      if (panCard.value != null && !panCard.value!.path.startsWith('http') && !panCard.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('panCard', panCard.value!.path, contentType: MediaType('image', panCard.value!.path.split('.').last)));
      }
      if (aadhaarFront.value != null && !aadhaarFront.value!.path.startsWith('http') && !aadhaarFront.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('addressProofFront', aadhaarFront.value!.path, contentType: MediaType('image', aadhaarFront.value!.path.split('.').last)));
      }
      if (aadhaarBack.value != null && !aadhaarBack.value!.path.startsWith('http') && !aadhaarBack.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('addressProofBack', aadhaarBack.value!.path, contentType: MediaType('image', aadhaarBack.value!.path.split('.').last)));
      }
      if (shopImage.value != null) {
        if (!shopImage.value!.path.startsWith('http') && !shopImage.value!.path.startsWith('https')) {
          request.files.add(await http.MultipartFile.fromPath('shopPicture', shopImage.value!.path, contentType: MediaType('image', shopImage.value!.path.split('.').last)));
        }
      }
      if (visitingCard.value != null) {
        if (!visitingCard.value!.path.startsWith('http') && !visitingCard.value!.path.startsWith('https')) {
          request.files.add(await http.MultipartFile.fromPath('visitingCard', visitingCard.value!.path, contentType: MediaType('image', visitingCard.value!.path.split('.').last)));
        }
      }
      if (cancelledCheque.value != null && !cancelledCheque.value!.path.startsWith('http') && !cancelledCheque.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('canceledCheque', cancelledCheque.value!.path, contentType: MediaType('image', cancelledCheque.value!.path.split('.').last)));
      }
      request.headers.addAll(globals.jsonHeaders);
      log(request.fields.toString());
      log(request.toString());

      var response = await request.send();

      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        log('success');
        log(response.stream.toString());
        return true;
      } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.reasonPhrase.toString());
        CustomToast.instance.showMsg(MyStrings.unableToConnect);
        return false;
      }
    } catch (e) {
      log(e.toString());
      ProgressBar.instance.stopProgressBar(Get.context!);
      return false;
    }
  }

  void createOrder() async {
    try {
      log(Uri.parse(EndPoints.baseUrl + EndPoints.users + EndPoints.createOrder).toString());
      var response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.users + EndPoints.createOrder), headers: globals.jsonHeaders, body: json.encode({"amount": 10000}));
      log(response.body.toString());
      if (response.statusCode == 201 || response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        createOrderResponse.value = CreateOrderResponse.fromJson(json.decode(response.body));
        var options = {
          'key': 'rzp_live_ve07VuXvk32ht3',
          'name': 'Mera Cars',
          'currency': 'INR',
          'amount': createOrderResponse.value.data?.amount,
          'description': 'Security Deposit',
          'retry': {'enabled': true, 'max_count': 1},
          // 'send_sms_hash': true,
          'order_id': '${createOrderResponse.value.data?.id}',
          // 'callback_url': 'http://192.168.1.12:8000/api/v1/users/verifyPayment',
          'prefill': {'contact': globals.phoneNum, 'email': 'test@razorpay.com'},
          'external': {
            'wallets': ['paytm']
          }
        };
        razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
        razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
        razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
        try {
          razorpay.open(options);
        } catch (e) {
          log(e.toString());
        }
      } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
    }
  }

  // void createOrder() async {
  //   try {
  //     var userName = 'rzp_test_zppMuXi3XdVVOB';
  //     var password = 'OUure4VITgjPCnoinJTjTbno';
  //     var basicAuth = 'Basic ${base64Encode(utf8.encode('$userName:$password'))}';
  //     log(Uri.parse('https://api.razorpay.com/v1/orders').toString());
  //     var response = await http.post(Uri.parse('https://api.razorpay.com/v1/orders'),
  //         headers: <String, String>{
  //       'Content-Type':'application/json',
  //           'authorization':basicAuth
  //         },
  //         body: json.encode({
  //       "amount":100,
  //           'currency': 'INR',
  //           "receipt": "Receipt no. 1",
  //     }));
  //     log(response.body.toString());
  //     if (response.statusCode == 201 || response.statusCode == 200) {
  //       // createOrderResponse.value = CreateOrderResponse.fromJson(json.decode(response.body));
  //       // data.value = Response.fromJson(json.decode(response.body));
  //       final data = json.decode(response.body);
  //       Razorpay razorpay = Razorpay();
  //       log(data["id"]);
  //       var  options = {
  //         // 'key': 'rzp_test_1DP5mmOlF5G5ag',
  //         'key': 'rzp_test_zppMuXi3XdVVOB',
  //         'name': 'Mera Cars',
  //         // 'currency': 'INR',
  //         // 'amount': data.value.amount,
  //         'description': 'Security Deposit',
  //         'retry': {'enabled': true, 'max_count': 1},
  //         'send_sms_hash': true,
  //         'order_id': '${data["id"]}',
  //         // 'callback_url': EndPoints.baseUrl+EndPoints.users+EndPoints.verifyPayment,
  //         // 'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
  //         /*'external': {
  //           'wallets': ['paytm']
  //         }*/
  //       };
  //       razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
  //       razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
  //       razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  //       try {
  //         razorpay.open(options);
  //       } catch (e) {
  //         log(e.toString());
  //       }
  //     } else {
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
  void verifyPayment() async {
    try {
      log(Uri.parse(EndPoints.baseUrl + EndPoints.users + EndPoints.verifyPayment).toString());
      log(json.encode({"razorpay_order_id": createOrderResponse.value.data?.id, "razorpay_payment_id": paymentId, "razorpay_signature": signature}));
      var response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.users + EndPoints.verifyPayment), headers: globals.jsonHeaders,
          body: json.encode({
            "razorpay_order_id": createOrderResponse.value.data?.id,
            "razorpay_payment_id": paymentId,
            "razorpay_signature": signature}));
      log(response.body.toString());
      if (response.statusCode == 201 || response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        log("success");
        Get.offNamed(AppRoutes.homeScreen);
      } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log('ranjitha');
      log(e.toString());
    }
  }
}
