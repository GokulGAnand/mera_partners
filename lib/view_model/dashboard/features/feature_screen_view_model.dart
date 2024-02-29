
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:evaluator_app/utils/globals.dart' as globals;
import 'package:http_parser/http_parser.dart';

import '../../../model/response/features/faetures_response.dart';
import '../../../routes/app_routes.dart';
import '../../../service/exception_error_util.dart';
import '../../../utils/strings.dart';
import '../../../widgets/custom_toast.dart';

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

  Rx<TextEditingController> alloyWheelsRemarksController = TextEditingController().obs;
  Rx<TextEditingController> airBagsRemarksController = TextEditingController().obs;
  Rx<TextEditingController> absEbdRemarksController = TextEditingController().obs;
  Rx<TextEditingController> gloveBoxRemarksController = TextEditingController().obs;
  // var abs = ''.obs;

  RxList<String> selectedAlloyWheel = <String>[].obs;
  var selectedFogLamps = ''.obs;
  RxList<String> selectedAirBag = <String>[].obs;
  var selectedSeatBelt = ''.obs;
  RxList<String> selectAbsEbd = <String>[].obs;
  RxList<String> selectedGloveBox = <String>[].obs;

  Rx<File?> alloyWheelImage = Rx<File?>(null);
  Rx<File?> airBagImage = Rx<File?>(null);
  Rx<File?> absEbdImage = Rx<File?>(null);
  Rx<File?> gloveBoxImage = Rx<File?>(null);
  Rx<File?> clusterImage = Rx<File?>(null);
  var featuresResponse = featuresList().obs;

  var featureInfoResponse = featuresList().obs;
  var id = Get.arguments ?? '';

  @override
  void onInit() {
    // TODO: implement onInit
    getFeatureInfo();
    super.onInit();
  }

  void addFeatureInfo()async{
   try{
     var request = http.MultipartRequest('PATCH',Uri.parse(EndPoints.baseUrl+EndPoints.featureInfo+'/'+globals.carId.toString()));
     for(int i=0; i<selectedStereoImage.length; i++){
       request.fields['stereoImage_condition[$i]'] = selectedStereoImage[i];
     }
     for(int i=0; i<selectedSunRoof.length; i++){
       request.fields['sunroof[$i]'] = selectedSunRoof[i];
     }
     for (int i=0; i<selectedAlloyWheel.length; i++){
       request.fields['alloyWheels[$i]'] =selectedAlloyWheel[i];
     }
     for (int i=0; i<selectedAirBag.length; i++){
       request.fields['airbag[$i]'] = selectedAirBag[i];
     }
     for (int i=0; i<selectedKeylessEntry.length; i++){
       request.fields['keylessEntry[$i]'] =selectedKeylessEntry[i];
     }
     for (int i=0; i<selectAbsEbd.length; i++){
       request.fields['absEbd[$i]'] = selectAbsEbd[i];
     }
     for (int i=0; i<selectedGloveBox.length; i++){
       request.fields['gloveBox[$i]'] = selectedGloveBox[i];
     }
     request.fields.addAll({
       'rearParkingSensor': selectedRearParkingSensor.value,
       'gpsNavigation': selectedGpsNavigation.value,
       'rearDefogger': selectedRearDefogger.value,
       'fogLamps': selectedFogLamps.value,
       'stereoBrand': sterioBrandController.value.text,
       'seatBelt': selectedSeatBelt.value,
       'anyInteriorModifications': anyInteriorModificationController.value.text ,
       'evaluationStatusForFeature': 'COMPLETED'
     });
     if (stereoImage.value!=null && (stereoImage.value!.path.startsWith('http') == false || stereoImage.value!.path.startsWith('https') == false)) {
       request.files.add( await http.MultipartFile.fromPath('stereoImage', stereoImage.value!.path,contentType: MediaType('image', 'jpg'),));
     } 
     request.headers.addAll(globals.headers);

     http.StreamedResponse response = await request.send();
     
     if (response.statusCode == 200) {
       log(await response.stream.bytesToString());
       CustomToast.instance.showMsg(MyStrings.success);
       Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
     }
     else {
       log(response.reasonPhrase.toString());
     }
   }catch (e){
     log('work: ${e}');
     CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
   }
  }

  void getFeatureInfo() async {
    try {
      var response = await http.get(Uri.parse(EndPoints.baseUrl+EndPoints.featureInfo+'/'+globals.carId.toString()),
      headers: globals.headers);
      if(response.statusCode == 200){
        log(response.body.toString());
        var data = await jsonDecode(response.body);
        featureInfoResponse.value = featuresList.fromJson(data);
        loadData();
      }else{
        log(response.reasonPhrase.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void loadData(){
    if(featureInfoResponse.value.data != null){
      /// page 1
      keylessEntryController.value.text = featureInfoResponse.value.data![0].keylessEntry!.join(",");
      selectedKeylessEntry.value = keylessEntryController.value.text.split(",");
      
      stereoImageController.value.text = featureInfoResponse.value.data![0].stereoImage!.condition!.join(",");
      selectedStereoImage.value = stereoImageController.value.text.split(",");
      stereoImage.value = featureInfoResponse.value.data![0].stereoImage?.url  != null ? File(featureInfoResponse.value.data![0].stereoImage!.url ?? '') : null;
      stereoImageRemarksController.value.text = featureInfoResponse.value.data![0].stereoImage!.remarks ?? '';
      
      sterioBrandController.value.text = featureInfoResponse.value.data![0].stereoBrand ?? '';

      selectedRearParkingSensor.value = featureInfoResponse.value.data![0].rearParkingSensor ?? '';
      selectedFogLamp.value = featureInfoResponse.value.data![0].fogLamps ?? '';

      sunroofController.value.text = featureInfoResponse.value.data![0].sunroof!.join(",");
      selectedSunRoof.value = sunroofController.value.text.split(",");

      selectedGpsNavigation.value = featureInfoResponse.value.data![0].gpsNavigation ?? '';
      selectedRearDefogger.value = featureInfoResponse.value.data![0].rearDefogger ?? '';

      /// page 2
      alloyWheelsController.value.text = featureInfoResponse.value.data![0].alloyWheels!.join(",");
      selectedAlloyWheel.value = alloyWheelsController.value.text.split(",");
      
      airBagsController.value.text = featureInfoResponse.value.data![0].airbag!.join(",");
      selectedAirBag.value = airBagsController.value.text.split(",");
      
      selectedSeatBelt.value = featureInfoResponse.value.data![0].seatBelt ?? '';

      absEbdController.value.text = featureInfoResponse.value.data![0].absEbd!.join(",");
      selectAbsEbd.value = absEbdController.value.text.split(",");
      
      gloveBoxController.value.text = featureInfoResponse.value.data![0].gloveBox!.join(",");
      selectedGloveBox.value = gloveBoxController.value.text.split(",");
      
      anyInteriorModificationController.value.text = featureInfoResponse.value.data![0].anyInteriorModifications ?? '';

    }
  }

}