 import 'dart:developer';

import 'package:evaluator_app/view_model/dashboard/exterior/exterior_screen_view_model.dart';
import 'package:evaluator_app/view_model/new_evaluation/new_evaluation_screen_view_model.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../service/internet_check.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimens.dart';
import '../../../utils/images.dart';
import '../../../utils/strings.dart';
import '../../../utils/styles.dart';
import '../../../utils/validate_input.dart';
import '../../../widgets/common_app_bar.dart';
import '../../../widgets/common_drawer.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/image_picker_card.dart';

/// ignore: must_be_immutable
class ExteriorScreen extends StatelessWidget {
  ExteriorScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget>? pages;
  ExteriorViewModel viewModel = Get.find<ExteriorViewModel>();

  Widget pageOne() {
    return Obx(
          () => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            canPop: viewModel.isPage1Fill.value,
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.frontImage}*",
                    helperText: "${MyStrings.frontImage}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.frontLeftImage}*",
                    helperText: "${MyStrings.frontLeftImage}*",
                    validator: viewModel.exteriorCompartmentImage.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.exteriorCompartmentImage.value == null
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.frontRightImage}*",
                    helperText: "${MyStrings.frontRightImage}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.leftImage}*",
                    helperText: "${MyStrings.leftImage}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rightImage}*",
                    helperText: "${MyStrings.rightImage}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rearLeftImage}*",
                    helperText: "${MyStrings.rearLeftImage}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rearImage}*",
                    helperText: "${MyStrings.rearImage}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rearRight}*",
                    helperText: "${MyStrings.rearRight}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.roofImage}*",
                    helperText: "${MyStrings.roofImage}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.frontWindShieldWiper}*",
                    helperText: "${MyStrings.frontWindShieldWiper}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                      onPressed:() {
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
            canPop: viewModel.isPage1Fill.value,
            key: viewModel.page2Key,
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rearWindShield}*",
                    helperText: "${MyStrings.rearWindShield}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.doorGlassLH}*",
                    helperText: "${MyStrings.doorGlassLH}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.doorGlassRH}*",
                    helperText: "${MyStrings.doorGlassRH}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.quarterGlass}*",
                    helperText: "${MyStrings.quarterGlass}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.headlightsLH}*",
                    helperText: "${MyStrings.headlightsLH}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.headlightsRH}*",
                    helperText: "${MyStrings.headlightsRH}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: MyStrings.headlightSupport,
                    helperText: MyStrings.headlightSupport,
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.frontBumper}*",
                    helperText: "${MyStrings.frontBumper}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rearBumper}*",
                    helperText: "${MyStrings.rearBumper}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.frontGrill}*",
                    helperText: "${MyStrings.frontGrill}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                      onPressed:() {
                        if (viewModel.page2Key.currentState!.validate()) {
                          viewModel.page2Key.currentState!.save();
                          viewModel.isPage2Fill.value = true;
                          viewModel.pageController.value.animateToPage(
                            2,
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

  Widget pageThree() {
    return Obx(() => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            canPop: viewModel.isPage1Fill.value,
            key: viewModel.page3Key,
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: MyStrings.bonnetPatti,
                    helperText: MyStrings.bonnetPatti,
                    validator: (p0) => null,
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
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.upperCrossMember}*",
                    helperText: "${MyStrings.upperCrossMember}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                      child: SvgPicture.asset(MyImages.arrowDown,width: 2,height: 2),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.lowerCrossMember}*",
                    helperText: "${MyStrings.lowerCrossMember}*",
                    validator: ValidateInput.validateRequiredFields,
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
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: MyStrings.apronLH,
                    helperText: MyStrings.apronLH,
                    validator: (p0) => null,
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
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: MyStrings.apronRH,
                    helperText: MyStrings.apronRH,
                    validator: (p0) => null,
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
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: MyStrings.cowlTop,
                    helperText: MyStrings.cowlTop,
                    validator: (p0) => null,
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
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: MyStrings.chassisExtension,
                    helperText: MyStrings.chassisExtension,
                    validator: (p0) => null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );

                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.tyreFrontRHS}*",
                    helperText: "${MyStrings.tyreFrontRHS}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.tyreFrontLHS}*",
                    helperText: "${MyStrings.tyreFrontLHS}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.tyreRearRHS}*",
                    helperText: "${MyStrings.tyreRearRHS}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
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
                      onPressed:() {
                        if (viewModel.page3Key.currentState!.validate()) {
                          viewModel.page3Key.currentState!.save();
                          viewModel.isPage3Fill.value = true;
                          viewModel.pageController.value.animateToPage(
                            3,
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

  Widget pageFour() {
    return Obx(
          () => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            canPop: viewModel.isPage1Fill.value,
            key: viewModel.page4Key,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.tyreRearLHS}*",
                    helperText: "${MyStrings.tyreRearLHS}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.lhFender}*",
                    helperText: "${MyStrings.lhFender}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rhFender}*",
                    helperText: "${MyStrings.rhFender}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.lhQuarterPanel}*",
                    helperText: "${MyStrings.lhQuarterPanel}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rhQuarterPanel}*",
                    helperText: "${MyStrings.rhQuarterPanel}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.frontLHDoor}*",
                    helperText: "${MyStrings.frontLHDoor}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rearLHDoor}*",
                    helperText: "${MyStrings.rearLHDoor}*",
                    validator: ValidateInput.validateRequiredFields,
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
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.frontRHDoor}*",
                    helperText: "${MyStrings.frontRHDoor}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rearRHDoor}*",
                    helperText: "${MyStrings.rearRHDoor}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.lhaPillar}*",
                    helperText: "${MyStrings.lhaPillar}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                      child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
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
                      onPressed:() {
                        if (viewModel.page4Key.currentState!.validate()) {
                          viewModel.page4Key.currentState!.save();
                          viewModel.isPage4Fill.value = true;
                          viewModel.pageController.value.animateToPage(
                            4,
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

  Widget pageFive() {
    return Obx(
          () => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            canPop: viewModel.isPage1Fill.value,
            key: viewModel.page5Key,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rhaPillar}*",
                    helperText: "${MyStrings.rhaPillar}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.lhbPillar}*",
                    helperText: "${MyStrings.lhbPillar}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rhbPillar}*",
                    helperText: "${MyStrings.rhbPillar}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.lhcPillar}*",
                    helperText: "${MyStrings.lhcPillar}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rhcPillar}*",
                    helperText: "${MyStrings.rhcPillar}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.lhRunBoard}*",
                    helperText: "${MyStrings.lhRunBoard}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rhRunBoard}*",
                    helperText: "${MyStrings.rhRunBoard}*",
                    validator: ValidateInput.validateRequiredFields,
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
                      context: Get.context!,
                      builder: (context) => ImagePickerCard(
                        remarksController: viewModel.frontImage.value,
                        image: viewModel.exteriorCompartmentImage,
                        onSubmit: () {
                          Navigator.of(context).pop();
                          log(viewModel.exteriorCompartmentImage.value.toString());
                        },
                      ),
                    );
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.tailLightLh}*",
                    helperText: "${MyStrings.tailLightLh}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.tailLightRh}*",
                    helperText: "${MyStrings.tailLightRh}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rearWiper}*",
                    helperText: "${MyStrings.rearWiper}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                      child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
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
                      onPressed:() {
                        if (viewModel.page5Key.currentState!.validate()) {
                          viewModel.page5Key.currentState!.save();
                          viewModel.isPage5Fill.value = true;
                          viewModel.pageController.value.animateToPage(
                            5,
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

  Widget pageSix() {
    return Obx(
          () => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            canPop: viewModel.isPage1Fill.value,
            key: viewModel.page6Key,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.boot}*",
                    helperText: "${MyStrings.boot}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.dickyDoor}*",
                    helperText: "${MyStrings.dickyDoor}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.spareWheel}*",
                    helperText: "${MyStrings.spareWheel}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.jackAndTool}*",
                    helperText: "${MyStrings.jackAndTool}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.lhRearViewMirror}*",
                    helperText: "${MyStrings.lhRearViewMirror}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rhRearViewMirror}*",
                    helperText: "${MyStrings.rhRearViewMirror}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.fuelLid}*",
                    helperText: "${MyStrings.fuelLid}*",
                    validator: ValidateInput.validateRequiredFields,
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
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: MyStrings.firewall,
                    helperText: MyStrings.firewall,
                    validator: ValidateInput.validateRequiredFields,
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
                CustomTextFormField(
                  controller: viewModel.missingPartsController.value,
                  labelText: "${MyStrings.missingParts}*",
                  helperText: "${MyStrings.missingParts}*",
                  validator: ValidateInput.validateRequiredFields,
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.fullBodyRepaint}*",
                    helperText: "${MyStrings.fullBodyRepaint}*",
                    validator: ValidateInput.validateRequiredFields,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: Padding(
                      padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                      child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
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
                      onPressed:() {
                        if (viewModel.page6Key.currentState!.validate()) {
                          viewModel.page6Key.currentState!.save();
                          viewModel.isPage6Fill.value = true;
                          if (viewModel.isPage1Fill.value && viewModel.isPage2Fill.value && viewModel.isPage3Fill.value && viewModel.isPage4Fill.value && viewModel.isPage5Fill.value && viewModel.isPage6Fill.value) {
                            Internet.checkInternet().then((value) {
                              if (value) {
                                // viewModel.add();
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
    pages = [pageOne(), pageTwo(), pageThree(), pageFour(), pageFive(), pageSix()];
    return Obx(() => PopScope(
      // onPopInvoked: (didPop) {
      //   if (didPop == true || didPop == false) {
      //     // showConfirmDialog(context);
      //   }
      // },
      canPop: true,
      child: Scaffold(
        key: _key,
        appBar: CommonAppBar(
          centerTitle: false,
          title: MyStrings.exterior,
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
