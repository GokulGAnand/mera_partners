import 'dart:convert';

import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;
import '../../model/response/new_evaluation/car_make_model_variant_response.dart';
import '../../utils/colors.dart';

class NewEvaluationViewModel extends GetxController{

  final Rx<PageController> pageController = PageController(initialPage: 0).obs;
  // the index of the current page
  var activePage = 0.obs;
  var isPage1 =  false.obs;
  var isPage2 =  false.obs;
  var isPage3 =  false.obs;
  var isPage4 =  false.obs;
  ///page 1
  var selectedRegistered = "".obs;
  var selectedMake = Data().obs;
  var selectedModel = Data().obs;
  var selectedVariant = Data().obs;
  ///page 2
  var selectedOwnerShip = "".obs;
  var selectedRegState = "".obs;
  var selectedVehicleLocation = "".obs;
  var selectedRegCity = "".obs;
  var selectedValState = "".obs;
  var selectedValCity = "".obs;
  var selectedFuelType = "".obs;
  var selectedTransmission = "".obs;
  ///page 3
  var selectedBodyType = "".obs;
  var selectedEngineCC = "".obs;
  var selectedVehicleUsage = "".obs;
  var selectedLength = "".obs;
  var selectedCCClass = "".obs;
  ///page 4
  var selectedSeats = "".obs;
  var selectedAccidental = "".obs;
  var selectedOEMRemaining = "".obs;
  var selectedOdometerWorking = "".obs;
  ///dropdown input list data
  List<String> yesNoList = Constants.yesNoList;
  List<String> registeredList = Constants.registeredList;
  List<String> seatList = Constants.seatList;
  List<String> lengthList = Constants.lengthList;
  List<String> ownerShipList = Constants.ownerShipList;
  List<String> fuelTypeList = Constants.fuelTypeList;
  List<String> bodyTypeList = Constants.bodyTypeList;
  List<String> vehicleUsageList = Constants.vehicleUsageList;
  List<String> transmissionList = Constants.transmissionList;
  List<String> ccClassList = Constants.ccClassList;
  List<String> ccList = Constants.engineCCList;
  List<String> indianStatesList = Constants.indianStates;
  List<String> keralaDistrictsList = Constants.keralaDistricts;

  var selectedYear = DateTime.now().obs;
  var carMakeListResponse = CarMakeListResponse().obs;
  var carMakeList = [].obs;
  var carModelList = [].obs;
  var carVariantList = [].obs;

  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page3Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page4Key = GlobalKey<FormState>();

  ///page one controllers
  Rx<TextEditingController> sellerNameController = TextEditingController().obs;
  Rx<TextEditingController> sellerAddressController = TextEditingController().obs;
  Rx<TextEditingController> sellerPhoneNumController = TextEditingController().obs;
  Rx<TextEditingController> manufacturingYearController = TextEditingController().obs;
  Rx<TextEditingController> registrationNumberController = TextEditingController().obs;
  Rx<TextEditingController> chassisNumberController = TextEditingController().obs;
  Rx<TextEditingController> rcOwnerNameController = TextEditingController().obs;
  Rx<TextEditingController> rcOwnerPhoneNumController = TextEditingController().obs;
  ///page two controllers
  Rx<TextEditingController> regDateController = TextEditingController().obs;
  Rx<TextEditingController> regValidityController = TextEditingController().obs;
  Rx<TextEditingController> taxValidityController = TextEditingController().obs;
  Rx<TextEditingController> rtoController = TextEditingController().obs;
  ///page three controllers
  Rx<TextEditingController> customerPriceController = TextEditingController().obs;
  Rx<TextEditingController> noOfCylindersController = TextEditingController().obs;
  Rx<TextEditingController> engineNumController = TextEditingController().obs;
  Rx<TextEditingController> colorController = TextEditingController().obs;
  ///page four controllers
  Rx<TextEditingController> noOfMonthsRemainingController = TextEditingController().obs;
  Rx<TextEditingController> odometerReadingController = TextEditingController().obs;
  Rx<TextEditingController> noOfKmsRemainingController = TextEditingController().obs;
  Rx<TextEditingController> remarksController = TextEditingController().obs;

  @override
  void onInit() {
    getCarBrands();
    super.onInit();
  }

  void getCarBrands({String? make, String? model}) async{
    try {
      String? makeData = make != null && make.isNotEmpty?'?make=$make':'';
      String? modelData = model != null && model.isNotEmpty?'?model=$model':'';
      var headers = {
        'Authorization': 'Bearer ${globals.token ?? 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWFmNGYzYmZjYmJiOWE4M2I1NzIwZDUiLCJyb2xlIjoiRVZBTFVBVE9SIiwiaWF0IjoxNzA2OTMyNTAwLCJleHAiOjE3MDk1MjQ1MDB9.y83Qn53yyOsWS8W2-9nt7pU6i7MOwCm8_8pIu4l90gg'}'
      };
      final response = await http.get(Uri.parse(EndPoints.baseUrl + EndPoints.brand + makeData + modelData),headers: headers);

      if (response.statusCode == 200) {
        carMakeListResponse.value = CarMakeListResponse();
        carMakeListResponse.value = CarMakeListResponse.fromJson(json.decode(response.body));
      }
      else {
      }
      carMakeList.value=[];
      carModelList.value=[];
      carVariantList.value=[];

      carMakeList.value = buildDropdownItems(carMakeListResponse.value.data?.toSet() ?? []);
      if (make != null && make.isNotEmpty) {
        carModelList.value = buildDropdownModelItems(carMakeListResponse.value.data?.toSet() ?? []);
      }
      if (model != null && model.isNotEmpty) {
        carVariantList.value = buildDropdownModelItems(carMakeListResponse.value.data?.toSet() ?? []);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void onChangeCarMake(selectedValue){
    selectedMake.value = Data();
    selectedMake.value = selectedValue;
    getCarBrands(make: selectedMake.value.make);
  }

  void onChangeCarModel(selectedValue){
    selectedModel.value = Data();
    selectedModel.value = selectedValue;
    getCarBrands(make: selectedModel.value.make,model: selectedModel.value.model);
  }
  void onChangeCarVariant(selectedValue){
    selectedVariant.value = Data();
    selectedVariant.value = selectedValue;
  }

  List<DropdownMenuItem<Object?>> buildDropdownItems(Iterable<Data> testList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(
            i.make??"",
            style: const TextStyle(color: MyColors.black, overflow: TextOverflow.ellipsis),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<Object?>> buildDropdownModelItems(Iterable<Data> testList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(
            i.model??"",
            style: const TextStyle(color: MyColors.black, overflow: TextOverflow.ellipsis),
          ),
        ),
      );
    }
    return items;
  }


}