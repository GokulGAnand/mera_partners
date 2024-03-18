import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/widgets/progressbar.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:http_parser/http_parser.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../model/response/payment/create_order_response.dart';
import '../../model/response/user_data/user_info_response.dart';

class DocumentScreenViewModel extends GetxController{
  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page3Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page4Key = GlobalKey<FormState>();
  final Rx<PageController> pageController = PageController(initialPage: 0).obs;
  var activePage = 0.obs;

  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> phoneNumberController = TextEditingController(text: '8888888888').obs;
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
  void onInit(){
    // razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    // razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    // razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    getDocument();
    super.onInit();
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    paymentId = response.paymentId;
    signature = response.signature;
    verifyPayment();
    log('success message');
  }

  void handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
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
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.users}65eed25c48573dc480cf89a9'),headers: globals.headers);
      userInfoResponse.value = UserInfoResponse.fromJson(json.decode(response.body));
      if(userInfoResponse.value.data != null){
        loadData();
      }
    } catch (e) {
      log(e.toString());
    }

  }

  void loadData(){
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
      //todo
      var request = http.MultipartRequest('PATCH', Uri.parse('${EndPoints.baseUrl}${EndPoints.users}65eed25c48573dc480cf89a9'));
      request.fields.addAll({
            'fullname': fullNameController.value.text,
            'businessName': businessNameController.value.text,
            'businessAddress': businessAddressController.value.text,
            'pincode': pinCodeController.value.text,
            'contactNo': phoneNumberController.value.text,
            'district': districtController.value.text
          });
      if (panCard.value != null && !panCard.value!.path.startsWith('http') && !panCard.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('panCard', panCard.value!.path,contentType: MediaType('image', panCard.value!.path.split('.').last)));
      }
      if (aadhaarFront.value != null && !aadhaarFront.value!.path.startsWith('http') && !aadhaarFront.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('addressProofFront', aadhaarFront.value!.path,contentType: MediaType('image', aadhaarFront.value!.path.split('.').last)));
      }
      if (aadhaarBack.value != null && !aadhaarBack.value!.path.startsWith('http') && !aadhaarBack.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('addressProofBack', aadhaarBack.value!.path,contentType: MediaType('image', aadhaarBack.value!.path.split('.').last)));
      }
      if (shopImage.value != null) {
            if (!shopImage.value!.path.startsWith('http') && !shopImage.value!.path.startsWith('https')) {
              request.files.add(await http.MultipartFile.fromPath('shopPicture', shopImage.value!.path,contentType: MediaType('image', shopImage.value!.path.split('.').last)));
            }
          }
      if (visitingCard.value != null) {
            if (!visitingCard.value!.path.startsWith('http') && !visitingCard.value!.path.startsWith('https')) {
              request.files.add(await http.MultipartFile.fromPath('visitingCard', visitingCard.value!.path,contentType: MediaType('image', visitingCard.value!.path.split('.').last)));
            }
          }
      if (cancelledCheque.value != null && !cancelledCheque.value!.path.startsWith('http') && !cancelledCheque.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('canceledCheque', cancelledCheque.value!.path,contentType: MediaType('image', cancelledCheque.value!.path.split('.').last)));
      }
      request.headers.addAll(globals.headers);

      var response = await request.send();

      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
            log('success');
            log(response.stream.toString());
            return true;
          }
          else {
        ProgressBar.instance.stopProgressBar(Get.context!);
            log(response.reasonPhrase.toString());
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
      var response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.users + EndPoints.createOrder), headers: globals.jsonHeaders,
          body: json.encode({
        "amount":10000
      }));
      log(response.body.toString());
      if (response.statusCode == 201 || response.statusCode == 200) {
        createOrderResponse.value = CreateOrderResponse.fromJson(json.decode(response.body));
        var  options = {
          'key': 'rzp_test_1DP5mmOlF5G5ag',
          'name': 'Mera Cars',
          'currency': 'INR',
          'amount': createOrderResponse.value.data?.amount,
          'description': 'Security Deposit',
          'retry': {'enabled': true, 'max_count': 1},
          'send_sms_hash': true,
          'order_id': '${createOrderResponse.value.data?.id}',
          'callback_url': 'http://192.168.1.12:8000/api/v1/users/verifyPayment',
          'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
          'external': {
            'wallets': ['paytm']
          }
        };
        // razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
        // razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
        // razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
        try {
          razorpay.open(options);
        } catch (e) {
          log(e.toString());
        }
      } else {
      }
    } catch (e) {
      log(e.toString());
    }
  }
  void verifyPayment() async {
    try {
      log(Uri.parse(EndPoints.baseUrl + EndPoints.users + EndPoints.verifyPayment).toString());
      log(json.encode({
        "razorpay_order_id":createOrderResponse.value.data?.id,
        "razorpay_payment_id":paymentId,
        "razorpay_signature":signature
      }));
      var response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.users + EndPoints.verifyPayment), headers: globals.jsonHeaders,
          body: json.encode({
            "razorpay_order_id":createOrderResponse.value.data?.id,
            "razorpay_payment_id":paymentId,
            "razorpay_signature":signature
          }));
      log(response.body.toString());
      if (response.statusCode == 201 || response.statusCode == 200) {
        log("success");
        Get.offNamed(AppRoutes.homeScreen);
      } else {}
    } catch (e) {
      log('ranjitha');
      log(e.toString());
    }
  }
}