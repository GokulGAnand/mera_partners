import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import '../../../model/response/document/document_response.dart';
import '../../../service/exception_error_util.dart';
import '../../../utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;
import '../../../widgets/custom_toast.dart';
import '../../../widgets/progressbar.dart';

class DocumentViewModel extends GetxController {
  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();


  final Rx<PageController> pageController = PageController(initialPage: 0).obs;
  var documentResponse = DocumentResponse().obs;
  var id = Get.arguments ?? '';

  // the index of the current page
  var activePage = 0.obs;
  Rx<TextEditingController> insuranceCompanyController = TextEditingController().obs;
  Rx<TextEditingController> insuranceIDVController = TextEditingController().obs;
  Rx<TextEditingController> insuranceValidityController = TextEditingController().obs;
  Rx<TextEditingController> bankNameController = TextEditingController().obs;
  Rx<TextEditingController> remarksController = TextEditingController().obs;
  Rx<TextEditingController> rcFrontUploadRemarksController = TextEditingController().obs;
  Rx<TextEditingController> rcBackUploadRemarksController = TextEditingController().obs;
  Rx<TextEditingController> nocRemarksController = TextEditingController().obs;
  Rx<TextEditingController> chassisRemarksController = TextEditingController().obs;
  Rx<TextEditingController> form35RemarksController = TextEditingController().obs;
  List<String> yesNoList = Constants.yesNoList;
  List<String> insuranceList = Constants.insuranceList;
  Rx<File?> rcFrontImage = Rx<File?>(null);
  Rx<File?> rcBackImage = Rx<File?>(null);
  Rx<File?> nocImage = Rx<File?>(null);
  Rx<File?> form35Image = Rx<File?>(null);
  Rx<File?> chassisImage = Rx<File?>(null);

  var selectedRc = ''.obs;
  var selectedUnderHypothecation = ''.obs;
  var selectedInsurance = ''.obs;
  var selectedInterStateTransfer = ''.obs;
  var selectedNCB = ''.obs;
  var selectedLoanClosed = ''.obs;
  var selectedLoanNoc = ''.obs;
  var selectedForm35 = ''.obs;
  var selectedRcMismatch = ''.obs;
  var selectedInsuranceMismatch = ''.obs;
  var isPage1Fill = false.obs;
  var isPage2Fill = false.obs;

  @override
  void onInit() {
    getDocument();
    super.onInit();
  }

