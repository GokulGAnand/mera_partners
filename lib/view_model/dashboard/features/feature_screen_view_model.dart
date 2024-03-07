
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:http_parser/http_parser.dart';
import '../../../model/response/features/faetures_response.dart';
import '../../../service/exception_error_util.dart';
import '../../../utils/strings.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/progressbar.dart';
import '../dashboard_view_model.dart';

class FeatureViewModel extends GetxController{
  final Rx<PageController> pageController = PageController(initialPage: 0).obs;

  var activePage = 0.obs;

  var isPage1Fill = false.obs;
  var isPage2Fill = false.obs;
  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();


 /// page1
  var keyLessEntryList = Constants.keyLessEntryList;
  var stereoImageList = Constants.stereoImageOptions;
  var rearParkingSensorList = Constants.rearParkingSensorList;
  var fogLampList = Constants.fogLampList;
  var sunRoofList = Constants.sunRoofList;
  var gpsNavigationList =Constants.gpsNavigationList;
  var rearDefoggerList = Constants.rearDefoggerList;

  // Rx<TextEditingController> sterioImageRemarks = TextEditingController().obs;
  // Rx<File?> sterioCompartmentImage = Rx<File?>(null);

  Rx<TextEditingController> keylessEntryController = TextEditingController().obs;
  Rx<TextEditingController> stereoImageController = TextEditingController().obs;
  Rx<TextEditingController> sterioBrandController = TextEditingController().obs;
  Rx<TextEditingController> sunroofController = TextEditingController().obs;

  Rx<TextEditingController> keylessEntryOtherController = TextEditingController().obs;
  Rx<TextEditingController> stereoImageOtherController = TextEditingController().obs;
  Rx<TextEditingController> sterioBrandOtherController = TextEditingController().obs;
  Rx<TextEditingController> sunroofOtherController = TextEditingController().obs;

  Rx<TextEditingController> keylessEntryRemarksController = TextEditingController().obs;
  Rx<TextEditingController> stereoImageRemarksController = TextEditingController().obs;
  Rx<TextEditingController> sunroofRemarksController = TextEditingController().obs;

  RxList<String> selectedKeylessEntry = <String>[].obs;
  RxList<String> selectedStereoImage = <String>[].obs;
  var selectedRearParkingSensor = ''.obs;
  var selectedFogLamp = ''.obs;
  RxList<String> selectedSunRoof = <String>[].obs;
  var selectedGpsNavigation =''.obs;
  var selectedRearDefogger = ''.obs;

  Rx<File?> keyLessEntryImage = Rx<File?>(null);
  Rx<File?> stereoImage = Rx<File?>(null);
  Rx<File?> sunroofImage = Rx<File?>(null);


  /// page2


  var alloyWheelsList = Constants.alloyWheelsList;
  // var fogLampsList = Constants.fogLampsList;
  var airBagList = Constants.airBagList;
  var seatBeltList = Constants.seatBeltList;
  var absEbdList = Constants.absEbdList;
  var gloveBoxList = Constants.gloveBoxList;

  Rx<TextEditingController> alloyWheelsController = TextEditingController().obs;
  Rx<TextEditingController> airBagsController = TextEditingController().obs;
  Rx<TextEditingController> absEbdController = TextEditingController().obs;
  Rx<TextEditingController> gloveBoxController = TextEditingController().obs;
  Rx<TextEditingController> anyInteriorModificationController = TextEditingController().obs;

  Rx<TextEditingController> alloyWheelsOtherController = TextEditingController().obs;
  Rx<TextEditingController> airBagsOtherController = TextEditingController().obs;
  Rx<TextEditingController> absEbdOtherController = TextEditingController().obs;
  Rx<TextEditingController> gloveBoxOtherController = TextEditingController().obs;
  Rx<TextEditingController> anyInteriorModificationOtherController = TextEditingController().obs;

  Rx<TextEditingController> alloyWheelsRemarksController = TextEditingController().obs;
  Rx<TextEditingController> airBagsRemarksController = TextEditingController().obs;
  Rx<TextEditingController> absEbdRemarksController = TextEditingController().obs;
  Rx<TextEditingController> gloveBoxRemarksController = TextEditingController().obs;
  // var abs = ''.obs;

  RxList<String> selectedAlloyWheel = <String>[].obs;
  // var selectedFogLamps = ''.obs;
  RxList<String> selectedAirBag = <String>[].obs;
  var selectedSeatBelt = ''.obs;
  RxList<String> selectAbsEbd = <String>[].obs;
  RxList<String> selectedGloveBox = <String>[].obs;

  Rx<File?> alloyWheelImage = Rx<File?>(null);
  Rx<File?> airBagImage = Rx<File?>(null);
  Rx<File?> absEbdImage = Rx<File?>(null);
  Rx<File?> gloveBoxImage = Rx<File?>(null);
  Rx<File?> clusterImage = Rx<File?>(null);
  var featuresResponse = FeaturesList().obs;

