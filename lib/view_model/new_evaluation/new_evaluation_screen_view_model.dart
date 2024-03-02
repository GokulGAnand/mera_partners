import 'dart:convert';
import 'dart:developer';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/service/endpoints.dart';
import 'package:evaluator_app/utils/constants.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:evaluator_app/utils/globals.dart' as globals;
import '../../model/request/new_evaluation/create_evaluation_request.dart';
import '../../model/response/new_evaluation/car_make_response.dart' as make;
import '../../model/response/new_evaluation/car_model_variant_response.dart';
import '../../service/exception_error_util.dart';
import '../../utils/colors.dart';
import '../../widgets/progressbar.dart';

class NewEvaluationViewModel extends GetxController {
  List<String> modelList = <String>[];
  List<String> variantList = <String>[];
  List<String> makeList = <String>[];

  var isPage1Fill = false.obs;
  var isPage2Fill = false.obs;
  var isPage3Fill = false.obs;
  var isPage4Fill = false.obs;

  final Rx<PageController> pageController = PageController(initialPage: 0).obs;

  // the index of the current page
  var activePage = 0.obs;

  ///page 1
  var selectedRegistered = "".obs;

  ///page 2
  var selectedFuelType = "".obs;
  var selectedOwnerShip = "".obs;
  var selectedRegState = "".obs;
  var selectedVehicleLocation = "".obs;
  var selectedEngineCC = "".obs;

  ///page 3
  var selectedVehicleUsage = "".obs;
  var selectedMake = ''.obs;
  var selectedModel = ''.obs;
  var selectedVariant = ''.obs;
  var selectedColor = "".obs;
  var selectedBodyType = "".obs;
  var selectedSeats = "".obs;
  var selectedDupKey = "".obs;
  var selectedMonth = "".obs;
  var selectedYear = "".obs;

  ///page 4
  var selectedRCAvailability = "".obs;
  var selectedTransmission = "".obs;
  var selectedAccidental = "".obs;
  var selectedOEMRemaining = "".obs;
  var selectedOdometerWorking = "".obs;

  ///dropdown input list data
  List<String> yesNoList = Constants.yesNoList;
  List<String> registeredList = Constants.registeredList;
  List<String> seatList = Constants.seatList;
  List<String> duplicateKeyList = Constants.yesNoList;
  List<String> rcAvailabilityList = Constants.rcAvailabilityList;
  List<String> lengthList = Constants.lengthList;
  List<String> ownerShipList = Constants.ownerShipList;
  List<String> fuelTypeList = Constants.fuelTypeList;
  List<String> bodyTypeList = Constants.bodyTypeList;
  List<String> vehicleUsageList = Constants.vehicleUsageList;
  List<String> transmissionList = Constants.transmissionList;
  List<String> ccClassList = Constants.ccClassList;
  List<String> ccList = Constants.engineCCList;
  List<String> colorList = Constants.carColors;
  List<String> indianStatesList = Constants.indianStates;
  List<String> keralaDistrictsList = Constants.keralaDistricts;

  var carMakeListResponse = make.CarMakeListResponse().obs;
  var carModelVariantListResponse = CarModelVariantListResponse().obs;
  var carMakeList = [].obs;
  var carModelList = [].obs;
  var carVariantList = [].obs;

  final GlobalKey<FormState> page1Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page2Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page3Key = GlobalKey<FormState>();
  final GlobalKey<FormState> page4Key = GlobalKey<FormState>();

  ///page 1 controllers
  Rx<TextEditingController> sellerNameController = TextEditingController().obs;
  Rx<TextEditingController> sellerAddressController = TextEditingController().obs;
  Rx<TextEditingController> sellerPhoneNumController = TextEditingController().obs;
  Rx<TextEditingController> registrationNumberController = TextEditingController().obs;
  Rx<TextEditingController> chassisNumberController = TextEditingController().obs;
  Rx<TextEditingController> engineNumController = TextEditingController().obs;
  Rx<TextEditingController> rcOwnerNameController = TextEditingController().obs;
  Rx<TextEditingController> rcOwnerPhoneNumController = TextEditingController().obs;
  Rx<TextEditingController> regDateController = TextEditingController().obs;

