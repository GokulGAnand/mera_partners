import 'dart:developer';
import 'package:evaluator_app/service/internet_check.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/dimens.dart';
import 'package:evaluator_app/utils/images.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/validate_input.dart';
import 'package:evaluator_app/view_model/dashboard/interior/interior_screen_view_model.dart';
import 'package:evaluator_app/widgets/common_app_bar.dart';
import 'package:evaluator_app/widgets/common_drawer.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_checkbox_dialog.dart';
import 'package:evaluator_app/widgets/custom_dropdown.dart';
import 'package:evaluator_app/widgets/custom_text_form_field.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:evaluator_app/widgets/image_picker_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/methods.dart';

class InteriorScreen extends StatelessWidget {
  InteriorScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget>? pages;
  InteriorViewModel viewModel = Get.isRegistered<InteriorViewModel>() ? Get.find<InteriorViewModel>() : Get.put(InteriorViewModel());

  Widget pageOne(BuildContext context) {
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
                     await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                            title: MyStrings.clusterPanel, 
                            items: viewModel.clusterPanel, 
                            selectItem: viewModel.selectClusterPanel,
                            image: viewModel.clusterImage,
                            remarksController : viewModel.clusterPanelRemarksController.value,
                            othersController: viewModel.clusterPanelOtherController.value,
                          );
                      },
                    );
                    viewModel.clusterPanelController.value.text = viewModel.selectClusterPanel.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.clusterPanelController.value,
                    labelText: "${MyStrings.clusterPanel}*",
                    helperText: "${MyStrings.clusterPanel}*",
                    validator: (value) {
                      return ValidateInput.validateRequiredFieldsImage(value, viewModel.clusterImage.value);
                    },
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                      child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomDropDown(
                  hintText: "${MyStrings.warningLight}*",
                  label: viewModel.selectWarningLight.value.isEmpty ? null : "${MyStrings.warningLight}*",
                  value: viewModel.selectWarningLight.value.isEmpty ? null : viewModel.selectWarningLight.value,
                  items: viewModel.yesNoList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value.toLowerCase(),
                      child: Text(
                        value,
                        style: MyStyles.dropdownMenuStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    viewModel.selectWarningLight.value = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return MyStrings.required;
                    }
                    return null;
                  },
                ),
                Obx(
                  () {
                    if(viewModel.selectWarningLight.value.toLowerCase() == "yes") {
                       return Padding(
                        padding: EdgeInsets.only(top: Dimens.standard_24),
                        child: CustomTextFormField(
                          controller: viewModel.warningDetailsController.value, 
                          labelText: "${MyStrings.warningDetails}*",
                          helperText: "${MyStrings.warningDetails}*",
                          validator: ValidateInput.validateRequiredFields),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
               GestureDetector(
                  onTap: () async {
                     await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                            title: MyStrings.dashboardImage, 
                            items: viewModel.dashboardImageList, 
                            selectItem: viewModel.selectDashboardImage,
                            image: viewModel.dashboardImage,
                            remarksController : viewModel.dashboardRemarksController.value,
                            othersController: TextEditingController(),
                          );
                      },
                    );
                    viewModel.dashboardImageController.value.text = viewModel.selectDashboardImage.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.dashboardImageController.value,
                    labelText: "${MyStrings.dashboardImage}*",
                    helperText: "${MyStrings.dashboardImage}*",
                    validator: (value) {
                      return ValidateInput.validateRequiredFieldsImage(value, viewModel.dashboardImage.value);
                    },
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: (viewModel.dashboardImage.value == null) ?Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    ):const Icon(Icons.done_rounded,color: MyColors.green,),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
               GestureDetector(
                  onTap: () async {
                     await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                            title: MyStrings.frontSeatImage, 
                            items: viewModel.frontSeatImageList, 
                            selectItem: viewModel.selectFrontSeatImage,
                            image: viewModel.frontSeatImage,
                            remarksController : viewModel.frontSeatRemarksController.value,
                            othersController: TextEditingController(),
                          );
                      },
                    );
                    viewModel.frontSeatImageController.value.text = viewModel.selectFrontSeatImage.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.frontSeatImageController.value,
                    labelText: "${MyStrings.frontSeatImage}*",
                    helperText: "${MyStrings.frontSeatImage}*",
                    validator: (value) {
                      return ValidateInput.validateRequiredFieldsImage(value, viewModel.frontSeatImage.value);
                    },
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon:  viewModel.frontSeatImage.value == null ?Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    ):const Icon(Icons.done_rounded,color: MyColors.green,),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
               GestureDetector(
                  onTap: () async {
                     await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                            title: MyStrings.rearSeatImage,  
                            items: viewModel.rearSeatImageList, 
                            selectItem: viewModel.selectRearSeatImage,
                            image: viewModel.rearSeatImage,
                            remarksController : viewModel.rearSeatRemarksController.value,
                            othersController: TextEditingController(),
                          );
                      },
                    );
                    viewModel.rearSeatImageController.value.text = viewModel.selectRearSeatImage.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rearSeatImageController.value,
                    labelText: "${MyStrings.rearSeatImage}*",
                    helperText: "${MyStrings.rearSeatImage}*",
                    validator: (value) {
                      return ValidateInput.validateRequiredFieldsImage(value, viewModel.rearSeatImage.value);
                    },
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon:  viewModel.rearSeatImage.value == null ?Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    ):const Icon(Icons.done_rounded,color: MyColors.green,),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                     await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                            title: MyStrings.insideRearViewMirror,  
                            items: viewModel.insideRearViewMirror, 
                            selectItem: viewModel.selectInsideRearViewMirror,
                            image: viewModel.insideRearViewMirrorImage,
                            remarksController : viewModel.insideRearViewMirrorRemarksController.value,
                            othersController: TextEditingController(),
                          );
                      },
                    );
                    viewModel.insideRearViewMirrorController.value.text = viewModel.selectInsideRearViewMirror.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.insideRearViewMirrorController.value,
                    labelText: "${MyStrings.insideRearViewMirror}*",
                    helperText: "${MyStrings.insideRearViewMirror}*",
                    validator: (value) {
                      return ValidateInput.validateRequiredFieldsImage(value, viewModel.insideRearViewMirrorImage.value);
                    },
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                      child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
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
                      context: Get.context!, builder: (context) =>
                        ImagePickerCard(
                          remarksController: viewModel.interiorViewFromBootDashboardRemarksController.value,
                          image:  viewModel.interiorViewFromBootDashboardImage,
                          onSubmit: (){
                            Navigator.of(context).pop();
                           log( viewModel.interiorViewFromBootDashboardImage.value.toString());
                          },
                        ),);
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.interiorViewFromBootDashboard}*",
                    helperText: "${MyStrings.interiorViewFromBootDashboard}*",
                    validator: (value) {
                      return ValidateInput.validateRequiredFieldsImage(value, viewModel.interiorViewFromBootDashboardImage.value);
                    },
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.interiorViewFromBootDashboardImage.value == null ?Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    ):const Icon(Icons.done_rounded,color: MyColors.green,),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
               GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: Get.context!, builder: (context) =>
                        ImagePickerCard(
                          remarksController: viewModel.powerWindowDriverRemarksController.value,
                          image:  viewModel.powerWindowDriverImage,
                          onSubmit: (){
                            Navigator.of(context).pop();
                           log( viewModel.powerWindowDriverImage.value.toString());
                          },
                        ),);
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.powerWindowDriverImage}*",
                    helperText: "${MyStrings.powerWindowDriverImage}*",
                    validator: (value) {
                      return ValidateInput.validateRequiredFieldsImage(value, viewModel.powerWindowDriverImage.value);
                    },
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.powerWindowDriverImage.value == null ?Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    ):const Icon(Icons.done_rounded,color: MyColors.green,),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
               GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: Get.context!, builder: (context) =>
                        ImagePickerCard(
                          remarksController: viewModel.pushWindowDriverRemarksController.value,
                          image:  viewModel.pushWindowDriverImage,
                          onSubmit: (){
                            Navigator.of(context).pop();
                           log( viewModel.pushWindowDriverImage.value.toString());
                          },
                        ),);
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.pushWindowDriverImage}*",
                    helperText: "${MyStrings.pushWindowDriverImage}*",
                    validator: (value) {
                      return ValidateInput.validateRequiredFieldsImage(value, viewModel.pushWindowDriverImage.value);
                    },
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.pushWindowDriverImage.value == null ?Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    ):const Icon(Icons.done_rounded,color: MyColors.green,),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
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

  Widget pageTwo(BuildContext context) {
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
                CustomDropDown(
                  hintText: "${MyStrings.pushButtonOnOff}*",
                  label: viewModel.selectPushButtonOnOff.value.isEmpty ? null : "${MyStrings.pushButtonOnOff}*",
                  value: viewModel.selectPushButtonOnOff.value.isEmpty ? null : viewModel.selectPushButtonOnOff.value,
                  items: viewModel.pushButtonOnOff.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value.toLowerCase(),
                      child: Text(
                        value,
                        style: MyStyles.dropdownMenuStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    viewModel.selectPushButtonOnOff.value = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return MyStrings.required;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomDropDown(
                  hintText: "${MyStrings.dashboardSwitches}*",
                  label: viewModel.selectDashboardSwitches.value.isEmpty ? null : "${MyStrings.dashboardSwitches}*",
                  value: viewModel.selectDashboardSwitches.value.isEmpty ? null : viewModel.selectDashboardSwitches.value,
                  items: viewModel.dashboardSwitches.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value.toLowerCase(),
                      child: Text(
                        value,
                        style: MyStyles.dropdownMenuStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    viewModel.selectDashboardSwitches.value = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return MyStrings.required;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                     await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                            title: MyStrings.powerWindowAndWindowLock,  
                            items: viewModel.powerWindowAndWindowLock, 
                            selectItem: viewModel.selectPowerWindowAndWindowLock,
                            image: viewModel.powerWindowAndWindowLockImage,
                            remarksController : viewModel.powerWindowAndWindowLockRemarksController.value,
                            othersController: TextEditingController(),
                          );
                      },
                    );
                    viewModel.powerWindowAndWindowLockController.value.text = viewModel.selectPowerWindowAndWindowLock.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.powerWindowAndWindowLockController.value,
                    labelText: "${MyStrings.powerWindowAndWindowLock}*",
                    helperText: "${MyStrings.powerWindowAndWindowLock}*",
                    validator: (value) {
                      return ValidateInput.validateRequiredFieldsImage(value, viewModel.powerWindowAndWindowLockImage.value);
                    },
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                      child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                     await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                            title: MyStrings.handBrake,  
                            items: viewModel.handBrake, 
                            selectItem: viewModel.selectHandBrake,
                            image: viewModel.handBreakImage,
                            remarksController : viewModel.handBrakeRemarksController.value,
                            othersController: TextEditingController(),
                          );
                      },
                    );
                    viewModel.handBrakeController.value.text = viewModel.selectHandBrake.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.handBrakeController.value,
                    labelText: "${MyStrings.handBrake}*",
                    helperText: "${MyStrings.handBrake}*",
                    validator: (value) {
                      return ValidateInput.validateRequiredFieldsImage(value, viewModel.handBreakImage.value);
                    },
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                      child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                     await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                            title: MyStrings.carElectrical,  
                            items: viewModel.carElectrical, 
                            selectItem: viewModel.selectCarElectrical,
                            image: viewModel.carElectricalImage,
                            remarksController : viewModel.carElectricalRemarksController.value,
                            othersController: TextEditingController(),
                          );
                      },
                    );
                    viewModel.carElectricalController.value.text = viewModel.selectCarElectrical.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.carElectricalController.value,
                    labelText: "${MyStrings.carElectrical}*",
                    helperText: "${MyStrings.carElectrical}*",
                    validator: (value) {
                      return ValidateInput.validateRequiredFieldsImage(value, viewModel.carElectricalImage.value);
                    },
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                      child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
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
                      context: Get.context!, builder: (context) =>
                        ImagePickerCard(
                          remarksController: viewModel.cngLpgKitImageRemarksController.value,
                          image:  viewModel.cngLpgKitImage,
                          onSubmit: (){
                            Navigator.of(context).pop();
                           log( viewModel.cngLpgKitImage.value.toString());
                          },
                        ),);
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.cngLpgKitImage}*",
                    helperText: "${MyStrings.cngLpgKitImage}*",
                    validator: (value) {
                      return ValidateInput.validateRequiredFieldsImage(value, viewModel.cngLpgKitImage.value);
                    },
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.cngLpgKitImage.value == null ?Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    ):const Icon(Icons.done_rounded,color: MyColors.green,),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomDropDown(
                  hintText: "${MyStrings.secondKey}*",
                  label: viewModel.selectSecondKey.value.isEmpty ? null : "${MyStrings.secondKey}*",
                  value: viewModel.selectSecondKey.value.isEmpty ? null : viewModel.selectSecondKey.value,
                  items: viewModel.secondKey.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value.toLowerCase(),
                      child: Text(
                        value,
                        style: MyStyles.dropdownMenuStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    viewModel.selectSecondKey.value = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return MyStrings.required;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                     await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                            title: MyStrings.platform,  
                            items: viewModel.platform, 
                            selectItem: viewModel.selectPlatform,
                            image: viewModel.platformImage,
                            remarksController : viewModel.platformRemarksController.value,
                            othersController: TextEditingController(),
                          );
                      },
                    );
                    viewModel.platformController.value.text = viewModel.selectPlatform.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.platformController.value,
                    labelText: "${MyStrings.platform}*",
                    helperText: "${MyStrings.platform}*",
                    validator: (value) {
                      return ValidateInput.validateRequiredFieldsImage(value, viewModel.platformImage.value);
                    },
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                      child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                SizedBox(
                  height: 70,
                  child: Center(
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (viewModel.page2Key.currentState!.validate()) {
                          viewModel.page2Key.currentState!.save();
                          viewModel.isPage2Fill.value = true;
                          if (viewModel.isPage1Fill.value && viewModel.isPage2Fill.value){
                          Internet.checkInternet().then((value){
                            if(value){
                              viewModel.addInteriorInfo();
                            }else{
                              CustomToast.instance.showMsg(MyStrings.checkNetwork);
                            }
                          });
                        }else{
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

  @override
  Widget build(BuildContext context) {
    pages = [pageOne(context), pageTwo(context),];
    return Obx(() => PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Methods.showConfirmDialog(context);
      },
      child: Scaffold(
        key: _key,
        appBar: CommonAppBar(
          centerTitle: false,
          title: MyStrings.interior,
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