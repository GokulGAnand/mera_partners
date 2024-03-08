import 'package:evaluator_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/dimens.dart';
import '../../../utils/strings.dart';
import '../../../utils/validate_input.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../utils/images.dart';
import '../../view_model/document/document_screen_view_model.dart';

/// ignore: must_be_immutable
class DocumentScreen extends StatelessWidget {
  DocumentScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget>? pages;
  DocumentScreenViewModel viewModel = Get.find<DocumentScreenViewModel>();

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
                  controller: viewModel.fullNameController.value,
                  labelText: "${MyStrings.fullName}*",
                  helperText: "${MyStrings.enterFullName}*",
                  validator: ValidateInput.validateRequiredFields,
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomTextFormField(
                  controller: viewModel.phoneNumberController.value,
                  labelText: "${MyStrings.phoneNumber}*",
                  helperText: "${MyStrings.phoneNumber}*",
                  validator: ValidateInput.validateRequiredFields,
                  isEnabled: false,
                  showCursor: false,
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomTextFormField(
                  controller: viewModel.businessNameController.value,
                  labelText: "${MyStrings.businessName}*",
                  helperText: "${MyStrings.enterBusinessName}*",
                  validator: ValidateInput.validateRequiredFields,
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomTextFormField(
                  controller: viewModel.businessAddressController.value,
                  labelText: "${MyStrings.businessAddress}*",
                  helperText: "${MyStrings.enterBusinessAddress}*",
                  validator: ValidateInput.validateRequiredFields,
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomTextFormField(
                  controller: viewModel.pinCodeController.value,
                  labelText: '${MyStrings.pinCode}*',
                  helperText: '${MyStrings.enterPinCode}*',
                  validator: ValidateInput.validateRequiredFields,
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                CustomTextFormField(
                  controller: viewModel.districtController.value,
                  labelText: '${MyStrings.district}*',
                  helperText: '${MyStrings.enterDistrict}*',
                  validator: ValidateInput.validateRequiredFields,
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
    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.page2Key,
            child: Column(
              children: [
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                    showModalBottomSheet<void>(
                      context: Get.context!,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('Modal BottomSheet'),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: CustomTextFormField(
                    labelText: MyStrings.aadhaarCardFront,
                    helperText: MyStrings.additionalInfo,
                    controller: TextEditingController(),
                    validator: ValidateInput.validateRequiredFields,
                    isEnabled: false,
                    showCursor: false,
                    prefixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: Image.asset(MyImages.upload),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                    showModalBottomSheet<void>(
                      context: Get.context!,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('Modal BottomSheet'),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: CustomTextFormField(
                    labelText: MyStrings.aadhaarCardBack,
                    helperText: MyStrings.additionalInfo,
                    controller: TextEditingController(),
                    validator: ValidateInput.validateRequiredFields,
                    isEnabled: false,
                    showCursor: false,
                    prefixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: Image.asset(MyImages.upload),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                    showModalBottomSheet<void>(
                      context: Get.context!,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('Modal BottomSheet'),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: CustomTextFormField(
                    labelText: MyStrings.panCard,
                    helperText: MyStrings.additionalInfo,
                    controller: TextEditingController(),
                    validator: ValidateInput.validateRequiredFields,
                    isEnabled: false,
                    showCursor: false,
                    prefixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: Image.asset(MyImages.upload),
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
                        if (viewModel.page2Key.currentState!.validate()) {
                          viewModel.page2Key.currentState!.save();
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
      );
  }

  Widget pageThree() {
    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.page3Key,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    showModalBottomSheet<void>(
                      context: Get.context!,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('Modal BottomSheet'),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: CustomTextFormField(
                    labelText: MyStrings.dealerProof,
                    helperText: MyStrings.additionalInfo,
                    controller: TextEditingController(),
                    validator: ValidateInput.validateRequiredFields,
                    isEnabled: false,
                    showCursor: false,
                    prefixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: Image.asset(MyImages.upload),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                    showModalBottomSheet<void>(
                      context: Get.context!,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('Modal BottomSheet'),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: CustomTextFormField(
                    labelText: MyStrings.businessDocument,
                    helperText: MyStrings.additionalInfo,
                    controller: TextEditingController(),
                    validator: ValidateInput.validateRequiredFields,
                    isEnabled: false,
                    showCursor: false,
                    prefixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: Image.asset(MyImages.upload),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                    showModalBottomSheet<void>(
                      context: Get.context!,
                      builder: (BuildContext context) {
                        return SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                const Text('Modal BottomSheet'),
                                ElevatedButton(
                                  child: const Text('Close BottomSheet'),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: CustomTextFormField(
                    labelText: MyStrings.cancelledCheque,
                    helperText: MyStrings.additionalInfo,
                    controller: TextEditingController(),
                    validator: ValidateInput.validateRequiredFields,
                    isEnabled: false,
                    showCursor: false,
                    prefixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: Image.asset(MyImages.upload),
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
                        if (viewModel.page3Key.currentState!.validate()) {
                          viewModel.page3Key.currentState!.save();
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
      );
  }

  Widget pageFour() {
    return Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.page4Key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("₹10,000",style: MyStyles.blackBold28,),
                const Text(MyStrings.securityDepositDesc,style: MyStyles.pageTitleStyle,),
                SizedBox(
                  height: Dimens.standard_48,
                ),
                SizedBox(
                  height: 70,
                  child: Center(
                    child: CustomElevatedButton(
                      onPressed: () {
                        if (viewModel.page4Key.currentState!.validate()) {
                          viewModel.page4Key.currentState!.save();
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
    );
  }

  Widget paymentStatus(){
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(MyImages.success),
            const Text(MyStrings.paySuccess,style: MyStyles.blackBold20,),
            const Text(MyStrings.paySuccessDesc,style: MyStyles.subTitleBlackStyle,)
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Center(
          child: CustomElevatedButton(
            onPressed: () {
              if (viewModel.page4Key.currentState!.validate()) {
                viewModel.page4Key.currentState!.save();
                viewModel.pageController.value.animateToPage(
                  3,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.linear,
                );
              }
            },
            buttonText: MyStrings.cont,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    pages = [pageOne(), pageTwo(), pageThree(), pageFour()];
    return Obx(() => PopScope(
          // canPop: false,
          // onPopInvoked: (didPop) {
          //   Methods.showConfirmDialog(context);
          // },
          child: Scaffold(
            key: _key,
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
                            '${viewModel.activePage.value == 0 ? MyStrings.businessAddress : viewModel.activePage.value == 1 ? MyStrings.personalDocuments : viewModel.activePage.value == 2 ? MyStrings.businessDocument : MyStrings.securityDeposit} (${viewModel.activePage.value + 1}/4)',
                            style: MyStyles.pageTitleStyle
                          ),
                        ],
                      ),
                    ),
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
