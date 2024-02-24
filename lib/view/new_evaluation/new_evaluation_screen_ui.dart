import 'package:evaluator_app/utils/constants.dart';
import 'package:evaluator_app/view_model/new_evaluation/new_evaluation_screen_view_model.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../service/internet_check.dart';
import '../../utils/colors.dart';
import '../../utils/dimens.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';
import '../../utils/validate_input.dart';
import '../../widgets/common_app_bar.dart';
import '../../widgets/common_drawer.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_dialog.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_text_form_field.dart';

/// ignore: must_be_immutable
class NewEvaluationScreen extends StatelessWidget {
  NewEvaluationScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget>? pages;
  NewEvaluationViewModel viewModel = Get.find<NewEvaluationViewModel>();

  /*selectYear(context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Select Year",
            style: TextStyle(color: MyColors.blue, overflow: TextOverflow.ellipsis, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          content: SizedBox(
            width: 300,
            height: 300,
            child: Obx(
              () => YearPicker(
                firstDate: DateTime(
                  DateTime.now().year - 32,
                ),
                lastDate: DateTime.now(),
                selectedDate: viewModel.selectedYear.value,
                onChanged: (DateTime dateTime) {
                  viewModel.selectedYear.value = dateTime;
                  viewModel.manufacturingYearController.value.text = dateTime.year.toString();
                  // Navigator.pop(context);
                },
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(MyStrings.cancel)),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(MyStrings.ok)),
          ],
        );
      },
    );
  }*/

