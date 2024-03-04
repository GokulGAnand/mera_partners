import 'dart:developer';
import 'package:evaluator_app/utils/constants.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../service/internet_check.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimens.dart';
import '../../../utils/images.dart';
import '../../../utils/strings.dart';
import '../../../utils/styles.dart';
import '../../../utils/validate_input.dart';
import '../../../view_model/dashboard/documents/document_screen_view_model.dart';
import '../../../widgets/common_app_bar.dart';
import '../../../widgets/common_drawer.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_dialog.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/image_picker_card.dart';

/// ignore: must_be_immutable
class DocumentScreen extends StatelessWidget {
  var id = Get.arguments ?? '';
  DocumentScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget>? pages;
  DocumentViewModel viewModel = Get.find<DocumentViewModel>();

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
                /*Obx(() => CustomDropDown(
                    hintText: "${MyStrings.rc}*",
                    label: viewModel.selectedRc.value.isEmpty ? null : "${MyStrings.rc}*",
                    value: viewModel.selectedRc.value.isEmpty ? null : viewModel.selectedRc.value,
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
                      viewModel.selectedRc.value = value;
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
                ),*/
                // if(viewModel.selectedRc.value == 'Yes')
                GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: Get.context!, builder: (context) =>
                        ImagePickerCard(
                          remarksController: viewModel.rcFrontUploadRemarksController.value,
                          image:  viewModel.rcFrontImage,
                          onSubmit: (){
                            Navigator.of(context).pop();
                           log( viewModel.rcFrontImage.value.toString());
                          },
                        ),);
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rcFrontUpload}*",
                    helperText: "${MyStrings.rcFrontUploadInstruction}*",
                    validator: viewModel.rcFrontImage.value == null ?ValidateInput.validateRequiredFields:null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.rcFrontImage.value == null ?Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    ):const Icon(Icons.done_rounded,color: MyColors.green,),
                  ),
                ),
                // if(viewModel.selectedRc.value == 'Yes')
                SizedBox(
                  height: Dimens.standard_24,
                ),
                // if(viewModel.selectedRc.value == 'Yes')
                GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: Get.context!, builder: (context) =>
                        ImagePickerCard(
                          remarksController: viewModel.rcBackUploadRemarksController.value,
                          image: viewModel.rcBackImage,
                          onSubmit: (){
                            log('deborah');
                            log(viewModel.rcBackImage.value.toString());
                            Navigator.of(context).pop();
                          },
                        ),);
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: "${MyStrings.rcBackUpload}*",
                    helperText: "${MyStrings.rcBackUploadInstruction}*",
                    validator: viewModel.rcBackImage.value == null ? ValidateInput.validateRequiredFields : null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.rcBackImage.value == null ? Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    ):const Icon(Icons.done_rounded,color: MyColors.green,),
                  ),
                ),
                // if(viewModel.selectedRc.value == 'Yes')
                SizedBox(
                  height: Dimens.standard_24,
                ),
                Obx(() => CustomDropDown(
                  hintText: MyStrings.interStateTransfer,
                  label: viewModel.selectedInterStateTransfer.value.isEmpty ? null : MyStrings.interStateTransfer,
                  value: viewModel.selectedInterStateTransfer.value.isEmpty ? null : viewModel.selectedInterStateTransfer.value,
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
                    viewModel.selectedInterStateTransfer.value = value;
                  },
                  validator: (value) {
                    /*if (value == null) {
                      return MyStrings.required;
                    }*/
                    return null;
                  },
                ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                  Obx(() => CustomDropDown(
                    hintText: MyStrings.insurance,
                    label: viewModel.selectedInsurance.value.isEmpty ? null : MyStrings.insurance,
                    value: viewModel.selectedInsurance.value.isEmpty ? null : viewModel.selectedInsurance.value,
                    items: viewModel.insuranceList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: MyStyles.dropdownMenuStyle,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      viewModel.selectedInsurance.value = value;
                    },
                    validator: (value) {
                      /*if (value == null) {
                        return MyStrings.required;
                      }*/
                      return null;
                    },
                  ),
                  ),
                  SizedBox(
                    height: Dimens.standard_24,
                  ),
                if(viewModel.selectedInsurance.value != 'Not Applicable')
                CustomTextFormField(
                  controller: viewModel.insuranceCompanyController.value,
                  labelText: MyStrings.insuranceCompany,
                  helperText: MyStrings.insuranceCompany,
                  validator: (p0) => null,
                ),
                if(viewModel.selectedInsurance.value != 'Not Applicable')
                  SizedBox(
                    height: Dimens.standard_24,
                  ),
                if(viewModel.selectedInsurance.value != 'Not Applicable')
                CustomTextFormField(
                  controller: viewModel.insuranceIDVController.value,
                  labelText: MyStrings.insuranceIDV,
                  helperText: MyStrings.insuranceIDV,
                  validator: (p0) => null,
                ),
                if(viewModel.selectedInsurance.value != 'Not Applicable')
                SizedBox(
                  height: Dimens.standard_24,
                ),
                if(viewModel.selectedInsurance.value != 'Not Applicable')
                GestureDetector(
                  onTap: () async {
                    final selectedDate = await showDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1990),
                      lastDate: DateTime(DateTime.now().year+10),
                      context: Get.context!,
                    );
                    if (selectedDate != null) {
                      viewModel.insuranceValidityController.value.text = DateFormat('dd/MM/yyyy').format(selectedDate).toString();
                    }
                  },
                  child: CustomTextFormField(
                    controller: viewModel.insuranceValidityController.value,
                    labelText: MyStrings.insuranceValidity,
                    helperText: MyStrings.insuranceValidity,
                    validator: (p0) => null,
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
                          viewModel.insuranceValidityController.value.text = DateFormat('dd/MM/yyyy').format(selectedDate).toString();
                        }
                      },
                      child: const Padding(
                        padding: Dimens.suffixPadding,
                        child: Icon(
                          Icons.calendar_today_outlined,
                          color: MyColors.grey,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                if(viewModel.selectedInsurance.value != 'Not Applicable')
                SizedBox(
                  height: Dimens.standard_24,
                ),
            Obx(() => CustomDropDown(
              hintText: MyStrings.ncb,
              label: viewModel.selectedNCB.value.isEmpty ? null : MyStrings.ncb,
              value: viewModel.selectedNCB.value.isEmpty ? null : viewModel.selectedNCB.value,
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
                viewModel.selectedNCB.value = value;
              },
              validator: (value) {
                /*if (value == null) {
                  return MyStrings.required;
                }*/
                return null;
              },
            ),),
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
                  hintText: "${MyStrings.underHypothecation}*",
                  label: viewModel.selectedUnderHypothecation.value.isEmpty ? null : "${MyStrings.underHypothecation}*",
                  value: viewModel.selectedUnderHypothecation.value.isEmpty ? null : viewModel.selectedUnderHypothecation.value,
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
                    viewModel.selectedUnderHypothecation.value = value;
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
                if(viewModel.selectedUnderHypothecation.value == 'Yes')
                CustomTextFormField(
                  controller: viewModel.bankNameController.value,
                  labelText: "${MyStrings.bankName}*",
                  helperText: "${MyStrings.bankName}*",
                  validator: ValidateInput.validateRequiredFields,
                ),
                if(viewModel.selectedUnderHypothecation.value == 'Yes')
                SizedBox(
                  height: Dimens.standard_24,
                ),
                if(viewModel.selectedUnderHypothecation.value == 'Yes')
                Obx(() => CustomDropDown(
                  hintText: "${MyStrings.loanClosed}*",
                  label: viewModel.selectedLoanClosed.value.isEmpty ? null : "${MyStrings.loanClosed}*",
                  value: viewModel.selectedLoanClosed.value.isEmpty ? null : viewModel.selectedLoanClosed.value,
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
                    viewModel.selectedLoanClosed.value = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return MyStrings.required;
                    }
                    return null;
                  },
                )),
                if(viewModel.selectedUnderHypothecation.value == 'Yes')
                SizedBox(
                  height: Dimens.standard_24,
                ),
                if(viewModel.selectedUnderHypothecation.value == 'Yes')
                Obx(() => CustomDropDown(
                    hintText: MyStrings.loanNoc,
                    label: viewModel.selectedLoanNoc.value.isEmpty ? null : MyStrings.loanNoc,
                    value: viewModel.selectedLoanNoc.value.isEmpty ? null : viewModel.selectedLoanNoc.value,
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
                      viewModel.selectedLoanNoc.value = value;
                    },
                    validator: (value) {
                      /*if (value == null) {
                        return MyStrings.required;
                      }*/
                      return null;
                    },
                  ),
                ),
                if(viewModel.selectedUnderHypothecation.value == 'Yes')
                SizedBox(
                  height: Dimens.standard_24,
                ),
                if (viewModel.selectedLoanNoc.value == 'Yes' && viewModel.selectedUnderHypothecation.value == 'Yes')
                  GestureDetector(
                    onTap: () async {
                      showDialog(
                        barrierDismissible: false,
                        context: Get.context!, builder: (context) =>
                          ImagePickerCard(
                            remarksController: viewModel.nocRemarksController.value,
                            image: viewModel.nocImage,
                            onSubmit: (){
                              Navigator.of(context).pop();
                            },
                          ),);
                    },
                    child: CustomTextFormField(
                      controller: TextEditingController(),
                      labelText: "${MyStrings.nocImage}*",
                      helperText: "${MyStrings.nocImage}*",
                      validator: viewModel.nocImage.value == null ? ValidateInput.validateRequiredFields : null,
                      showCursor: false,
                      isEnabled: false,
                      suffixIcon: viewModel.nocImage.value == null ? Padding(
                        padding: Dimens.suffixPadding,
                        child: SvgPicture.asset(MyImages.upload),
                      ) :const Icon(Icons.done_rounded,color: MyColors.green,),
                    ),
                  ),
                if (viewModel.selectedLoanNoc.value == 'Yes' && viewModel.selectedUnderHypothecation.value == 'Yes')
                  SizedBox(
                    height: Dimens.standard_24,
                  ),
                if(viewModel.selectedUnderHypothecation.value == 'Yes')
                Obx(() => CustomDropDown(
                  hintText: MyStrings.form35,
                  label: viewModel.selectedForm35.value.isEmpty ? null : MyStrings.form35,
                  value: viewModel.selectedForm35.value.isEmpty ? null : viewModel.selectedForm35.value,
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
                    viewModel.selectedForm35.value = value;
                  },
                  validator: (value) {
                      /*if (value == null) {
                        return MyStrings.required;
                      }*/
                    return null;
                  },
                ),
                ),
                if(viewModel.selectedUnderHypothecation.value == 'Yes')
                SizedBox(
                  height: Dimens.standard_24,
                ),
                if(viewModel.selectedForm35.value == 'Yes' && viewModel.selectedUnderHypothecation.value == 'Yes')
                  GestureDetector(
                    onTap: () async {
                      showDialog(
                        barrierDismissible: false,
                        context: Get.context!, builder: (context) =>
                          ImagePickerCard(
                            remarksController: viewModel.form35RemarksController.value,
                            image: viewModel.form35Image,
                            onSubmit: (){
                              Navigator.of(context).pop();
                            },
                          ),);
                    },
                    child: CustomTextFormField(
                      controller: TextEditingController(),
                      labelText: "${MyStrings.form35Image}*",
                      helperText: "${MyStrings.form35Image}*",
                      validator: viewModel.form35Image.value == null ? ValidateInput.validateRequiredFields : null,
                      showCursor: false,
                      isEnabled: false,
                      suffixIcon: viewModel.form35Image.value == null ? Padding(
                        padding: Dimens.suffixPadding,
                        child: SvgPicture.asset(MyImages.upload),
                      ):const Icon(Icons.done_rounded,color: MyColors.green,),
                    ),
                  ),
                if(viewModel.selectedForm35.value == 'Yes' && viewModel.selectedUnderHypothecation.value == 'Yes')
                SizedBox(
                  height: Dimens.standard_24,
                ),
                GestureDetector(
                  onTap: () async {
                    showDialog(
                      barrierDismissible: false,
                      context: Get.context!, builder: (context) =>
                        ImagePickerCard(
                          remarksController: viewModel.chassisRemarksController.value,
                          image: viewModel.chassisImage,
                          onSubmit: (){
                            Navigator.of(context).pop();
                          },
                        ),);
                  },
                  child: CustomTextFormField(
                    controller: TextEditingController(),
                    labelText: MyStrings.chassisImpressionImage,
                    helperText: MyStrings.chassisImpressionImage,
                    validator: /*viewModel.chassisImage.value == null ? ValidateInput.validateRequiredFields :*/ null,
                    showCursor: false,
                    isEnabled: false,
                    suffixIcon: viewModel.chassisImage.value == null ? Padding(
                      padding: Dimens.suffixPadding,
                      child: SvgPicture.asset(MyImages.upload),
                    ) :const Icon(Icons.done_rounded,color: MyColors.green,),
                  ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                Obx(() => CustomDropDown(
                  hintText: MyStrings.rcMismatch,
                  label: viewModel.selectedRcMismatch.value.isEmpty ? null : MyStrings.rcMismatch,
                  value: viewModel.selectedRcMismatch.value.isEmpty ? null : viewModel.selectedRcMismatch.value,
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
                    viewModel.selectedRcMismatch.value = value;
                  },
                  validator: (value) {
                    /*if (value == null) {
                      return MyStrings.required;
                    }*/
                    return null;
                  },
                ),
                ),
                SizedBox(
                  height: Dimens.standard_24,
                ),
                Obx(() => CustomDropDown(
                  hintText: MyStrings.insuranceMismatch,
                  label: viewModel.selectedInsuranceMismatch.value.isEmpty ? null : MyStrings.insuranceMismatch,
                  value: viewModel.selectedInsuranceMismatch.value.isEmpty ? null : viewModel.selectedInsuranceMismatch.value,
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
                    viewModel.selectedInsuranceMismatch.value = value;
                  },
                  validator: (value) {
                    /*if (value == null) {
                      return MyStrings.required;
                    }*/
                    return null;
                  },
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
                                viewModel.addDocuments();
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
    pages = [pageOne(), pageTwo(),];
    return Obx(() => PopScope(
      // canPop: false,
      // onPopInvoked: (didPop) {
      //   Methods.showConfirmDialog(context);
      // },
      child: Scaffold(
        key: _key,
        appBar: CommonAppBar(
          centerTitle: false,
          title: MyStrings.documents,
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
