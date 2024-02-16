import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../model/response/document/document_response.dart';
import '../../../service/exception_error_util.dart';
import '../../../utils/constants.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;

import '../../../widgets/custom_toast.dart';

class DocumentViewModel extends GetxController {
  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();

  final Rx<PageController> pageController = PageController(initialPage: 0).obs;
  var documentResponse = DocumentResponse().obs;

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

  void addDocuments() async {
    try {
      //todo add missing fields
      var request = http.MultipartRequest('PATCH', Uri.parse('${EndPoints.baseUrl}${EndPoints.document}/65bdb7fbd3a852d21be986bf'));
      request.fields.addAll({'insurance': selectedInsurance.value, 'insuranceCompany': insuranceCompanyController.value.text, 'insuranceIDV': insuranceIDVController.value.text, 'insuranceValidity': insuranceValidityController.value.text, 'bankName': bankNameController.value.text, 'hypothicationClosed': selectedUnderHypothecation.value, 'noc': selectedLoanNoc.value,});
      if (rcFrontImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('rcFront', rcFrontImage.value!.readAsBytesSync()));
      }
      if (rcBackImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('rcBack', rcBackImage.value!.readAsBytesSync()));
      }
      if(nocImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('nocImage', nocImage.value != null ? nocImage.value!.readAsBytesSync() : []));
      }
      if(form35Image.value != null) {
        request.files.add(http.MultipartFile.fromBytes('form35', form35Image.value != null ? form35Image.value!.readAsBytesSync() : []));
      }
      if(chassisImage.value != null) {
        request.files.add(http.MultipartFile.fromBytes('chassisImage', chassisImage.value != null ? chassisImage.value!.readAsBytesSync() : []));
      }
      request.headers.addAll(globals.headers);

      log(request.toString());

      var response = await request.send();

      if (response.statusCode == 200) {
            log(await response.stream.bytesToString());
            Get.toNamed(AppRoutes.dashBoardScreen);
          } else {
            log(response.reasonPhrase.toString());
          }
    } catch (e){
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  void getDocument() async {
    try {
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.document}/65bdb7fbd3a852d21be986bf'));
      if(response.statusCode == 200){
        documentResponse.value = DocumentResponse.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

}