  void addDocuments() async {
    ProgressBar.instance.showProgressbar(Get.context!);
    try {
      var request = http.MultipartRequest('PATCH', Uri.parse('${EndPoints.baseUrl}${EndPoints.document}/${globals.carId}'));
      request.fields.addAll({
        'insurance': selectedInsurance.value,
        'insuranceCompany': insuranceCompanyController.value.text,
        'insuranceIDV': insuranceIDVController.value.text,
        'insuranceValidity': insuranceValidityController.value.text,
        'bankName': bankNameController.value.text,
        'hypothecation': selectedUnderHypothecation.value,
        'loanNoc': selectedLoanNoc.value,
        'ncb': selectedNCB.value,
        'loanStatus':selectedLoanClosed.value,
        'interStateTransfer':selectedInterStateTransfer.value,
        'form35':selectedForm35.value,
        'rcMismatch':selectedRcMismatch.value,
        'insuranceMismatch':selectedInsuranceMismatch.value,
        'remarks':remarksController.value.text,
        'rcFront_remarks':rcFrontUploadRemarksController.value.text,
        'rcBack_remarks':rcBackUploadRemarksController.value.text,
        'chassisImage_remarks':chassisRemarksController.value.text,
        'form35Image_remarks':form35RemarksController.value.text,
        'nocImage_remarks':nocRemarksController.value.text,
        'evaluationStatusForDocument': 'COMPLETED'
      });
      if (rcFrontImage.value != null && !rcFrontImage.value!.path.startsWith('http') && !rcFrontImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('rcFront', rcFrontImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if (rcBackImage.value != null && !rcBackImage.value!.path.startsWith('http') && !rcBackImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('rcBack', rcBackImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if(nocImage.value != null && !nocImage.value!.path.startsWith('http') && !nocImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('nocImage', nocImage.value!.path,contentType: MediaType('image', 'jpg')));
      }
      if(form35Image.value != null && !form35Image.value!.path.startsWith('http') && !form35Image.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('form35Image', form35Image.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      if(chassisImage.value != null && !chassisImage.value!.path.startsWith('http') && !chassisImage.value!.path.startsWith('https')) {
        request.files.add(await http.MultipartFile.fromPath('chassisImage', chassisImage.value!.path,contentType: MediaType('image', 'jpg'),));
      }
      request.headers.addAll(globals.headers);

      log(request.toString());

      var response = await request.send();

      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
            log(response.stream.toString());
            Get.back();
            // Get.offNamed(AppRoutes.dashBoardScreen);
          } else {
        ProgressBar.instance.stopProgressBar(Get.context!);
            log(response.reasonPhrase.toString());
          }
    } catch (e){
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  void getDocument() async {
    // ProgressBar.instance.showProgressbar(Get.context!);
    try {
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.document}/${globals.carId}'),headers: globals.headers);
      if(response.statusCode == 200){
        log(response.body.toString());
        documentResponse.value = DocumentResponse.fromJson(jsonDecode(response.body));
        loadData();
        ProgressBar.instance.stopProgressBar(Get.context!);
      }else{
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      // CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  void loadData(){
    if (documentResponse.value.data != null && documentResponse.value.data?.rcFront != null && documentResponse.value.data?.rcBack != null) {
      isPage2Fill.value = true;
      isPage1Fill.value = true;
      insuranceCompanyController.value.text = documentResponse.value.data?.insuranceCompany ?? '';
      insuranceIDVController.value.text = documentResponse.value.data?.insuranceIDV ?? '';
      insuranceValidityController.value.text = documentResponse.value.data?.insuranceValidity ?? '';
      bankNameController.value.text = documentResponse.value.data?.bankName ?? '';
      remarksController.value.text = documentResponse.value.data?.remarks ?? '';
      rcFrontUploadRemarksController.value.text = documentResponse.value.data?.rcFront?.remarks ?? '';
      rcBackUploadRemarksController.value.text = documentResponse.value.data?.rcBack?.remarks ?? '';
      chassisRemarksController.value.text = documentResponse.value.data?.chassisImage?.remarks ?? '';
      nocRemarksController.value.text = documentResponse.value.data?.nocImage?.remarks ?? '';
      form35RemarksController.value.text = documentResponse.value.data?.form35Image?.remarks ?? '';
      rcFrontImage.value = documentResponse.value.data?.rcFront?.url != null ?File(documentResponse.value.data?.rcFront?.url ?? ''):null;
      rcBackImage.value = documentResponse.value.data?.rcBack?.url != null ?File(documentResponse.value.data?.rcBack?.url ?? ''):null;
      chassisImage.value = documentResponse.value.data?.chassisImage?.url != null ?File(documentResponse.value.data?.chassisImage?.url ?? ''):null;
      nocImage.value = documentResponse.value.data?.nocImage?.url != null ?File(documentResponse.value.data?.nocImage?.url ?? ''):null;
      form35Image.value = documentResponse.value.data?.form35Image?.url != null ?File(documentResponse.value.data?.form35Image?.url ?? ''):null;
      selectedInterStateTransfer.value = documentResponse.value.data?.interStateTransfer ?? '';
      selectedInsurance.value = documentResponse.value.data?.insurance ?? '';
      selectedNCB.value = documentResponse.value.data?.ncb ?? '';
      selectedLoanClosed.value = documentResponse.value.data?.loanStatus ?? '';
      selectedForm35.value = documentResponse.value.data?.form35 ?? '';
      selectedRcMismatch.value = documentResponse.value.data?.rcMismatch ?? '';
      selectedInsuranceMismatch.value = documentResponse.value.data?.insuranceMismatch ?? '';
      selectedRc.value = documentResponse.value.data?.rcAvailability ?? '';
      selectedLoanNoc.value = documentResponse.value.data!.loanNoc ?? '';
      selectedUnderHypothecation.value = documentResponse.value.data!.hypothecation ?? '';
    }
  }

}

