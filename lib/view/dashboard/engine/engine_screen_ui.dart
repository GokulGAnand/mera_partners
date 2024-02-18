import 'dart:developer';
import 'package:evaluator_app/view_model/dashboard/engine/engine_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../service/internet_check.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/dimens.dart';
import '../../../utils/images.dart';
import '../../../utils/strings.dart';
import '../../../utils/styles.dart';
import '../../../utils/validate_input.dart';
import '../../../widgets/common_app_bar.dart';
import '../../../widgets/common_drawer.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/custom_toast.dart';
import '../../../widgets/image_picker_card.dart';

/// ignore: must_be_immutable
class EngineScreen extends StatelessWidget {
  EngineScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget>? pages;
  EngineViewModel viewModel = Get.find<EngineViewModel>();

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
                GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.engineCompartmentImageRemarks.value,
                        image: viewModel.engineCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.engineCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.engineCompartmentImage}*",
                    helperText: "${MyStrings.engineCompartmentImage}*",
                    validator: viewModel.engineCompartmentImage.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.engineCompartmentImage.value == null
                        ? Padding(
                            padding: Dimens.suffixPadding,
                            child: SvgPicture.asset(MyImages.upload),
                          )
                        : const Icon(
                            Icons.done_rounded,
                            color: MyColors.green,
                          ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                Obx(() => CustomDropDown(
                  hintText: "${MyStrings.engineSound}*",
                  label: viewModel.selectedEngineSound.value.isEmpty ? null : "${MyStrings.engineSound}*",
                  value: viewModel.selectedEngineSound.value.isEmpty ? null : viewModel.selectedEngineSound.value,
                  items: viewModel.engineSoundList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: MyStyles.dropdownMenuStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    viewModel.selectedEngineSound.value = value;
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
                //todo
                GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.otherEngineConditionController.value,
                        image: viewModel.engineCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.engineCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.engine}*",
                    helperText: "${MyStrings.engine}*",
                    validator: viewModel.engineCompartmentImage.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.engineCompartmentImage.value == null
                        ? Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    )
                        : const Icon(
                      Icons.done_rounded,
                      color: MyColors.green,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                Obx(
                  () => CustomDropDown(
                    hintText: "${MyStrings.smoke}*",
                    label: viewModel.selectedSmoke.value.isEmpty ? null : "${MyStrings.smoke}*",
                    value: viewModel.selectedSmoke.value.isEmpty ? null : viewModel.selectedSmoke.value,
                    items: viewModel.smokeList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedSmoke.value = value;
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
                GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.otherEngineConditionController.value,
                        image: viewModel.engineCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.engineCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.engineIdleStartVideo}*",
                    helperText: "${MyStrings.engineIdleStartVideo}*",
                    validator: viewModel.engineCompartmentImage.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.engineCompartmentImage.value == null
                        ? Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    )
                        : const Icon(
                      Icons.done_rounded,
                      color: MyColors.green,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.otherEngineConditionController.value,
                        image: viewModel.engineCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.engineCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.battery}*",
                    helperText: "${MyStrings.battery}*",
                    validator: viewModel.engineCompartmentImage.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.engineCompartmentImage.value == null
                        ? Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    )
                        : const Icon(
                      Icons.done_rounded,
                      color: MyColors.green,
                    ),
                  ),
                ),
                  SizedBox(
                    height: Dimens.standard_24,
                  ),
                Obx(
                      () => CustomDropDown(
                    hintText: "${MyStrings.radiator}*",
                    label: viewModel.selectedRadiator.value.isEmpty ? null : "${MyStrings.radiator}*",
                    value: viewModel.selectedRadiator.value.isEmpty ? null : viewModel.selectedRadiator.value,
                    items: viewModel.smokeList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedRadiator.value = value;
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
                    hintText: "${MyStrings.startingMotor}*",
                    label: viewModel.selectedStartingMotor.value.isEmpty ? null : "${MyStrings.startingMotor}*",
                    value: viewModel.selectedStartingMotor.value.isEmpty ? null : viewModel.selectedStartingMotor.value,
                    items: viewModel.startMotorList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedStartingMotor.value = value;
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
                    hintText: "${MyStrings.coolant}*",
                    label: viewModel.selectedCoolant.value.isEmpty ? null : "${MyStrings.coolant}*",
                    value: viewModel.selectedCoolant.value.isEmpty ? null : viewModel.selectedCoolant.value,
                    items: viewModel.coolantList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedCoolant.value = value;
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
                GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.otherEngineConditionController.value,
                        image: viewModel.blowByBackCompressionImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.blowByBackCompressionImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.blowByBackCompression}*",
                    helperText: "${MyStrings.blowByBackCompression}*",
                    validator: viewModel.engineCompartmentImage.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.engineCompartmentImage.value == null
                        ? Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    )
                        : const Icon(
                      Icons.done_rounded,
                      color: MyColors.green,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_48,
                ),
                SizedBox(
                  height: 70,
                  child: Center(
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (viewModel.page1Key.currentState!.validate()) {
                          viewModel.page1Key.currentState!.save();
                          viewModel.isPage1Fill.value = true;
                          viewModel.pageController.value.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        }
                      },
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
                Obx(() => CustomDropDown(
                      hintText: "${MyStrings.silencer}*",
                      label: viewModel.selectedSilencer.value.isEmpty ? null : "${MyStrings.silencer}*",
                      value: viewModel.selectedSilencer.value.isEmpty ? null : viewModel.selectedSilencer.value,
                      items: viewModel.silencerList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: MyStyles.dropdownMenuStyle,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        viewModel.selectedSilencer.value = value;
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
                GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.otherEngineConditionController.value,
                        image: viewModel.clutchOperationsImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.clutchOperationsImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.clutchOperations}*",
                    helperText: "${MyStrings.clutchOperations}*",
                    validator: viewModel.clutchOperationsImage.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.clutchOperationsImage.value == null
                        ? Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    )
                        : const Icon(
                      Icons.done_rounded,
                      color: MyColors.green,
                    ),
                  ),
                ),
                  SizedBox(
                    height: Dimens.standard_24,
                  ),
                GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.gearBoxImageRemarksController.value,
                        image: viewModel.gearBoxImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.gearbox}*",
                    helperText: "${MyStrings.gearbox}*",
                    validator: viewModel.gearBoxImage.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.gearBoxImage.value == null
                        ? Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    )
                        : const Icon(
                      Icons.done_rounded,
                      color: MyColors.green,
                    ),
                  ),
                ),
                SizedBox(
                    height: Dimens.standard_24,
                  ),
                GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.engineOilRemarksController.value,
                        image: viewModel.engineOilImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.engineOil}*",
                    helperText: "${MyStrings.engineOil}*",
                    validator: viewModel.engineOilImage.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.engineOilImage.value == null
                        ? Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    )
                        : const Icon(
                      Icons.done_rounded,
                      color: MyColors.green,
                    ),
                  ),
                ),
                SizedBox(
                    height: Dimens.standard_24,
                  ),

                GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.turboChargerRemarksController.value,
                        image: viewModel.turboChargerImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: MyStrings.turboCharger,
                    helperText: MyStrings.turboCharger,
                    validator: viewModel.turboChargerImage.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.turboChargerImage.value == null
                        ? Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    )
                        : const Icon(
                      Icons.done_rounded,
                      color: MyColors.green,
                    ),
                  ),
                ),
                  SizedBox(
                    height: Dimens.standard_24,
                  ),
                Obx(
                      () => CustomDropDown(
                    hintText: "${MyStrings.gearboxLeakage}*",
                    label: viewModel.selectedGearBoxLeak.value.isEmpty ? null : "${MyStrings.gearboxLeakage}*",
                    value: viewModel.selectedGearBoxLeak.value.isEmpty ? null : viewModel.selectedGearBoxLeak.value,
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
                      viewModel.selectedGearBoxLeak.value = value;
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
                  GestureDetector(
                    onTap: () async {
                      showDialog(
                        barrierDismissible: false,
                        context: Get.context!,
                        builder: (context) => ImagePickerCard(
                          remarksController: viewModel.engineMountRemarksController.value,
                          image: viewModel.engineMountImage,
                          onSubmit: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      );
                    },
                    child: CustomTextFormField(
                      controller: TextEditingController(),
                      labelText: MyStrings.engineMount,
                      helperText: MyStrings.engineMount,
                      validator: viewModel.engineMountImage.value == null ? ValidateInput.validateRequiredFields : null,
                      showCursor: false,
                      isEnabled: false,
                      suffixIcon: viewModel.engineMountImage.value == null
                          ? Padding(
                              padding: Dimens.suffixPadding,
                              child: SvgPicture.asset(MyImages.upload),
                            )
                          : const Icon(
                              Icons.done_rounded,
                              color: MyColors.green,
                            ),
                    ),
                  ),
                  SizedBox(
                    height: Dimens.standard_24,
                  ),
                GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.sumpRemarksController.value,
                        image: viewModel.sumpImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.sump}*",
                    helperText: "${MyStrings.sump}*",
                    validator: viewModel.sumpImage.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.sumpImage.value == null
                        ? Padding(
                            padding: Dimens.suffixPadding,
                            child: SvgPicture.asset(MyImages.upload),
                          )
                        : const Icon(
                            Icons.done_rounded,
                            color: MyColors.green,
                          ),
                  ),
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
                      onPressed: () {
                        if (viewModel.page2Key.currentState!.validate()) {
                          viewModel.page2Key.currentState!.save();
                          viewModel.isPage2Fill.value = true;
                          if (viewModel.isPage1Fill.value && viewModel.isPage2Fill.value) {
                            Internet.checkInternet().then((value) {
                              if (value) {
                                viewModel.updateEngine();
                              } else {
                                CustomToast.instance.showMsg(MyStrings.checkNetwork);
                              }
                            });
                          } else {
                            CustomToast.instance.showMsg(MyStrings.vMandatory);
                          }
                        }
                      },
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
              title: MyStrings.confirmDiscardChanges,
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
    pages = [
      pageOne(),
      pageTwo(),
    ];
    return Obx(() => PopScope(
          // onPopInvoked: (didPop) {
          //   showConfirmDialog(context);
          // },
          // canPop: false,
          child: Scaffold(
            key: _key,
            appBar: CommonAppBar(
              centerTitle: false,
              title: MyStrings.engine,
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