  var featureInfoResponse = FeaturesList().obs;
  var id = Get.arguments ?? '';

  @override
  void onInit() {
    // TODO: implement onInit
    getFeatureInfo();
    super.onInit();
  }

  void addFeatureInfo()async{
    ProgressBar.instance.showProgressbar(Get.context!);
   try{
     var request = http.MultipartRequest('PATCH',Uri.parse('${EndPoints.baseUrl}${EndPoints.featureInfo}/${globals.carId}'));
     for(int i=0; i<selectedStereoImage.length; i++){
       request.fields['stereoImage_condition[$i]'] = selectedStereoImage[i];
     }
     for(int i=0; i<selectedSunRoof.length; i++){
       request.fields['sunroof_condition[$i]'] = selectedSunRoof[i];
     }
     for (int i=0; i<selectedAlloyWheel.length; i++){
       request.fields['alloyWheels_condition[$i]'] =selectedAlloyWheel[i];
     }
     for (int i=0; i<selectedAirBag.length; i++){
       request.fields['airbag_condition[$i]'] = selectedAirBag[i];
     }
     for (int i=0; i<selectedKeylessEntry.length; i++){
       request.fields['keylessEntry_condition[$i]'] =selectedKeylessEntry[i];
     }
     for (int i=0; i<selectAbsEbd.length; i++){
       request.fields['absEbd_condition[$i]'] = selectAbsEbd[i];
     }
     for (int i=0; i<selectedGloveBox.length; i++){
       request.fields['gloveBox_condition[$i]'] = selectedGloveBox[i];
     }
     request.fields.addAll({
       'rearParkingSensor': selectedRearParkingSensor.value,
       'gpsNavigation': selectedGpsNavigation.value,
       'rearDefogger': selectedRearDefogger.value,
       'fogLamps': selectedFogLamp.value,
       'stereoBrand': sterioBrandController.value.text,
       'seatBelt': selectedSeatBelt.value,
       'stereoImage_remarks': stereoImageRemarksController.value.text,
       'anyInteriorModifications': anyInteriorModificationController.value.text ,
       'evaluationStatusForFeature': 'COMPLETED',
     });
     if(featureInfoResponse.value.data != null && alloyWheelImage.value !=null){
       request.fields.addAll({
         'alloyWheels' : featureInfoResponse.value.data?[0].alloyWheels?.url ?? '',
       });
     }
     if (stereoImage.value!=null && (stereoImage.value!.path.startsWith('http') == false || stereoImage.value!.path.startsWith('https') == false)) {
       request.files.add( await http.MultipartFile.fromPath('stereoImage', stereoImage.value!.path,contentType: MediaType('image', 'jpg'),));
     }
     if (keyLessEntryImage.value!=null && (keyLessEntryImage.value!.path.startsWith('http') == false || keyLessEntryImage.value!.path.startsWith('https') == false)) {
       request.files.add( await http.MultipartFile.fromPath('keylessEntry', keyLessEntryImage.value!.path,contentType: MediaType('image', 'jpg'),));
     }
     if (sunroofImage.value!=null && (sunroofImage.value!.path.startsWith('http') == false || sunroofImage.value!.path.startsWith('https') == false)) {
       request.files.add( await http.MultipartFile.fromPath('sunroof', sunroofImage.value!.path,contentType: MediaType('image', 'jpg'),));
     }
     if (alloyWheelImage.value!=null && (alloyWheelImage.value!.path.startsWith('http') == false || alloyWheelImage.value!.path.startsWith('https') == false)) {
       request.files.add( await http.MultipartFile.fromPath('alloyWheels', alloyWheelImage.value!.path,contentType: MediaType('image', 'jpg'),));
     }
     if (airBagImage.value!=null && (airBagImage.value!.path.startsWith('http') == false || airBagImage.value!.path.startsWith('https') == false)) {
       request.files.add( await http.MultipartFile.fromPath('airbag', airBagImage.value!.path,contentType: MediaType('image', 'jpg'),));
     }
     if (absEbdImage.value!=null && (absEbdImage.value!.path.startsWith('http') == false || absEbdImage.value!.path.startsWith('https') == false)) {
       request.files.add( await http.MultipartFile.fromPath('absEbd', absEbdImage.value!.path,contentType: MediaType('image', 'jpg'),));
     }
     if (gloveBoxImage.value!=null && (gloveBoxImage.value!.path.startsWith('http') == false || gloveBoxImage.value!.path.startsWith('https') == false)) {
       request.files.add( await http.MultipartFile.fromPath('gloveBox', gloveBoxImage.value!.path,contentType: MediaType('image', 'jpg'),));
     }
     request.headers.addAll(globals.headers);

     log(request.toString());
     log(request.fields.toString());
     log(request.files.toString());
     var response = await request.send();
     
     if (response.statusCode == 200) {
       ProgressBar.instance.stopProgressBar(Get.context!);
       log(response.stream.toString());
       CustomToast.instance.showMsg(MyStrings.success);
       if (Get.isRegistered<DashBoardViewModel>()) {
         Get.delete<DashBoardViewModel>();
       }
       Get.offNamed(AppRoutes.dashBoardScreen);
     }
     else {
       ProgressBar.instance.stopProgressBar(Get.context!);
       log(response.reasonPhrase.toString());
     }
   }catch (e){
     ProgressBar.instance.stopProgressBar(Get.context!);
     log('work: $e');
     CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
   }
  }