  Widget pageOne() {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.page1Key,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  controller: viewModel.sellerNameController.value,
                  labelText: MyStrings.sellerName,
                  helperText: MyStrings.sellerName,
                  keyboardType: TextInputType.name,
                  inputFormatter: [
                    LengthLimitingTextInputFormatter(Constants.maxInputLength),
                  ],
                  validator: (p0) {
                    return null;
                  },
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomTextFormField(
                  controller: viewModel.sellerAddressController.value,
                  labelText: MyStrings.sellerAddress,
                  helperText: MyStrings.sellerAddress,
                  keyboardType: TextInputType.streetAddress,
                  minLines: 3,
                  maxLines: 3,
                  inputFormatter: [
                    LengthLimitingTextInputFormatter(Constants.maxInputLength),
                  ],
                  validator: (p0) => null,
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomTextFormField(
                  controller: viewModel.sellerPhoneNumController.value,
                  labelText: MyStrings.sellerPhoneNumber,
                  helperText: MyStrings.sellerPhoneNumber,
                  keyboardType: TextInputType.phone,
                  inputFormatter: [LengthLimitingTextInputFormatter(Constants.phoneLength), FilteringTextInputFormatter.digitsOnly],
                  validator: ValidateInput.validatePhoneNumber,
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                Obx(
                  () => CustomDropDown(
                    hintText: "${MyStrings.registered}*",
                    label: viewModel.selectedRegistered.value.isEmpty ? null : "${MyStrings.registered}*",
                    value: viewModel.selectedRegistered.value.isEmpty ? null : viewModel.selectedRegistered.value,
                    items: viewModel.registeredList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: viewModel.onChangeCarRegistered,
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                if (viewModel.selectedRegistered.value == 'Yes' || viewModel.selectedRegistered.value == 'Scrap')
                  Obx(
                    () => CustomTextFormField(
                      controller: viewModel.registrationNumberController.value,
                      labelText: "${MyStrings.registrationNumber}*",
                      helperText: "${MyStrings.registrationNumber}*",
                      validator: ValidateInput.validateRequiredFields,
                    ),
                  ),
                if (viewModel.selectedRegistered.value == 'Yes' || viewModel.selectedRegistered.value == 'Scrap')
                  SizedBox(
                    height: Dimens.standard_24,
                  ),
                if (viewModel.selectedRegistered.value == 'No')
                  Obx(
                    () => CustomTextFormField(
                      controller: viewModel.chassisNumberController.value,
                      labelText: "${MyStrings.chassisNumber}*",
                      helperText: "${MyStrings.chassisNumber}*",
                      validator: ValidateInput.validateRequiredFields,
                    ),
                  ),
                if (viewModel.selectedRegistered.value == 'No')
                  SizedBox(
                    height: Dimens.standard_24,
                  ),
                CustomTextFormField(
                  controller: viewModel.engineNumController.value,
                  labelText: "${MyStrings.engineNumber}*",
                  helperText: "${MyStrings.engineNumber}*",
                  validator: ValidateInput.validateRequiredFields,
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomTextFormField(
                  controller: viewModel.rcOwnerNameController.value,
                  labelText: '${MyStrings.rcOwnerName}*',
                  helperText: '${MyStrings.rcOwnerName}*',
                  validator: ValidateInput.validateRequiredFields,
                  keyboardType: TextInputType.name,
                  inputFormatter: [
                    LengthLimitingTextInputFormatter(Constants.maxInputLength),
                  ],
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomTextFormField(
                  controller: viewModel.rcOwnerPhoneNumController.value,
                  labelText: MyStrings.rcOwnerPhoneNumber,
                  helperText: MyStrings.rcOwnerPhoneNumber,
                  keyboardType: TextInputType.phone,
                  inputFormatter: [LengthLimitingTextInputFormatter(Constants.phoneLength), FilteringTextInputFormatter.digitsOnly],
                  validator: ValidateInput.validatePhoneNumber,
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now(),
                      context: Get.context!,
                    );
                    if (selectedDate != null) {
                      viewModel.regDateController.value.text = DateFormat('dd/MM/yyyy').format(selectedDate).toString();
                    }
                  },
                  child: CustomTextFormField(
                    controller: viewModel.regDateController.value,
                    labelText: "${MyStrings.registrationDate}*",
                    helperText: "${MyStrings.registrationDate}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: InkWell(
                      onTap: () async {
                        final selectedDate = await showDatePicker(
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime.now(),
                          context: Get.context!,
                        );
                        if (selectedDate != null) {
                          viewModel.regDateController.value.text = DateFormat('dd/MM/yyyy').format(selectedDate).toString();
                        }
                      },
                      child: const Icon(
                        Icons.calendar_today_outlined,
                        color: MyColors.grey,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_48,
                ),
                Obx(
                  () => SizedBox(
                    height: 70,
                    child: Center(
                      child: CustomElevatedButton(
                        onPressed: /*viewModel.engineNumController.value.text.isNotEmpty && viewModel.rcOwnerNameController.value.text.isNotEmpty*//* && viewModel.regDateController.value.text.isNotEmpty && (viewModel.registrationNumberController.value.text.isNotEmpty || viewModel.chassisNumberController.value.text.isNotEmpty)*//*
                            ?*/ () {
                                if (viewModel.page1Key.currentState!.validate()) {
                                  viewModel.page1Key.currentState!.save();
                                  viewModel.isPage1Fill.value = true;
                                  viewModel.pageController.value.animateToPage(
                                    1,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.linear,
                                  );
                                }
                              }
                            /*: null*/,
                        buttonText: MyStrings.next,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pageTwo() {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.page2Key,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now(),
                      context: Get.context!,
                    );
                    if (selectedDate != null) {
                      viewModel.regValidityController.value.text = DateFormat('dd/MM/yyyy').format(selectedDate).toString();
                    }
                  },
                  child: CustomTextFormField(
                    controller: viewModel.regValidityController.value,
                    labelText: "${MyStrings.registrationValidity}*",
                    helperText: "${MyStrings.registrationValidity}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: InkWell(
                      onTap: () async {
                        final selectedDate = await showDatePicker(
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime.now(),
                          context: Get.context!,
                        );
                        if (selectedDate != null) {
                          viewModel.regValidityController.value.text = DateFormat('dd/MM/yyyy').format(selectedDate).toString();
                        }
                      },
                      child: const Icon(
                        Icons.calendar_today_outlined,
                        color: MyColors.grey,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime.now(),
                      context: Get.context!,
                    );
                    if (selectedDate != null) {
                      viewModel.taxValidityController.value.text = DateFormat('dd/MM/yyyy').format(selectedDate).toString();
                    }
                  },
                  child: CustomTextFormField(
                    controller: viewModel.taxValidityController.value,
                    labelText: "${MyStrings.taxValidity}*",
                    helperText: "${MyStrings.taxValidity}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: InkWell(
                      onTap: () async {
                        final selectedDate = await showDatePicker(
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1990),
                          lastDate: DateTime.now(),
                          context: Get.context!,
                        );
                        if (selectedDate != null) {
                          viewModel.taxValidityController.value.text = DateFormat('dd/MM/yyyy').format(selectedDate).toString();
                        }
                      },
                      child: const Icon(
                        Icons.calendar_today_outlined,
                        color: MyColors.grey,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return viewModel.fuelTypeList;
                    }
                    return viewModel.fuelTypeList.where((String option) {
                      return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (option) {
                    viewModel.selectedFuelType.value = option;
                  },
                  fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      validator: ValidateInput.validateRequiredFields,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(color: MyColors.black),
                        contentPadding: EdgeInsets.fromLTRB(16.0, 18.0, 0.0, 18.0),
                        hintText: '${MyStrings.fuelType}*',
                        labelText: '${MyStrings.fuelType}*',
                        filled: true,
                        fillColor: MyColors.white,
                        hintStyle: TextStyle(color: MyColors.greyMedium, fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400
                            // fontSize:10,
                            ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        focusColor: MyColors.red,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey),
                        ),
                        labelStyle: TextStyle(height: 0.5, color: MyColors.blue, fontSize: 15, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal),
                      ),
                    );
                  },
                ),
                /*Obx(() => CustomDropDown(
                      hintText: "${MyStrings.fuelType}*",
                      label: viewModel.selectedFuelType.value.isEmpty
                          ? null
                          : "${MyStrings.fuelType}*",
                      value: viewModel.selectedFuelType.value.isEmpty
                          ? null
                          : viewModel.selectedFuelType.value,
                      items: viewModel.fuelTypeList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: MyStyles.dropdownMenuStyle,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        viewModel.selectedFuelType.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    )),*/
                SizedBox(
                  height: Dimens.standard_24,
                ),
                Obx(
                  () => CustomDropDown(
                    hintText: "${MyStrings.ownershipNumber}*",
                    label: viewModel.selectedOwnerShip.value.isEmpty ? null : "${MyStrings.ownershipNumber}*",
                    value: viewModel.selectedOwnerShip.value.isEmpty ? null : viewModel.selectedOwnerShip.value,
                    items: viewModel.ownerShipList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedOwnerShip.value = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                if (viewModel.selectedOwnerShip.value == 'Other')
                  CustomTextFormField(
                    controller: viewModel.otherOwnershipController.value,
                    labelText: "${MyStrings.ownershipNumber}*",
                    helperText: "${MyStrings.ownershipNumber}*",
                    validator: ValidateInput.validateRequiredFields,
                    inputFormatter: [LengthLimitingTextInputFormatter(Constants.maxInputLength)],
                  ),
                if (viewModel.selectedOwnerShip.value == 'Other')
                  SizedBox(
                    height: Dimens.standard_24,
                  ),
                /*Obx(
                  () => CustomDropDown(
                    hintText: "${MyStrings.regState}*",
                    label: viewModel.selectedRegState.value.isEmpty
                        ? null
                        : "${MyStrings.regState}*",
                    value: viewModel.selectedRegState.value.isEmpty
                        ? null
                        : viewModel.selectedRegState.value,
                    items: viewModel.indianStatesList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedRegState.value = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                ),*/
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return viewModel.indianStatesList;
                    }
                    return viewModel.indianStatesList.where((String option) {
                      return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (option) {
                    viewModel.selectedRegState.value = option;
                  },
                  fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      validator: ValidateInput.validateRequiredFields,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(color: MyColors.black),
                        contentPadding: EdgeInsets.fromLTRB(16.0, 18.0, 0.0, 18.0),
                        hintText: '${MyStrings.regState}*',
                        labelText: '${MyStrings.regState}*',
                        filled: true,
                        fillColor: MyColors.white,
                        hintStyle: TextStyle(color: MyColors.greyMedium, fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400
                            // fontSize:10,
                            ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        focusColor: MyColors.red,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey),
                        ),
                        labelStyle: TextStyle(height: 0.5, color: MyColors.blue, fontSize: 15, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomTextFormField(
                  controller: viewModel.rtoController.value,
                  labelText: "${MyStrings.rto}*",
                  helperText: "${MyStrings.rto}*",
                  validator: ValidateInput.validateRequiredFields,
                  inputFormatter: [LengthLimitingTextInputFormatter(Constants.maxInputLength)],
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                /*Obx(
                  () => CustomDropDown(
                    hintText: "${MyStrings.vehicleLocation}*",
                    label: viewModel.selectedVehicleLocation.value.isEmpty
                        ? null
                        : "${MyStrings.vehicleLocation}*",
                    value: viewModel.selectedVehicleLocation.value.isEmpty
                        ? null
                        : viewModel.selectedVehicleLocation.value,
                    items: viewModel.keralaDistrictsList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedVehicleLocation.value = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                ),*/
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return viewModel.keralaDistrictsList;
                    }
                    return viewModel.keralaDistrictsList.where((String option) {
                      return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (option) {
                    viewModel.selectedVehicleLocation.value = option;
                  },
                  fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      validator: ValidateInput.validateRequiredFields,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(color: MyColors.black),
                        contentPadding: EdgeInsets.fromLTRB(16.0, 18.0, 0.0, 18.0),
                        hintText: '${MyStrings.vehicleLocation}*',
                        labelText: '${MyStrings.vehicleLocation}*',
                        filled: true,
                        fillColor: MyColors.white,
                        hintStyle: TextStyle(color: MyColors.greyMedium, fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400
                            // fontSize:10,
                            ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        focusColor: MyColors.red,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey),
                        ),
                        labelStyle: TextStyle(height: 0.5, color: MyColors.blue, fontSize: 15, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                /*Obx(
                  () => CustomDropDown(
                    hintText: "${MyStrings.engineCC}*",
                    label: viewModel.selectedEngineCC.value.isEmpty
                        ? null
                        : "${MyStrings.engineCC}*",
                    value: viewModel.selectedEngineCC.value.isEmpty
                        ? null
                        : viewModel.selectedEngineCC.value,
                    items: viewModel.ccList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedEngineCC.value = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                ),*/
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return viewModel.ccList;
                    }
                    return viewModel.ccList.where((String option) {
                      return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (option) {
                    viewModel.selectedEngineCC.value = option;
                  },
                  fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      validator: ValidateInput.validateRequiredFields,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(color: MyColors.black),
                        contentPadding: EdgeInsets.fromLTRB(16.0, 18.0, 0.0, 18.0),
                        hintText: '${MyStrings.engineCC}*',
                        labelText: '${MyStrings.engineCC}*',
                        filled: true,
                        fillColor: MyColors.white,
                        hintStyle: TextStyle(color: MyColors.greyMedium, fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400
                            // fontSize:10,
                            ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        focusColor: MyColors.red,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey),
                        ),
                        labelStyle: TextStyle(height: 0.5, color: MyColors.blue, fontSize: 15, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                if (viewModel.selectedEngineCC.value == 'Other')
                  CustomTextFormField(
                    controller: viewModel.otherEngineCCController.value,
                    labelText: "${MyStrings.engineCC}*",
                    helperText: "${MyStrings.engineCC}*",
                    validator: ValidateInput.validateRequiredFields,
                    inputFormatter: [LengthLimitingTextInputFormatter(Constants.maxInputLength)],
                  ),
                if (viewModel.selectedEngineCC.value == 'Other')
                  SizedBox(
                    height: Dimens.standard_24,
                  ),
                CustomTextFormField(
                  labelText: MyStrings.noOfCylinders,
                  helperText: MyStrings.noOfCylinders,
                  keyboardType: TextInputType.number,
                  inputFormatter: [LengthLimitingTextInputFormatter(Constants.maxInputLength)],
                  controller: viewModel.noOfCylindersController.value,
                  validator: (p0) => null,
                ),
                SizedBox(
                  height: Dimens.standard_48,
                ),
                SizedBox(
                  height: 70,
                  child: Center(
                    child: CustomElevatedButton(
                      onPressed: /*viewModel.regValidityController.value.text.isNotEmpty && viewModel.taxValidityController.value.text.isNotEmpty && viewModel.selectedFuelType.value.isNotEmpty && viewModel.selectedOwnerShip.value.isNotEmpty && viewModel.selectedRegState.value.isNotEmpty && viewModel.rtoController.value.text.isNotEmpty && viewModel.selectedVehicleLocation.value.isNotEmpty && viewModel.selectedEngineCC.value.isNotEmpty
                          ?*/ () {
                              if (viewModel.page2Key.currentState!.validate()) {
                                viewModel.isPage2Fill.value = true;
                                viewModel.page2Key.currentState!.save();
                                viewModel.pageController.value.animateToPage(
                                  2,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear,
                                );
                              }
                            }
                          /*: null*/,
                      buttonText: MyStrings.next,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pageThree() {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.page3Key,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),

                Obx(
                  () => CustomDropDown(
                    hintText: "${MyStrings.vehicleUsage}*",
                    label: viewModel.selectedVehicleUsage.value.isEmpty ? null : "${MyStrings.vehicleUsage}*",
                    value: viewModel.selectedVehicleUsage.value.isEmpty ? null : viewModel.selectedVehicleUsage.value,
                    items: viewModel.vehicleUsageList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedVehicleUsage.value = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                MonthYearPicker(initialYear: DateTime.now().year, startYear: 1992, endYear: DateTime.now().year, month: 1),
                /*GestureDetector(
                  onTap: () {
                    selectYear(Get.context);
                  },
                  child: CustomTextFormField(
                    controller: viewModel.manufacturingYearController.value,
                    labelText: "${MyStrings.manufacturingYear}*",
                    helperText: "${MyStrings.manufacturingYear}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: InkWell(
                      onTap: () async {
                        selectYear(Get.context);
                      },
                      child: const Icon(
                        Icons.calendar_today_outlined,
                        color: MyColors.grey,
                        size: 22,
                      ),
                    ),
                  ),
                ),*/
                SizedBox(
                  height: Dimens.standard_24,
                ),
                /*if( viewModel.carMakeList.isNotEmpty)
                  Obx(() => CustomDropDown(
                    hintText: "${MyStrings.carMake}*",
                    label: viewModel.selectedMake.value.document?.make == null
                        ? null
                        : "${MyStrings.carMake}*",
                    value: viewModel.selectedMake.value.document?.make == null
                        ? null
                        : viewModel.selectedMake.value,
                    items: viewModel.carMakeList.cast<DropdownMenuItem<Object?>>(),
                    onChanged: viewModel.onChangeCarMake,
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                  ),*/
                if (viewModel.makeList.isNotEmpty)
                  Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return viewModel.makeList;
                      }
                      return viewModel.makeList.where((String option) {
                        return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    onSelected: viewModel.onChangeCarMake,
                    fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                      return TextFormField(
                        controller: textEditingController,
                        focusNode: focusNode,
                        validator: ValidateInput.validateRequiredFields,
                        decoration: const InputDecoration(
                          helperStyle: TextStyle(color: MyColors.black),
                          contentPadding: EdgeInsets.fromLTRB(16.0, 18.0, 0.0, 18.0),
                          hintText: '${MyStrings.carMake}*',
                          labelText: '${MyStrings.carMake}*',
                          filled: true,
                          fillColor: MyColors.white,
                          hintStyle: TextStyle(color: MyColors.greyMedium, fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400
                              // fontSize:10,
                              ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: MyColors.grey),
                            borderRadius: BorderRadius.all(
                              Radius.circular(4.0),
                            ),
                          ),
                          focusColor: MyColors.red,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: MyColors.grey, width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(color: MyColors.grey),
                          ),
                          labelStyle: TextStyle(height: 0.5, color: MyColors.blue, fontSize: 15, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal),
                        ),
                      );
                    },
                  ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                // if( viewModel.carModelList.isNotEmpty)
                /*Obx(() => CustomDropDown(
                  hintText: "${MyStrings.carModel}*",
                  label: viewModel.selectedModel.value.model == null
                      ? null
                      : "${MyStrings.carModel}*",
                  value: viewModel.selectedModel.value.make == null
                      ? null
                      : viewModel.selectedModel.value,
                  items: viewModel.carModelList.cast<DropdownMenuItem<Object?>>(),
                  onChanged: viewModel.onChangeCarModel,
                  validator: (value) {
                    if (value == null) {
                      return MyStrings.required;
                    }
                    return null;
                  },
                ),
                ),*/
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return viewModel.modelList;
                    }
                    return viewModel.modelList.where((String option) {
                      return option.contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: viewModel.onChangeCarModel,
                  fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      validator: ValidateInput.validateRequiredFields,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(color: MyColors.black),
                        contentPadding: EdgeInsets.fromLTRB(16.0, 18.0, 0.0, 18.0),
                        hintText: '${MyStrings.carModel}*',
                        labelText: '${MyStrings.carModel}*',
                        filled: true,
                        fillColor: MyColors.white,
                        hintStyle: TextStyle(color: MyColors.greyMedium, fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400
                            // fontSize:10,
                            ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        focusColor: MyColors.red,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey),
                        ),
                        labelStyle: TextStyle(height: 0.5, color: MyColors.blue, fontSize: 15, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return viewModel.variantList;
                    }
                    return viewModel.variantList.where((String option) {
                      return option.contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: viewModel.onChangeCarVariant,
                  fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      validator: ValidateInput.validateRequiredFields,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(color: MyColors.black),
                        contentPadding: EdgeInsets.fromLTRB(16.0, 18.0, 0.0, 18.0),
                        hintText: '${MyStrings.variant}*',
                        labelText: '${MyStrings.variant}*',
                        filled: true,
                        fillColor: MyColors.white,
                        hintStyle: TextStyle(color: MyColors.greyMedium, fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400
                            // fontSize:10,
                            ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        focusColor: MyColors.red,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey),
                        ),
                        labelStyle: TextStyle(height: 0.5, color: MyColors.blue, fontSize: 15, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal),
                      ),
                    );
                  },
                ),
                /*Obx(() => CustomDropDown(
                  hintText: "${MyStrings.variant}*",
                  label: viewModel.selectedVariant.value.variant == null
                      ? null
                      : "${MyStrings.variant}*",
                  value: viewModel.selectedVariant.value.variant == null
                      ? null
                      : viewModel.selectedVariant.value,
                  items: viewModel.carVariantList.cast<DropdownMenuItem<Object?>>(),
                  onChanged: viewModel.onChangeCarVariant,
                  validator: (value) {
                    if (value == null) {
                      return MyStrings.required;
                    }
                    return null;
                  },
                ),
                ),*/
                SizedBox(
                  height: Dimens.standard_24,
                ),
                /*Obx(() => CustomDropDown(
                    hintText: "${MyStrings.color}*",
                    label: viewModel.selectedColor.value.isEmpty
                        ? null
                        : "${MyStrings.color}*",
                    value: viewModel.selectedColor.value.isEmpty
                        ? null
                        : viewModel.selectedColor.value,
                    items: viewModel.colorList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedColor.value = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                ),*/
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return viewModel.colorList;
                    }
                    return viewModel.colorList.where((String option) {
                      return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (option) {
                    viewModel.selectedColor.value = option;
                  },
                  fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      validator: ValidateInput.validateRequiredFields,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(color: MyColors.black),
                        contentPadding: EdgeInsets.fromLTRB(16.0, 18.0, 0.0, 18.0),
                        hintText: '${MyStrings.color}*',
                        labelText: '${MyStrings.color}*',
                        filled: true,
                        fillColor: MyColors.white,
                        hintStyle: TextStyle(color: MyColors.greyMedium, fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400
                            // fontSize:10,
                            ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        focusColor: MyColors.red,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey),
                        ),
                        labelStyle: TextStyle(height: 0.5, color: MyColors.blue, fontSize: 15, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return viewModel.bodyTypeList;
                    }
                    return viewModel.bodyTypeList.where((String option) {
                      return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (option) {
                    viewModel.selectedBodyType.value = option;
                  },
                  fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      validator: ValidateInput.validateRequiredFields,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(color: MyColors.black),
                        contentPadding: EdgeInsets.fromLTRB(16.0, 18.0, 0.0, 18.0),
                        hintText: '${MyStrings.bodyType}*',
                        labelText: '${MyStrings.bodyType}*',
                        filled: true,
                        fillColor: MyColors.white,
                        hintStyle: TextStyle(color: MyColors.greyMedium, fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400
                            // fontSize:10,
                            ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        focusColor: MyColors.red,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey),
                        ),
                        labelStyle: TextStyle(height: 0.5, color: MyColors.blue, fontSize: 15, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal),
                      ),
                    );
                  },
                ),
                /*Obx(
                  () => CustomDropDown(
                    hintText: "${MyStrings.bodyType}*",
                    label: viewModel.selectedBodyType.value.isEmpty
                        ? null
                        : "${MyStrings.bodyType}*",
                    value: viewModel.selectedBodyType.value.isEmpty
                        ? null
                        : viewModel.selectedBodyType.value,
                    items: viewModel.bodyTypeList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedBodyType.value = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                ),*/
                SizedBox(
                  height: Dimens.standard_24,
                ),
                /*Obx(
                  () => CustomDropDown(
                    hintText: MyStrings.seats,
                    label: viewModel.selectedSeats.value.isEmpty
                        ? null
                        : MyStrings.seats,
                    value: viewModel.selectedSeats.value.isEmpty
                        ? null
                        : viewModel.selectedSeats.value,
                    items: viewModel.seatList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedSeats.value = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                ),*/
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return viewModel.seatList;
                    }
                    return viewModel.seatList.where((String option) {
                      return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                    });
                  },
                  onSelected: (option) {
                    viewModel.selectedSeats.value = option;
                  },
                  fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) {
                    return TextFormField(
                      controller: textEditingController,
                      focusNode: focusNode,
                      validator: (value) => null,
                      decoration: const InputDecoration(
                        helperStyle: TextStyle(color: MyColors.black),
                        contentPadding: EdgeInsets.fromLTRB(16.0, 18.0, 0.0, 18.0),
                        hintText: MyStrings.seats,
                        labelText: MyStrings.seats,
                        filled: true,
                        fillColor: MyColors.white,
                        hintStyle: TextStyle(color: MyColors.greyMedium, fontSize: 16, fontStyle: FontStyle.normal, fontWeight: FontWeight.w400
                            // fontSize:10,
                            ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: MyColors.grey),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        focusColor: MyColors.red,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(color: MyColors.grey),
                        ),
                        labelStyle: TextStyle(height: 0.5, color: MyColors.blue, fontSize: 15, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                Obx(
                  () => CustomDropDown(
                    hintText: '${MyStrings.duplicateKey}*',
                    label: viewModel.selectedDupKey.value.isEmpty ? null : '${MyStrings.duplicateKey}*',
                    value: viewModel.selectedDupKey.value.isEmpty ? null : viewModel.selectedDupKey.value,
                    items: viewModel.duplicateKeyList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedDupKey.value = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                ),
                /*SizedBox(
                  height: Dimens.standard_24,
                ),
                Obx(
                  () => CustomDropDown(
                    hintText: "${MyStrings.ccClass}*",
                    label: viewModel.selectedCCClass.value.isEmpty
                        ? null
                        : "${MyStrings.ccClass}*",
                    value: viewModel.selectedCCClass.value.isEmpty
                        ? null
                        : viewModel.selectedCCClass.value,
                    items: viewModel.ccClassList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedCCClass.value = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                ),*/

                SizedBox(
                  height: Dimens.standard_48,
                ),
                SizedBox(
                  height: 70,
                  child: Center(
                    child: CustomElevatedButton(
                      onPressed: /*viewModel.selectedVehicleUsage.value.isNotEmpty *//*&& viewModel.manufacturingYearController.value.text.isNotEmpty && viewModel.selectedMake.value.isNotEmpty && viewModel.selectedVariant.value.isNotEmpty && viewModel.selectedColor.value.isNotEmpty && viewModel.selectedBodyType.value.isNotEmpty && viewModel.selectedDupKey.value.isNotEmpty*//*
                          ?*/ () {
                              if (viewModel.page3Key.currentState!.validate()) {
                                viewModel.isPage3Fill.value = true;
                                viewModel.page3Key.currentState!.save();
                                viewModel.pageController.value.animateToPage(
                                  3,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear,
                                );
                              }
                            }
                          /*: null*/,
                      buttonText: MyStrings.next,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pageFour() {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.page4Key,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Obx(() => CustomDropDown(
                      hintText: "${MyStrings.rcAvailability}*",
                      label: viewModel.selectedRCAvailability.value.isEmpty ? null : "${MyStrings.rcAvailability}*",
                      value: viewModel.selectedRCAvailability.value.isEmpty ? null : viewModel.selectedRCAvailability.value,
                      items: viewModel.rcAvailabilityList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: MyStyles.dropdownMenuStyle,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        viewModel.selectedRCAvailability.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    )),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                Obx(() => CustomDropDown(
                      hintText: "${MyStrings.transmission}*",
                      label: viewModel.selectedTransmission.value.isEmpty ? null : "${MyStrings.transmission}*",
                      value: viewModel.selectedTransmission.value.isEmpty ? null : viewModel.selectedTransmission.value,
                      items: viewModel.transmissionList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: MyStyles.dropdownMenuStyle,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        viewModel.selectedTransmission.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    )),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomTextFormField(
                  controller: viewModel.customerPriceController.value,
                  labelText: "${MyStrings.customerPrice}*",
                  helperText: "${MyStrings.customerPrice}*",
                  validator: ValidateInput.validateRequiredFields,
                  keyboardType: TextInputType.number,
                  inputFormatter: [LengthLimitingTextInputFormatter(Constants.amountLength)],
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                Obx(
                  () => CustomDropDown(
                    hintText: "${MyStrings.odometerWorking}*",
                    label: viewModel.selectedOdometerWorking.value.isEmpty ? null : "${MyStrings.odometerWorking}*",
                    value: viewModel.selectedOdometerWorking.value.isEmpty ? null : viewModel.selectedOdometerWorking.value,
                    items: viewModel.yesNoList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedOdometerWorking.value = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                if (viewModel.selectedOdometerWorking.value == 'Yes')
                  CustomTextFormField(
                    controller: viewModel.odometerReadingController.value,
                    labelText: '${MyStrings.odometerReading}*',
                    helperText: '${MyStrings.odometerReading}*',
                    validator: ValidateInput.validateRequiredFields,
                    keyboardType: TextInputType.number,
                    inputFormatter: [LengthLimitingTextInputFormatter(Constants.maxInputLength)],
                  ),
                if (viewModel.selectedOdometerWorking.value == 'Yes')
                  SizedBox(
                    height: Dimens.standard_24,
                  ),
                Obx(
                  () => CustomDropDown(
                    hintText: "${MyStrings.accidental}*",
                    label: viewModel.selectedAccidental.value.isEmpty ? null : "${MyStrings.accidental}*",
                    value: viewModel.selectedAccidental.value.isEmpty ? null : viewModel.selectedAccidental.value,
                    items: viewModel.yesNoList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedAccidental.value = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                Obx(
                  () => CustomDropDown(
                    hintText: MyStrings.oEMWarrantyRemaining,
                    label: viewModel.selectedOEMRemaining.value.isEmpty ? null : MyStrings.oEMWarrantyRemaining,
                    value: viewModel.selectedOEMRemaining.value.isEmpty ? null : viewModel.selectedOEMRemaining.value,
                    items: viewModel.yesNoList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedOEMRemaining.value = value;
                    },
                    validator: (value) {
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomTextFormField(
                  controller: viewModel.noOfMonthsRemainingController.value,
                  labelText: MyStrings.noOfMonthsRemaining,
                  helperText: MyStrings.noOfMonthsRemaining,
                  validator: (p0) => null,
                  keyboardType: TextInputType.number,
                  inputFormatter: [LengthLimitingTextInputFormatter(5), FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomTextFormField(
                  controller: viewModel.noOfKmsRemainingController.value,
                  labelText: MyStrings.noOfKmsRemaining,
                  helperText: MyStrings.noOfKmsRemaining,
                  validator: (p0) => null,
                  keyboardType: TextInputType.number,
                  inputFormatter: [LengthLimitingTextInputFormatter(10), FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomTextFormField(
                  controller: viewModel.remarksController.value,
                  labelText: MyStrings.remarks,
                  helperText: MyStrings.remarks,
                  minLines: 3,
                  maxLines: 3,
                  validator: (p0) => null,
                  inputFormatter: [
                    LengthLimitingTextInputFormatter(Constants.maxTextLength),
                  ],
                ),
                SizedBox(
                  height: Dimens.standard_48,
                ),
                SizedBox(
                  height: 70,
                  child: Center(
                    child: CustomElevatedButton(
                      onPressed: /*viewModel.selectedRCAvailability.value.isNotEmpty && viewModel.selectedTransmission.value.isNotEmpty && viewModel.customerPriceController.value.text.isNotEmpty && viewModel.selectedOdometerWorking.value.isNotEmpty && viewModel.selectedAccidental.value.isNotEmpty
                          ? */() {
                              if (viewModel.page4Key.currentState!.validate()) {
                                viewModel.page4Key.currentState!.save();
                                viewModel.isPage4Fill.value = true;
                                if (viewModel.isPage1Fill.value && viewModel.isPage2Fill.value && viewModel.isPage3Fill.value && viewModel.isPage4Fill.value) {
                                  Internet.checkInternet().then((value) {
                                    if (value) {
                                      viewModel.addNewEvaluation();
                                    } else {
                                      CustomToast.instance.showMsg(MyStrings.checkNetwork);
                                    }
                                  });
                                } else {
                                  CustomToast.instance.showMsg(MyStrings.vMandatory);
                                }
                              }
                            }
                          /*: null*/,
                      buttonText: MyStrings.submit,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showConfirmDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => CustomDialog(
              title: MyStrings.required,
              okFun: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
              cancelFun: () {
                Navigator.of(context).pop();
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    pages = [pageOne(), pageTwo(), pageThree(), pageFour()];
    return Obx(() => PopScope(
          /*onPopInvoked: (didPop) {
            if (didPop == true || didPop == false) {
              showConfirmDialog(context);
            }
          },
          canPop: false,*/
          child: Scaffold(
            key: _key,
            appBar: CommonAppBar(
              centerTitle: false,
              title: MyStrings.newEvaluation1,
              leading: IconButton(
                icon: SvgPicture.asset(MyImages.menu),
                color: MyColors.black0,
                iconSize: 28,
                onPressed: () {
                  _key.currentState!.openDrawer();
                },
              ),
              actions: [
                Row(
                  children: [
                    Padding(
                      padding: Dimens.padding16,
                      child: SvgPicture.asset(
                        MyImages.notification,
                        width: Dimens.standard_24,
                        height: Dimens.standard_24,
                      ),
                    ),
                  ],
                )
              ],
            ),
            drawer: const CommonDrawer(),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                      child: Row(
                        children: [
                          Text(
                            MyStrings.page + (viewModel.activePage.value + 1).toString(),
                            style: MyStyles.blackW500F15Style,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 35, left: 5, right: 5),
                  child: Row(
                    children: List<Widget>.generate(
                        pages!.length,
                        (index) => Expanded(
                              child: InkWell(
                                onTap: () {
                                  viewModel.pageController.value.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                                },
                                child: Container(
                                  height: 6,
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  width: MediaQuery.of(context).size.width / pages!.length,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: viewModel.activePage.value == index ? MyColors.kPrimaryColor : MyColors.lightBlue,
                                  ),
                                ),
                              ),
                            )),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: PageView.builder(
                      controller: viewModel.pageController.value,
                      onPageChanged: (int page) {
                        viewModel.activePage.value = page;
                      },
                      itemCount: pages!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return pages![index % pages!.length];
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

/// ignore: must_be_immutable
class MonthYearPicker extends StatefulWidget {
  MonthYearPicker({required this.initialYear, required this.startYear, required this.endYear, this.currentYear, required this.month, super.key});

  late int initialYear;
  late int startYear;
  late int endYear;
  late int? currentYear;
  late int month;

  @override
  State<MonthYearPicker> createState() => _MonthPickerState();
}

class _MonthPickerState extends State<MonthYearPicker> {
  final List<String> _monthList = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
  final List<String> _yearList = [];
  late int selectedMonthIndex;
  late int selectedYearIndex;
  String selectedMonth = "";
  String selectedYear = "";

  @override
  void initState() {
    for (int i = widget.startYear; i <= widget.endYear; i++) {
      _yearList.add(i.toString());
    }
    selectedMonthIndex = widget.month - 1;
    selectedYearIndex = _yearList.indexOf(widget.currentYear?.toString() ?? widget.initialYear.toString());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        selectedMonth = _monthList[selectedMonthIndex];
        selectedYear = _yearList[selectedYearIndex];
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Text(
                '${MyStrings.monthAndYearOfManufacture}*',
                style: TextStyle(height: 0.5, color: MyColors.blue, fontSize: 15, fontWeight: FontWeight.w500, fontStyle: FontStyle.normal),
              ),
            ],
          ),
        ),
        InputDecorator(
          decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
          child: SizedBox(
            height: 27,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: DropdownButton<String>(
                    underline: const SizedBox(),
                    items: _monthList.map((e) {
                      return DropdownMenuItem<String>(value: e, child: Text(e));
                    }).toList(),
                    value: selectedMonth,
                    onChanged: (val) {
                      setState(() {
                        selectedMonthIndex = _monthList.indexOf(val!);
                        selectedMonth = val;
                        Get.find<NewEvaluationViewModel>().selectedMonth.value = val;
                      });
                    },
                  ),
                ),
                // const SizedBox(width: 20),
                Expanded(
                  child: DropdownButton<String>(
                    underline: Container(),
                    items: _yearList.map((e) {
                      return DropdownMenuItem<String>(value: e, child: Text(e));
                    }).toList(),
                    value: selectedYear,
                    onChanged: (val) {
                      setState(() {
                        selectedYear = val ?? "";
                        Get.find<NewEvaluationViewModel>().selectedYear.value = val ?? "";
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