  ///page 2 controllers
  Rx<TextEditingController> regValidityController = TextEditingController().obs;
  Rx<TextEditingController> taxValidityController = TextEditingController().obs;
  Rx<TextEditingController> rtoController = TextEditingController().obs;
  Rx<TextEditingController> noOfCylindersController = TextEditingController().obs;
  Rx<TextEditingController> otherOwnershipController = TextEditingController().obs;
  Rx<TextEditingController> otherEngineCCController = TextEditingController().obs;

  ///page 3 controllers
  Rx<TextEditingController> manufacturingYearController = TextEditingController().obs;

  ///page 4 controllers
  Rx<TextEditingController> customerPriceController = TextEditingController().obs;
  Rx<TextEditingController> noOfMonthsRemainingController = TextEditingController().obs;
  Rx<TextEditingController> odometerReadingController = TextEditingController().obs;
  Rx<TextEditingController> noOfKmsRemainingController = TextEditingController().obs;
  Rx<TextEditingController> remarksController = TextEditingController().obs;

  @override
  void onInit() {
    getCarBrands();
    super.onInit();
  }

  void getCarBrands() async {
    try {
      var headers = {'Authorization': 'Bearer ${globals.token}'};
      final response = await http.get(Uri.parse(EndPoints.baseUrl + EndPoints.brand), headers: headers);

      if (kDebugMode) {
        print(response.body.toString());
      }
      if (response.statusCode == 200) {
        carMakeListResponse.value = make.CarMakeListResponse.fromJson(json.decode(response.body));
        for (int i = 0; i < carMakeListResponse.value.data!.length; i++) {
          makeList.add(carMakeListResponse.value.data![i].document?.make ?? "");
        }
      } else {}
    } catch (e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  void getCarModelVariant({String? make, String? model}) async {
    try {
      String? makeData = make != null && make.isNotEmpty ? '?make=$make' : '';
      String? modelData = model != null && model.isNotEmpty ? '&model=$model' : '';
      var headers = {'Authorization': 'Bearer ${globals.token}'};
      final response = await http.get(Uri.parse(EndPoints.baseUrl + EndPoints.brand + makeData + modelData), headers: headers);

      if (kDebugMode) {
        print(response.body.toString());
      }
      if (response.statusCode == 200) {
        carModelVariantListResponse.value = CarModelVariantListResponse();
        carModelVariantListResponse.value = CarModelVariantListResponse.fromJson(json.decode(response.body));
      } else {}

      if (make != null && make.isNotEmpty) {
        for (int i = 0; i < carModelVariantListResponse.value.data!.length; i++) {
          modelList.add(carModelVariantListResponse.value.data![i].model ?? "");
        }
      }
      if (model != null && model.isNotEmpty) {
        for (int i = 0; i < carModelVariantListResponse.value.data!.length; i++) {
          variantList.add(carModelVariantListResponse.value.data![i].variant ?? "");
        }
      }
    } catch (e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  void addNewEvaluation() async {
    ProgressBar.instance.showProgressbar(Get.context!);
    try {
      var headers = {'Authorization': 'Bearer ${globals.token}','Content-Type': 'application/json',};

      CreateEvaluationRequest createEvaluationRequest = CreateEvaluationRequest();

      createEvaluationRequest.make = selectedMake.value;
      createEvaluationRequest.model = selectedModel.value;
      createEvaluationRequest.variant = selectedVariant.value;
      createEvaluationRequest.rto = rtoController.value.text;
      createEvaluationRequest.vehicleLocation = selectedVehicleLocation.value;
      createEvaluationRequest.engineCylinder = noOfCylindersController.value.text.isNotEmpty ? int.parse(noOfCylindersController.value.text) : null;
      createEvaluationRequest.fuelType = selectedFuelType.value;
      createEvaluationRequest.monthAndYearOfManufacture = '${selectedMonth.value} ${selectedYear.value}';
      createEvaluationRequest.ownershipNumber = selectedOwnerShip.value == 'Other' ? otherOwnershipController.value.text : selectedOwnerShip.value;
      createEvaluationRequest.regDate = regDateController.value.text;
      createEvaluationRequest.regValidity = regValidityController.value.text;
      createEvaluationRequest.taxValidity = taxValidityController.value.text;
      createEvaluationRequest.regState = selectedRegState.value;
      createEvaluationRequest.bodyType = selectedBodyType.value;
      createEvaluationRequest.vehicleUsage = selectedVehicleUsage.value;
      createEvaluationRequest.duplicateKey = selectedDupKey.value;
      createEvaluationRequest.rcAvailability = selectedRCAvailability.value;
      createEvaluationRequest.engineCC = selectedEngineCC.value == 'Other' ? otherEngineCCController.value.text : selectedEngineCC.value;
      createEvaluationRequest.engineNumber = engineNumController.value.text;
      createEvaluationRequest.chasisNumber = chassisNumberController.value.text;
      createEvaluationRequest.color = selectedColor.value;
      createEvaluationRequest.seats = selectedSeats.value;
      createEvaluationRequest.odometerWorking = selectedOdometerWorking.value;
      createEvaluationRequest.odometerReading = odometerReadingController.value.text.isNotEmpty ? int.parse(odometerReadingController.value.text) : null;
      createEvaluationRequest.accidential = selectedAccidental.value;
      createEvaluationRequest.oemWarrantyRemain = selectedOEMRemaining.value;
      createEvaluationRequest.oemMonthRemain = noOfMonthsRemainingController.value.text.isNotEmpty ? int.parse(noOfMonthsRemainingController.value.text) : null;
      createEvaluationRequest.oemKmRemain = noOfKmsRemainingController.value.text;
      createEvaluationRequest.isCarRegistered = selectedRegistered.value;
      createEvaluationRequest.regNumber = registrationNumberController.value.text;
      createEvaluationRequest.sellerName = sellerNameController.value.text;
      createEvaluationRequest.rcOwnerName = rcOwnerNameController.value.text;
      createEvaluationRequest.sellerAddress = sellerAddressController.value.text;
      createEvaluationRequest.sellerMobileNumber = sellerPhoneNumController.value.text.isNotEmpty ? int.parse(sellerPhoneNumController.value.text) : null;
      createEvaluationRequest.rcOwnerMobileNumber = rcOwnerPhoneNumController.value.text.isNotEmpty ? int.parse(rcOwnerPhoneNumController.value.text) : null;
      createEvaluationRequest.customerPrice = customerPriceController.value.text;
      createEvaluationRequest.transmission = selectedTransmission.value;
      createEvaluationRequest.remarks = remarksController.value.text;
      if (kDebugMode) {
        print(jsonEncode(createEvaluationRequest));
      }
      final response = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.evaluation), body: json.encode(createEvaluationRequest), headers: headers);
      log(Uri.parse(EndPoints.baseUrl + EndPoints.evaluation).toString());
log(response.statusCode.toString());
log(response.body.toString());
      if (response.statusCode == 200) {
        ProgressBar.instance.stopProgressBar(Get.context!);
        CustomToast.instance.showMsg(MyStrings.success);
        Get.offNamed(AppRoutes.homeScreen);
        // Get.back();
      }else{
        ProgressBar.instance.stopProgressBar(Get.context!);
      }

      if (kDebugMode) {
        print(response.body.toString());
      }
    } catch (e) {
      ProgressBar.instance.stopProgressBar(Get.context!);
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? '');
    }
  }

  void onChangeCarMake(selectedValue) {
    selectedMake.value = selectedValue;
    getCarModelVariant(make: selectedMake.value);
    update();
    refresh();
    notifyChildrens();
  }

  void onChangeCarRegistered(selectedValue) {
    selectedRegistered.value = '';
    selectedRegistered.value = selectedValue;
    update();
    refresh();
    notifyChildrens();
  }

  void onChangeCarModel(selectedValue) {
    // selectedModel.value = Data();
    selectedModel.value = selectedValue;
    getCarModelVariant(make: selectedMake.value, model: selectedModel.value);
    update();
    refresh();
    notifyChildrens();
  }

  void onChangeCarVariant(selectedValue) {
    // selectedVariant.value = Data();
    selectedVariant.value = selectedValue;
  }

  List<DropdownMenuItem<Object?>> buildDropdownItems(List<make.Data> testList) {
    List<DropdownMenuItem<Object?>> items = [];
    for (var i in testList) {
      items.add(
        DropdownMenuItem(
          value: i,
          child: Text(
            i.document?.make ?? "",
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
            i.model ?? "",
            style: const TextStyle(color: MyColors.black, overflow: TextOverflow.ellipsis),
          ),
        ),
      );
    }
    return items;
  }
}
