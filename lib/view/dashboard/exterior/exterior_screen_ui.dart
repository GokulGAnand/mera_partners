import 'package:evaluator_app/view_model/dashboard/exterior/exterior_screen_view_model.dart';
import 'package:evaluator_app/view_model/new_evaluation/new_evaluation_screen_view_model.dart';
import 'package:evaluator_app/widgets/custom_dropdown.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../service/internet_check.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimens.dart';
import '../../../utils/images.dart';
import '../../../utils/methods.dart';
import '../../../utils/strings.dart';
import '../../../utils/styles.dart';
import '../../../utils/validate_input.dart';
import '../../../widgets/common_app_bar.dart';
import '../../../widgets/common_drawer.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_checkbox_dialog.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/custom_text_form_field.dart';

/// ignore: must_be_immutable
class ExteriorScreen extends StatelessWidget {
  ExteriorScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget>? pages;
  ExteriorViewModel viewModel = Get.find<ExteriorViewModel>();

  Widget pageOne(BuildContext context) {
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.frontImage,
                          items: viewModel.carCondition,
                          selectItem: viewModel.selectedFrontImageList,
                          image: viewModel.frontImage,
                          remarksController : viewModel.frontImageRemarks.value,
                          othersController: viewModel.otherFrontImageController.value,
                        );
                      },
                    );
                    viewModel.frontImageController.value.text = viewModel.selectedFrontImageList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.frontImageController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.frontLeftImage,
                          items: viewModel.carCondition,
                          selectItem: viewModel.selectedFrontLeftImageList,
                          image: viewModel.frontLeftImage,
                          remarksController : viewModel.frontLeftImageRemarks.value,
                          othersController: viewModel.otherFrontLeftImageController.value,
                        );
                      },
                    );
                    viewModel.frontLeftImageController.value.text = viewModel.selectedFrontLeftImageList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.frontLeftImageController.value,
                    labelText: "${MyStrings.frontLeftImage}*",
                    helperText: "${MyStrings.frontLeftImage}*",
                    validator: viewModel.frontLeftImage.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.frontLeftImage.value == null
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.frontRightImage,
                          items: viewModel.carCondition,
                          selectItem: viewModel.selectedFrontRightImageList,
                          image: viewModel.frontRightImage,
                          remarksController : viewModel.frontRightImageRemarks.value,
                          othersController: viewModel.otherFrontRightImageController.value,
                        );
                      },
                    );
                    viewModel.frontRightImageController.value.text = viewModel.selectedFrontRightImageList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.frontRightImageController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.leftImage,
                          items: viewModel.carCondition,
                          selectItem: viewModel.selectedLeftImageList,
                          image: viewModel.leftImage,
                          remarksController : viewModel.leftImageRemarks.value,
                          othersController: viewModel.otherLeftImageController.value,
                        );
                      },
                    );
                    viewModel.leftImageController.value.text = viewModel.selectedLeftImageList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.leftImageController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rightImage,
                          items: viewModel.carCondition,
                          selectItem: viewModel.selectedRightImageList,
                          image: viewModel.rightImage,
                          remarksController : viewModel.rightImageRemarks.value,
                          othersController: viewModel.otherRightImageController.value,
                        );
                      },
                    );
                    viewModel.rightImageController.value.text = viewModel.selectedRightImageList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rightImageController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rearLeftImage,
                          items: viewModel.carCondition,
                          selectItem: viewModel.selectedRearLeftImageList,
                          image: viewModel.rearLeftImage,
                          remarksController : viewModel.rearLeftImageRemarks.value,
                          othersController: viewModel.otherRearLeftImageController.value,
                        );
                      },
                    );
                    viewModel.rearLeftImageController.value.text = viewModel.selectedRearLeftImageList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rearLeftImageController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rearImage,
                          items: viewModel.carCondition,
                          selectItem: viewModel.selectedRearImageList,
                          image: viewModel.rearImage,
                          remarksController : viewModel.rearImageRemarks.value,
                          othersController: viewModel.otherRearImageController.value,
                        );
                      },
                    );
                    viewModel.rearImageController.value.text = viewModel.selectedRearImageList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rearImageController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rearRight,
                          items: viewModel.rearCondition,
                          selectItem: viewModel.selectedRearRightList,
                          image: viewModel.rearRightImage,
                          remarksController : viewModel.rearRightRemarks.value,
                          othersController: viewModel.otherRearRightController.value,
                        );
                      },
                    );
                    viewModel.rearRightController.value.text = viewModel.selectedRearRightList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rearRightController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.roofImage,
                          items: viewModel.roofCondition,
                          selectItem: viewModel.selectedRoofImageList,
                          image: viewModel.roofImage,
                          remarksController : viewModel.roofImageRemarks.value,
                          othersController: viewModel.otherRoofImageController.value,
                        );
                      },
                    );
                    viewModel.roofImageController.value.text = viewModel.selectedRoofImageList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.roofImageController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.frontWindShieldWiper,
                          items: viewModel.windShieldCondition,
                          selectItem: viewModel.selectedFrontWindShieldWiperList,
                          image: viewModel.frontWindShieldWiperImage,
                          remarksController : viewModel.frontWindShieldWiperRemarks.value,
                          othersController: viewModel.otherFrontWindShieldWiperController.value,
                        );
                      },
                    );
                    viewModel.frontWindShieldWiperController.value.text = viewModel.selectedFrontWindShieldWiperList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.frontWindShieldWiperController.value,
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

  Widget pageTwo(BuildContext context) {
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rearWindShield,
                          items: viewModel.windShieldCondition,
                          selectItem: viewModel.selectedRearWindShieldList,
                          image: viewModel.rearWindShield,
                          remarksController : viewModel.rearWindShieldRemarks.value,
                          othersController: viewModel.otherRearWindShieldController.value,
                        );
                      },
                    );
                    viewModel.rearWindShieldController.value.text = viewModel.selectedRearWindShieldList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rearWindShieldController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.doorGlassLH,
                          items: viewModel.doorGlassCondition,
                          selectItem: viewModel.selectedDoorGlassLHList,
                          image: viewModel.doorGlassLH,
                          remarksController : viewModel.doorGlassLHRemarks.value,
                          othersController: viewModel.otherDoorGlassLHController.value,
                        );
                      },
                    );
                    viewModel.doorGlassLHController.value.text = viewModel.selectedDoorGlassLHList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.doorGlassLHController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.doorGlassRH,
                          items: viewModel.doorGlassCondition,
                          selectItem: viewModel.selectedDoorGlassRHList,
                          image: viewModel.doorGlassRH,
                          remarksController : viewModel.doorGlassRHRemarks.value,
                          othersController: viewModel.otherDoorGlassRHController.value,
                        );
                      },
                    );
                    viewModel.doorGlassRHController.value.text = viewModel.selectedDoorGlassRHList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.doorGlassRHController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.quarterGlass,
                          items: viewModel.doorGlassCondition,
                          selectItem: viewModel.selectedQuarterGlassList,
                          image: viewModel.quarterGlass,
                          remarksController : viewModel.quarterGlassRemarks.value,
                          othersController: viewModel.otherQuarterGlassController.value,
                        );
                      },
                    );
                    viewModel.quarterGlassController.value.text = viewModel.selectedQuarterGlassList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.quarterGlassController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.headlightsLH,
                          items: viewModel.lightCondition,
                          selectItem: viewModel.selectedHeadlightsLHList,
                          image: viewModel.headlightsLH,
                          remarksController : viewModel.headlightsLHRemarks.value,
                          othersController: viewModel.otherHeadlightsLHController.value,
                        );
                      },
                    );
                    viewModel.headlightsLHController.value.text = viewModel.selectedHeadlightsLHList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.headlightsLHController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.headlightsRH,
                          items: viewModel.lightCondition,
                          selectItem: viewModel.selectedHeadlightsRHList,
                          image: viewModel.headlightsRH,
                          remarksController : viewModel.headlightsRHRemarks.value,
                          othersController: viewModel.otherHeadlightsRHController.value,
                        );
                      },
                    );
                    viewModel.headlightsRHController.value.text = viewModel.selectedHeadlightsRHList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.headlightsRHController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.engine,
                          items: viewModel.headLightSupport,
                          selectItem: viewModel.selectedHeadlightSupportList,
                          image: viewModel.headlightSupport,
                          remarksController : viewModel.headlightSupportRemarks.value,
                          othersController: viewModel.otherHeadlightSupportController.value,
                        );
                      },
                    );
                    viewModel.headlightSupportController.value.text = viewModel.selectedHeadlightSupportList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.headlightSupportController.value,
                    labelText: MyStrings.headlightSupport,
                    helperText: MyStrings.headlightSupport,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.frontBumper,
                          items: viewModel.bumper,
                          selectItem: viewModel.selectedFrontBumperList,
                          image: viewModel.frontBumper,
                          remarksController : viewModel.frontBumperRemarks.value,
                          othersController: viewModel.otherFrontBumperController.value,
                        );
                      },
                    );
                    viewModel.frontBumperController.value.text = viewModel.selectedFrontBumperList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.frontBumperController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rearBumper,
                          items: viewModel.bumper,
                          selectItem: viewModel.selectedRearBumperList,
                          image: viewModel.rearBumper,
                          remarksController : viewModel.rearBumperRemarks.value,
                          othersController: viewModel.otherRearBumperController.value,
                        );
                      },
                    );
                    viewModel.rearBumperController.value.text = viewModel.selectedRearBumperList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rearBumperController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.frontGrill,
                          items: viewModel.frontGrillList,
                          selectItem: viewModel.selectedFrontGrillList,
                          image: viewModel.frontGrill,
                          remarksController : viewModel.frontGrillRemarks.value,
                          othersController: viewModel.otherFrontGrillController.value,
                        );
                      },
                    );
                    viewModel.frontGrillController.value.text = viewModel.selectedFrontGrillList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.frontGrillController.value,
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

  Widget pageThree(BuildContext context) {
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.bonnetPatti,
                          items: viewModel.bonnetPatti,
                          selectItem: viewModel.selectedBonnetPattiList,
                          image: viewModel.bonnetPattiImage,
                          remarksController : viewModel.bonnetPattiRemarks.value,
                          othersController: viewModel.otherBonnetPattiController.value,
                        );
                      },
                    );
                    viewModel.bonnetPattiController.value.text = viewModel.selectedBonnetPattiList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.bonnetPattiController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.upperCrossMember,
                          items: viewModel.crossMember,
                          selectItem: viewModel.selectedUpperCrossMemberList,
                          image: viewModel.upperCrossMember,
                          remarksController : viewModel.upperCrossMemberRemarks.value,
                          othersController: viewModel.otherUpperCrossMemberController.value,
                        );
                      },
                    );
                    viewModel.upperCrossMemberController.value.text = viewModel.selectedUpperCrossMemberList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.upperCrossMemberController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.lowerCrossMember,
                          items: viewModel.crossMember,
                          selectItem: viewModel.selectedLowerCrossMemberList,
                          image: viewModel.lowerCrossMember,
                          remarksController : viewModel.lowerCrossMemberRemarks.value,
                          othersController: viewModel.otherLowerCrossMemberController.value,
                        );
                      },
                    );
                    viewModel.lowerCrossMemberController.value.text = viewModel.selectedLowerCrossMemberList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.lowerCrossMemberController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.apronLH,
                          items: viewModel.apron,
                          selectItem: viewModel.selectedApronLHList,
                          image: viewModel.apronLH,
                          remarksController : viewModel.apronLHRemarks.value,
                          othersController: viewModel.otherApronLHController.value,
                        );
                      },
                    );
                    viewModel.apronLHController.value.text = viewModel.selectedApronLHList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.apronLHController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.apronRH,
                          items: viewModel.apron,
                          selectItem: viewModel.selectedApronRHList,
                          image: viewModel.apronRH,
                          remarksController : viewModel.apronRHRemarks.value,
                          othersController: viewModel.otherApronRHController.value,
                        );
                      },
                    );
                    viewModel.apronRHController.value.text = viewModel.selectedApronRHList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.apronRHController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.cowlTop,
                          items: viewModel.cowlTopList,
                          selectItem: viewModel.selectedCowlTopList,
                          image: viewModel.cowlTop,
                          remarksController : viewModel.cowlTopRemarks.value,
                          othersController: viewModel.otherCowlTopController.value,
                        );
                      },
                    );
                    viewModel.cowlTopController.value.text = viewModel.selectedCowlTopList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.cowlTopController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.chassisExtension,
                          items: viewModel.chassisExtensionList,
                          selectItem: viewModel.selectedChassisExtensionList,
                          image: viewModel.chassisExtension,
                          remarksController : viewModel.chassisExtensionRemarks.value,
                          othersController: viewModel.otherChassisExtensionController.value,
                        );
                      },
                    );
                    viewModel.chassisExtensionController.value.text = viewModel.selectedChassisExtensionList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.chassisExtensionController.value,
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
                /*CustomDropDown(
                  hintText: "${MyStrings.tyreFrontRHS}*",
                  label: viewModel.selectedTyreFrontRHS.value.isEmpty ? null : "${MyStrings.tyreFrontRHS}*",
                  value: viewModel.selectedTyreFrontRHS.value.isEmpty ? null : viewModel.selectedTyreFrontRHS.value,
                  items: viewModel.tyreWheelsCondition.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: MyStyles.dropdownMenuStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    viewModel.selectedTyreFrontRHS.value = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return MyStrings.required;
                    }
                    return null;
                  },
                ),*/
                GestureDetector(
                  onTap: () async {
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.tyreFrontRHS,
                          items: viewModel.tyreWheelsCondition,
                          selectItem: viewModel.selectedTyreFrontRHSList,
                          image: viewModel.tyreFrontRHS,
                          remarksController : viewModel.tyreFrontRHSRemarks.value,
                          othersController: viewModel.otherTyreFrontRHSController.value,
                        );
                      },
                    );
                    viewModel.tyreFrontRHSController.value.text = viewModel.selectedTyreFrontRHSList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.tyreFrontRHSController.value,
                    labelText: "${MyStrings.tyreFrontRHS}*",
                    helperText: "${MyStrings.tyreFrontRHS}*",
                    validator: viewModel.tyreFrontRHS.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.tyreFrontRHS.value == null
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.tyreFrontLHS,
                          items: viewModel.tyreWheelsCondition,
                          selectItem: viewModel.selectedTyreFrontLHSList,
                          image: viewModel.tyreFrontLHS,
                          remarksController : viewModel.tyreFrontLHSRemarks.value,
                          othersController: viewModel.otherTyreFrontLHSController.value,
                        );
                      },
                    );
                    viewModel.tyreFrontLHSController.value.text = viewModel.selectedTyreFrontLHSList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.tyreFrontLHSController.value,
                    labelText: "${MyStrings.tyreFrontLHS}*",
                    helperText: "${MyStrings.tyreFrontLHS}*",
                    validator: viewModel.tyreFrontLHS.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.tyreFrontLHS.value == null
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
                /*CustomDropDown(
                  hintText: "${MyStrings.tyreFrontLHS}*",
                  label: viewModel.selectedTyreFrontLHS.value.isEmpty ? null : "${MyStrings.tyreFrontLHS}*",
                  value: viewModel.selectedTyreFrontLHS.value.isEmpty ? null : viewModel.selectedTyreFrontLHS.value,
                  items: viewModel.tyreWheelsCondition.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: MyStyles.dropdownMenuStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    viewModel.selectedTyreFrontLHS.value = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return MyStrings.required;
                    }
                    return null;
                  },
                ),*/
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.tyreRearRHS,
                          items: viewModel.tyreWheelsCondition,
                          selectItem: viewModel.selectedTyreRearRHSList,
                          image: viewModel.tyreRearRHS,
                          remarksController : viewModel.tyreRearRHSRemarks.value,
                          othersController: viewModel.otherTyreRearRHSController.value,
                        );
                      },
                    );
                    viewModel.tyreRearRHSController.value.text = viewModel.selectedTyreRearRHSList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.tyreRearRHSController.value,
                    labelText: "${MyStrings.tyreRearRHS}*",
                    helperText: "${MyStrings.tyreRearRHS}*",
                    validator: viewModel.tyreRearRHS.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.tyreRearRHS.value == null
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
                /*CustomDropDown(
                  hintText: "${MyStrings.tyreRearRHS}*",
                  label: viewModel.selectedTyreRearRHS.value.isEmpty ? null : "${MyStrings.tyreRearRHS}*",
                  value: viewModel.selectedTyreRearRHS.value.isEmpty ? null : viewModel.selectedTyreRearRHS.value,
                  items: viewModel.tyreWheelsCondition.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: MyStyles.dropdownMenuStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    viewModel.selectedTyreRearRHS.value = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return MyStrings.required;
                    }
                    return null;
                  },
                ),*/
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

  Widget pageFour(BuildContext context) {
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.tyreRearLHS,
                          items: viewModel.tyreWheelsCondition,
                          selectItem: viewModel.selectedTyreRearLHSList,
                          image: viewModel.tyreRearLHS,
                          remarksController : viewModel.tyreRearLHSRemarks.value,
                          othersController: viewModel.otherTyreRearLHSController.value,
                        );
                      },
                    );
                    viewModel.tyreRearLHSController.value.text = viewModel.selectedTyreRearLHSList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.tyreRearLHSController.value,
                    labelText: "${MyStrings.tyreRearLHS}*",
                    helperText: "${MyStrings.tyreRearLHS}*",
                    validator: viewModel.tyreRearLHS.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.tyreRearLHS.value == null
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
                /*CustomDropDown(
                  hintText: "${MyStrings.tyreRearLHS}*",
                  label: viewModel.selectedTyreRearLHS.value.isEmpty ? null : "${MyStrings.tyreRearLHS}*",
                  value: viewModel.selectedTyreRearLHS.value.isEmpty ? null : viewModel.selectedTyreRearLHS.value,
                  items: viewModel.tyreWheelsCondition.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: MyStyles.dropdownMenuStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    viewModel.selectedTyreRearLHS.value = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return MyStrings.required;
                    }
                    return null;
                  },
                ),*/
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.lhFender,
                          items: viewModel.lhCondition,
                          selectItem: viewModel.selectedLhFenderList,
                          image: viewModel.lhFender,
                          remarksController : viewModel.lhFenderRemarks.value,
                          othersController: viewModel.otherLhFenderController.value,
                        );
                      },
                    );
                    viewModel.lhFenderController.value.text = viewModel.selectedLhFenderList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.lhFenderController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rhFender,
                          items: viewModel.rhCondition,
                          selectItem: viewModel.selectedRhFenderList,
                          image: viewModel.rhFender,
                          remarksController : viewModel.rhFenderRemarks.value,
                          othersController: viewModel.otherRhFenderController.value,
                        );
                      },
                    );
                    viewModel.rhFenderController.value.text = viewModel.selectedRhFenderList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rhFenderController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.lhQuarterPanel,
                          items: viewModel.lhCondition,
                          selectItem: viewModel.selectedLhQuarterPanelList,
                          image: viewModel.lhQuarterPanel,
                          remarksController : viewModel.lhQuarterPanelRemarks.value,
                          othersController: viewModel.otherLhQuarterPanelController.value,
                        );
                      },
                    );
                    viewModel.lhQuarterPanelController.value.text = viewModel.selectedLhQuarterPanelList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.lhQuarterPanelController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rhQuarterPanel,
                          items: viewModel.rhCondition,
                          selectItem: viewModel.selectedRhQuarterPanelList,
                          image: viewModel.rhQuarterPanel,
                          remarksController : viewModel.rhQuarterPanelRemarks.value,
                          othersController: viewModel.otherRhQuarterPanelController.value,
                        );
                      },
                    );
                    viewModel.rhQuarterPanelController.value.text = viewModel.selectedRhQuarterPanelList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rhQuarterPanelController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.frontLHDoor,
                          items: viewModel.rhCondition,
                          selectItem: viewModel.selectedFrontLHDoorList,
                          image: viewModel.frontLHDoor,
                          remarksController : viewModel.frontLHDoorRemarks.value,
                          othersController: viewModel.otherFrontLHDoorController.value,
                        );
                      },
                    );
                    viewModel.frontLHDoorController.value.text = viewModel.selectedFrontLHDoorList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.frontLHDoorController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rearLHDoor,
                          items: viewModel.rhCondition,
                          selectItem: viewModel.selectedRearLHDoorList,
                          image: viewModel.rearLHDoor,
                          remarksController : viewModel.rearLHDoorRemarks.value,
                          othersController: viewModel.otherRearLHDoorController.value,
                        );
                      },
                    );
                    viewModel.rearLHDoorController.value.text = viewModel.selectedRearLHDoorList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rearLHDoorController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.frontRHDoor,
                          items: viewModel.rhCondition,
                          selectItem: viewModel.selectedFrontRHDoorList,
                          image: viewModel.frontRHDoor,
                          remarksController : viewModel.frontRHDoorRemarks.value,
                          othersController: viewModel.otherFrontRHDoorController.value,
                        );
                      },
                    );
                    viewModel.frontRHDoorController.value.text = viewModel.selectedFrontRHDoorList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.frontRHDoorController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rearRHDoor,
                          items: viewModel.rhCondition,
                          selectItem: viewModel.selectedRearRHDoorList,
                          image: viewModel.rearRHDoor,
                          remarksController : viewModel.rearRHDoorRemarks.value,
                          othersController: viewModel.otherRearRHDoorController.value,
                        );
                      },
                    );
                    viewModel.rearRHDoorController.value.text = viewModel.selectedRearRHDoorList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rearRHDoorController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.lhaPillar,
                          items: viewModel.pillarsBoardsCondition,
                          selectItem: viewModel.selectedLhaPillarList,
                          image: viewModel.lhaPillar,
                          remarksController : viewModel.lhaPillarRemarks.value,
                          othersController: viewModel.otherLhaPillarController.value,
                        );
                      },
                    );
                    viewModel.lhaPillarController.value.text = viewModel.selectedLhaPillarList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.lhaPillarController.value,
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

  Widget pageFive(BuildContext context) {
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rhaPillar,
                          items: viewModel.pillarsBoardsCondition,
                          selectItem: viewModel.selectedRhaPillarList,
                          image: viewModel.rhaPillar,
                          remarksController : viewModel.rhaPillarRemarks.value,
                          othersController: viewModel.otherRhaPillarController.value,
                        );
                      },
                    );
                    viewModel.rhaPillarController.value.text = viewModel.selectedRhaPillarList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rhaPillarController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.lhbPillar,
                          items: viewModel.pillarsBoardsCondition,
                          selectItem: viewModel.selectedLhbPillarList,
                          image: viewModel.lhbPillar,
                          remarksController : viewModel.lhbPillarRemarks.value,
                          othersController: viewModel.otherLhbPillarController.value,
                        );
                      },
                    );
                    viewModel.lhbPillarController.value.text = viewModel.selectedLhbPillarList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.lhbPillarController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rhbPillar,
                          items: viewModel.pillarsBoardsCondition,
                          selectItem: viewModel.selectedRhbPillarList,
                          image: viewModel.rhbPillar,
                          remarksController : viewModel.rhbPillarRemarks.value,
                          othersController: viewModel.otherRhbPillarController.value,
                        );
                      },
                    );
                    viewModel.rhbPillarController.value.text = viewModel.selectedRhbPillarList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rhbPillarController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.lhcPillar,
                          items: viewModel.pillarsBoardsCondition,
                          selectItem: viewModel.selectedLhcPillarList,
                          image: viewModel.lhcPillar,
                          remarksController : viewModel.lhcPillarRemarks.value,
                          othersController: viewModel.otherLhcPillarController.value,
                        );
                      },
                    );
                    viewModel.lhcPillarController.value.text = viewModel.selectedLhcPillarList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.lhcPillarController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rhcPillar,
                          items: viewModel.pillarsBoardsCondition,
                          selectItem: viewModel.selectedRhcPillarList,
                          image: viewModel.rhcPillar,
                          remarksController : viewModel.rhcPillarRemarks.value,
                          othersController: viewModel.otherRhcPillarController.value,
                        );
                      },
                    );
                    viewModel.rhcPillarController.value.text = viewModel.selectedRhcPillarList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rhcPillarController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.lhRunBoard,
                          items: viewModel.pillarsBoardsCondition,
                          selectItem: viewModel.selectedLhRunBoardList,
                          image: viewModel.lhRunBoard,
                          remarksController : viewModel.lhRunBoardRemarks.value,
                          othersController: viewModel.otherLhRunBoardController.value,
                        );
                      },
                    );
                    viewModel.lhRunBoardController.value.text = viewModel.selectedLhRunBoardList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.lhRunBoardController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rhRunBoard,
                          items: viewModel.pillarsBoardsCondition,
                          selectItem: viewModel.selectedRhRunBoardList,
                          image: viewModel.rhRunBoard,
                          remarksController : viewModel.rhRunBoardRemarks.value,
                          othersController: viewModel.otherRhRunBoardController.value,
                        );
                      },
                    );
                    viewModel.rhRunBoardController.value.text = viewModel.selectedRhRunBoardList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rhRunBoardController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.tailLightLh,
                          items: viewModel.lightCondition,
                          selectItem: viewModel.selectedTailLightLhList,
                          image: viewModel.tailLightLh,
                          remarksController : viewModel.tailLightLhRemarks.value,
                          othersController: viewModel.otherTailLightLhController.value,
                        );
                      },
                    );
                    viewModel.tailLightLhController.value.text = viewModel.selectedTailLightLhList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.tailLightLhController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.tailLightRh,
                          items: viewModel.lightCondition,
                          selectItem: viewModel.selectedTailLightRhList,
                          image: viewModel.tailLightRh,
                          remarksController : viewModel.tailLightRhRemarks.value,
                          othersController: viewModel.otherTailLightRhController.value,
                        );
                      },
                    );
                    viewModel.tailLightRhController.value.text = viewModel.selectedTailLightRhList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.tailLightRhController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rearWiper,
                          items: viewModel.wiper,
                          selectItem: viewModel.selectedRearWiperList,
                          image: viewModel.rearWiper,
                          remarksController : viewModel.rearWiperRemarks.value,
                          othersController: viewModel.otherRearWiperController.value,
                        );
                      },
                    );
                    viewModel.rearWiperController.value.text = viewModel.selectedRearWiperList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rearWiperController.value,
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

  Widget pageSix(BuildContext context) {
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.boot,
                          items: viewModel.bootList,
                          selectItem: viewModel.selectedBootList,
                          image: viewModel.bootImage,
                          remarksController : viewModel.bootRemarks.value,
                          othersController: viewModel.otherBootController.value,
                        );
                      },
                    );
                    viewModel.bootController.value.text = viewModel.selectedBootList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.bootController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.dickyDoor,
                          items: viewModel.rhCondition,
                          selectItem: viewModel.selectedDickyDoorList,
                          image: viewModel.dickyDoorImage,
                          remarksController : viewModel.dickyDoorRemarks.value,
                          othersController: viewModel.otherDickyDoorController.value,
                        );
                      },
                    );
                    viewModel.dickyDoorController.value.text = viewModel.selectedDickyDoorList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.dickyDoorController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.spareWheel,
                          items: viewModel.tyreWheelsCondition,
                          selectItem: viewModel.selectedSpareWheelList,
                          image: viewModel.spareWheel,
                          remarksController : viewModel.spareWheelRemarks.value,
                          othersController: viewModel.otherSpareWheelController.value,
                        );
                      },
                    );
                    viewModel.spareWheelController.value.text = viewModel.selectedSpareWheelList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.spareWheelController.value,
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
                CustomDropDown(
                  hintText: "${MyStrings.jackAndTool}*",
                  label: viewModel.selectedJackAndTool.value.isEmpty ? null : "${MyStrings.jackAndTool}*",
                  value: viewModel.selectedJackAndTool.value.isEmpty ? null : viewModel.selectedJackAndTool.value,
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
                    viewModel.selectedJackAndTool.value = value;
                  },
                  validator: (value) {
                    if(value == null){
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
                          title: MyStrings.lhRearViewMirror,
                          items: viewModel.mirror,
                          selectItem: viewModel.selectedLhRearViewMirrorList,
                          image: viewModel.lhRearViewMirror,
                          remarksController : viewModel.lhRearViewMirrorRemarks.value,
                          othersController: viewModel.otherLhRearViewMirrorController.value,
                        );
                      },
                    );
                    viewModel.lhRearViewMirrorController.value.text = viewModel.selectedLhRearViewMirrorList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.lhRearViewMirrorController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.rhRearViewMirror,
                          items: viewModel.mirror,
                          selectItem: viewModel.selectedRhRearViewMirrorList,
                          image: viewModel.rhRearViewMirror,
                          remarksController : viewModel.rhRearViewMirrorRemarks.value,
                          othersController: viewModel.otherRhRearViewMirrorController.value,
                        );
                      },
                    );
                    viewModel.rhRearViewMirrorController.value.text = viewModel.selectedRhRearViewMirrorList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.rhRearViewMirrorController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.fuelLid,
                          items: viewModel.fuelLidList,
                          selectItem: viewModel.selectedFuelLidList,
                          image: viewModel.fuelLid,
                          remarksController : viewModel.fuelLidRemarks.value,
                          othersController: viewModel.otherFuelLidController.value,
                        );
                      },
                    );
                    viewModel.fuelLidController.value.text = viewModel.selectedFuelLidList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.fuelLidController.value,
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
                    await showDialog(barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomCheckBoxDialog(
                          title: MyStrings.firewall,
                          items: viewModel.fireWallList,
                          selectItem: viewModel.selectedFirewallList,
                          image: viewModel.firewall,
                          remarksController : viewModel.firewallRemarks.value,
                          othersController: viewModel.otherFirewallController.value,
                        );
                      },
                    );
                    viewModel.firewallController.value.text = viewModel.selectedFirewallList.join(",");
                  },
                  child: CustomTextFormField(
                    controller: viewModel.firewallController.value,
                    labelText: MyStrings.firewall,
                    helperText: MyStrings.firewall,
                    validator:(p0) => null,
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
                CustomDropDown(
                  hintText: "${MyStrings.fullBodyRepaint}*",
                  label: viewModel.selectedFullBodyRepaint.value.isEmpty ? null : "${MyStrings.fullBodyRepaint}*",
                  value: viewModel.selectedFullBodyRepaint.value.isEmpty ? null : viewModel.selectedFullBodyRepaint.value,
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
                    viewModel.selectedFullBodyRepaint.value = value;
                  },
                  validator: (value) {
                    if(value == null){
                      return MyStrings.required;
                    }
                    return null;
                  },
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
                                viewModel.updateExterior();
                                print('ranjitha');
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
    pages = [pageOne(context), pageTwo(context), pageThree(context), pageFour(context), pageFive(context), pageSix(context)];
    return Obx(() => PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        Methods.showConfirmDialog(context);
      },
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