  void getFeatureInfo() async {
    try {
      // ProgressBar.instance.showProgressbar(Get.context!);
      var response = await http.get(Uri.parse('${EndPoints.baseUrl}${EndPoints.featureInfo}/${globals.carId}'),
      headers: globals.headers);
      if(response.statusCode == 200){
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.body.toString());
        var data = await jsonDecode(response.body);
        featureInfoResponse.value = FeaturesList.fromJson(data);
        loadData();
      }else{
        ProgressBar.instance.stopProgressBar(Get.context!);
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
    }
  }

  void loadData(){
    if(featureInfoResponse.value.data != null){
      isPage1Fill.value = true;
      isPage2Fill.value = true;
      /// page 1
      keylessEntryController.value.text = featureInfoResponse.value.data![0].keylessEntry!.condition!.join(",");
      selectedKeylessEntry.value = keylessEntryController.value.text.split(",");
      keyLessEntryImage.value = featureInfoResponse.value.data?[0].keylessEntry?.url != null? File(featureInfoResponse.value.data?[0].keylessEntry?.url ?? '') : null;
      
      stereoImageController.value.text = featureInfoResponse.value.data![0].stereoImage!.condition!.join(",");
      selectedStereoImage.value = stereoImageController.value.text.split(",");
      stereoImage.value = featureInfoResponse.value.data![0].stereoImage?.url  != null ? File(featureInfoResponse.value.data![0].stereoImage!.url ?? '') : null;
      stereoImageRemarksController.value.text = featureInfoResponse.value.data![0].stereoImage!.remarks ?? '';
      
      sterioBrandController.value.text = featureInfoResponse.value.data![0].stereoBrand ?? '';

      selectedRearParkingSensor.value = featureInfoResponse.value.data![0].rearParkingSensor ?? '';
      selectedFogLamp.value = featureInfoResponse.value.data![0].fogLamps ?? '';

      sunroofController.value.text = featureInfoResponse.value.data![0].sunroof!.condition!.join(",");
      selectedSunRoof.value = sunroofController.value.text.split(",");
      sunroofImage.value = featureInfoResponse.value.data?[0].sunroof?.url != null? File(featureInfoResponse.value.data?[0].sunroof?.url ?? '') : null;

      selectedGpsNavigation.value = featureInfoResponse.value.data![0].gpsNavigation ?? '';
      selectedRearDefogger.value = featureInfoResponse.value.data![0].rearDefogger ?? '';

      /// page 2
      alloyWheelsController.value.text = featureInfoResponse.value.data![0].alloyWheels!.condition!.join(",");
      selectedAlloyWheel.value = alloyWheelsController.value.text.split(",");
      alloyWheelImage.value = featureInfoResponse.value.data?[0].alloyWheels?.url != null? File(featureInfoResponse.value.data?[0].alloyWheels?.url ?? '') : null;
      
      airBagsController.value.text = featureInfoResponse.value.data![0].airbag!.condition!.join(",");
      selectedAirBag.value = airBagsController.value.text.split(",");
      airBagImage.value = featureInfoResponse.value.data?[0].airbag?.url != null? File(featureInfoResponse.value.data?[0].airbag?.url ?? '') : null;
      
      selectedSeatBelt.value = featureInfoResponse.value.data![0].seatBelt ?? '';

      absEbdController.value.text = featureInfoResponse.value.data![0].absEbd!.condition!.join(",");
      selectAbsEbd.value = absEbdController.value.text.split(",");
      absEbdImage.value = featureInfoResponse.value.data?[0].absEbd?.url != null? File(featureInfoResponse.value.data?[0].absEbd?.url ?? '') : null;
      
      gloveBoxController.value.text = featureInfoResponse.value.data![0].gloveBox!.condition!.join(",");
      selectedGloveBox.value = gloveBoxController.value.text.split(",");
      gloveBoxImage.value = featureInfoResponse.value.data?[0].gloveBox?.url != null? File(featureInfoResponse.value.data?[0].gloveBox?.url ?? '') : null;
      
      anyInteriorModificationController.value.text = featureInfoResponse.value.data![0].anyInteriorModifications ?? '';

    }
  }

}