import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/widgets/custom_appbar.dart';
import 'package:mera_partners/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/dimens.dart';
import '../../../utils/strings.dart';
import '../../../utils/validate_input.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../view_model/document/document_screen_view_model.dart';
import '../../widgets/image_picker_bottom_sheet.dart';
import '../../widgets/progressbar.dart';
import '../../widgets/show_logout_dialog.dart';

/// ignore: must_be_immutable
class DocumentScreen extends StatelessWidget {
  DocumentScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget>? pages;
  DocumentScreenViewModel viewModel = Get.isRegistered<DocumentScreenViewModel>() ? Get.find<DocumentScreenViewModel>() : Get.put(DocumentScreenViewModel());

  Widget pageOne() {
    return Obx(
      () => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.page1Key,
            child: Column(
              children: [
                SizedBox(height: Dimens.standard_5,),
                CustomTextFormField(
                  controller: viewModel.fullNameController.value,
                  labelText: "${MyStrings.fullName}*",
                  helperText: "${MyStrings.enterFullName}*",
                  validator: ValidateInput.validateRequiredFields,
                ),
                const SizedBox(
                  height: Dimens.spaceWidth,
                ),
                CustomTextFormField(
                  controller: viewModel.phoneNumberController.value,
                  labelText: "${MyStrings.phoneNumber}*",
                  helperText: "${MyStrings.phoneNumber}*",
                  validator: ValidateInput.validateRequiredFields,
                  isEnabled: false,
                  showCursor: false,
                ),
                const SizedBox(
                  height: Dimens.spaceWidth,
                ),
                CustomTextFormField(
                  controller: viewModel.businessNameController.value,
                  labelText: "${MyStrings.businessName}*",
                  helperText: "${MyStrings.enterBusinessName}*",
                  validator: ValidateInput.validateRequiredFields,
                ),
                const SizedBox(
                  height: Dimens.spaceWidth,
                ),
                CustomTextFormField(
                  controller: viewModel.businessAddressController.value,
                  labelText: "${MyStrings.businessAddress}*",
                  helperText: "${MyStrings.enterBusinessAddress}*",
                  validator: ValidateInput.validateRequiredFields,
                ),
                const SizedBox(
                  height: Dimens.spaceWidth,
                ),
                CustomTextFormField(
                  controller: viewModel.pinCodeController.value,
                  labelText: '${MyStrings.pinCode}*',
                  helperText: '${MyStrings.enterPinCode}*',
                  validator: ValidateInput.validateRequiredFields,
                ),
                const SizedBox(
                  height: Dimens.spaceWidth,
                ),
                CustomTextFormField(
                  controller: viewModel.districtController.value,
                  labelText: '${MyStrings.district}*',
                  helperText: '${MyStrings.enterDistrict}*',
                  validator: ValidateInput.validateRequiredFields,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SizedBox(
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.next,
                    style: TextStyle(
                      color: MyColors.white,
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      height: 0,
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: MyColors.white,
                    size: 15,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget pageTwo() {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: SizedBox(
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
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.next,
                    style: TextStyle(
                      color: MyColors.white,
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: MyColors.white,
                    size: 15,
                  )
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.page2Key,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    showModalBottomSheet<void>(
                      context: Get.context!,
                      // isDismissible: false,
                      builder: (BuildContext context) {
                        return ImagePickerSheet(
                          image: viewModel.aadhaarFront,
                        );
                      },
                    );
                  },
                  child: CustomTextFormField(
                    labelText: MyStrings.aadhaarCardFront,
                    helperText: MyStrings.additionalInfo,
                    controller: TextEditingController(),
                    validator: viewModel.aadhaarFront.value == null ? ValidateInput.validateRequiredFields : null,
                    isEnabled: false,
                    showCursor: false,
                    prefixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: viewModel.aadhaarFront.value == null
                          ? Image.asset(MyImages.upload)
                          : const Icon(
                              Icons.done_rounded,
                              color: MyColors.green,
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimens.spaceWidth,
                ),
                GestureDetector(
                  onTap: () async {
                    showModalBottomSheet<void>(
                      context: Get.context!,
                      // isDismissible: false,
                      builder: (BuildContext context) {
                        return ImagePickerSheet(
                          image: viewModel.aadhaarBack,
                        );
                      },
                    );
                  },
                  child: CustomTextFormField(
                    labelText: MyStrings.aadhaarCardBack,
                    helperText: MyStrings.additionalInfo,
                    controller: TextEditingController(),
                    validator: viewModel.aadhaarBack.value == null ? ValidateInput.validateRequiredFields : null,
                    isEnabled: false,
                    showCursor: false,
                    prefixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: viewModel.aadhaarBack.value == null
                          ? Image.asset(MyImages.upload)
                          : const Icon(
                              Icons.done_rounded,
                              color: MyColors.green,
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: Dimens.spaceWidth,
                ),
                GestureDetector(
                  onTap: () async {
                    showModalBottomSheet<void>(
                      context: Get.context!,
                      // isDismissible: false,
                      builder: (BuildContext context) {
                        return ImagePickerSheet(
                          image: viewModel.panCard,
                        );
                      },
                    );
                  },
                  child: CustomTextFormField(
                    labelText: MyStrings.panCard,
                    helperText: MyStrings.additionalInfo,
                    controller: TextEditingController(),
                    validator: viewModel.panCard.value == null ? ValidateInput.validateRequiredFields : null,
                    isEnabled: false,
                    showCursor: false,
                    prefixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: viewModel.panCard.value == null
                          ? Image.asset(MyImages.upload)
                          : const Icon(
                              Icons.done_rounded,
                              color: MyColors.green,
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

  Widget pageThree() {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: SizedBox(
          height: 70,
          child: Center(
            child: CustomElevatedButton(
              onPressed: () async {
                if (viewModel.page3Key.currentState!.validate()) {
                  viewModel.page3Key.currentState!.save();
                  if (await viewModel.addDocument() == true) {
                    viewModel.pageController.value.animateToPage(
                      3,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  }
                }
              },
              buttonText: MyStrings.next,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    MyStrings.next,
                    style: TextStyle(
                      color: MyColors.white,
                      fontSize: 16,
                      fontFamily: 'DM Sans',
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: MyColors.white,
                    size: 15,
                  )
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.page3Key,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    showModalBottomSheet<void>(
                      context: Get.context!,
                      // isDismissible: false,
                      builder: (BuildContext context) {
                        return ImagePickerSheet(
                          image: viewModel.shopImage,
                        );
                      },
                    );
                  },
                  child: CustomTextFormField(
                    labelText: MyStrings.shopImage,
                    helperText: MyStrings.additionalInfo,
                    controller: TextEditingController(),
                    validator: (p0) => null,
                    isEnabled: false,
                    showCursor: false,
                    prefixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: viewModel.shopImage.value == null
                          ? Image.asset(MyImages.upload)
                          : const Icon(
                              Icons.done_rounded,
                              color: MyColors.green,
                            ),
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
                      // isDismissible: false,
                      builder: (BuildContext context) {
                        return ImagePickerSheet(
                          image: viewModel.visitingCard,
                        );
                      },
                    );
                  },
                  child: CustomTextFormField(
                    labelText: MyStrings.visitingCard,
                    helperText: MyStrings.additionalInfo,
                    controller: TextEditingController(),
                    validator: (p0) => null,
                    isEnabled: false,
                    showCursor: false,
                    prefixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: viewModel.visitingCard.value == null
                          ? Image.asset(MyImages.upload)
                          : const Icon(
                              Icons.done_rounded,
                              color: MyColors.green,
                            ),
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
                      // isDismissible: false,
                      builder: (BuildContext context) {
                        return ImagePickerSheet(
                          image: viewModel.cancelledCheque,
                        );
                      },
                    );
                  },
                  child: CustomTextFormField(
                    labelText: MyStrings.cancelledChequeOrPassBook,
                    helperText: MyStrings.additionalInfo,
                    controller: TextEditingController(),
                    validator: viewModel.cancelledCheque.value == null ? ValidateInput.validateRequiredFields : null,
                    isEnabled: false,
                    showCursor: false,
                    prefixIcon: Padding(
                      padding: Dimens.suffixPadding,
                      child: viewModel.cancelledCheque.value == null
                          ? Image.asset(MyImages.upload)
                          : const Icon(
                              Icons.done_rounded,
                              color: MyColors.green,
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

  Widget pageFour() {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Center(
          child: CustomElevatedButton(
            onPressed: () {
              if (viewModel.page4Key.currentState!.validate()) {
                viewModel.page4Key.currentState!.save();
                ProgressBar.instance.showProgressbar(Get.context!);
                viewModel.createOrder();
              }
            },
            buttonText: MyStrings.proceedToPay,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: viewModel.page4Key,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "₹10,000",
                style: MyStyles.blackBold28,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                MyStrings.securityDepositDesc,
                style: MyStyles.pageTitleStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget paymentStatus() {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image.asset(MyImages.success),
            const Text(
              MyStrings.paySuccess,
              style: MyStyles.blackBold20,
            ),
            const Text(
              MyStrings.paySuccessDesc,
              style: MyStyles.subTitleBlackStyle,
            )
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
           canPop: false,
           onPopInvoked: (didPop) {
            // Methods.showConfirmDialog(context);
             if(viewModel.activePage.value == 0){
               showLogoutDialog(context);
             }else{
               viewModel.pageController.value.animateToPage(
                 viewModel.activePage.value - 1,
                 duration: const Duration(milliseconds: 300),
                 curve: Curves.linear,
               );
             }
           },
          child: Scaffold(
            key: _key,
            appBar: CustomAppBar(
              title: MyStrings.documentVerification,
              subTitle: MyStrings.documentDesc,
              onBackPressed: () {
                if(viewModel.activePage.value == 0){
                  showLogoutDialog(context);
                }else{
                  viewModel.pageController.value.animateToPage(
                    viewModel.activePage.value - 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  );
                }
              },
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 10),
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(side: const BorderSide(width: 1, color: MyColors.white), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        if (viewModel.activePage.value == 3) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CustomDialog(
                                title: MyStrings.skipWarning,
                                okFun: () {
                                  Get.toNamed(AppRoutes.homeScreen);
                                },
                                cancelFun: () {
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          );
                        } else {
                          viewModel.pageController.value.animateToPage(
                            viewModel.activePage.value + 1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );
                        }
                      },
                      child: Text(
                        MyStrings.skip,
                        style: MyStyles.regular,
                      )),
                )
              ],
            ),
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 19, bottom: 28),
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                      child: Row(
                        children: [
                          Text(
                              '${viewModel.activePage.value == 0 ? MyStrings.businessInfo : viewModel.activePage.value == 1 ? MyStrings.personalDocuments : viewModel.activePage.value == 2 ? MyStrings.businessDocument : MyStrings.securityDeposit} (${viewModel.activePage.value + 1}/4)',
                              style: MyStyles.pageTitleStyle),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
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
