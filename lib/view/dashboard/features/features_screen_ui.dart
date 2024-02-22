import 'dart:developer';

import 'package:evaluator_app/service/internet_check.dart';
import 'package:evaluator_app/view_model/dashboard/features/feature_screen_view_model.dart';
import 'package:evaluator_app/widgets/common_app_bar.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_checkbox_dialog.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimens.dart';
import '../../../utils/images.dart';
import '../../../utils/strings.dart';
import '../../../utils/styles.dart';
import '../../../utils/validate_input.dart';
import '../../../widgets/common_drawer.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/image_picker_card.dart';

/// ignore: must_be_immutable
class FeaturesScreen extends StatelessWidget {
  FeaturesScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget>? pages;
  FeatureViewModel viewModel = Get.find<FeatureViewModel>();


  Widget pageOne(BuildContext context) {
    return Obx(
          () => Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: viewModel.page1Key,
                child: Column(
                  children: [
                    SizedBox(height: Dimens.standard_3),
                    GestureDetector(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomCheckBoxDialog(
                                title: MyStrings.keyLessEntry, 
                                items: viewModel.keyLessEntryList, 
                                selectItem: viewModel.selectedKeylessEntry,
                                image: viewModel.keyLessEntryImage,
                                remarksController : viewModel.keylessEntryRemarksController.value,
                                othersController: TextEditingController(),
                              );
                          },
                        );
                        viewModel.keylessEntryController.value.text = viewModel.selectedKeylessEntry.join(",");
                      },
                      child: CustomTextFormField(
                        controller: viewModel.keylessEntryController.value,
                        labelText: "${MyStrings.keyLessEntry}*",
                        helperText: "${MyStrings.keyLessEntry}*",
                        validator: ValidateInput.validateRequiredFields,
                        showCursor: false,
                        isEnabled: false,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                          child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimens.standard_24),
                    GestureDetector(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomCheckBoxDialog(
                                title: MyStrings.stereoImage, 
                                items: viewModel.stereoImageList, 
                                selectItem: viewModel.selectedStereoImage,
                                image: viewModel.stereoImage,
                                remarksController : viewModel.stereoImageRemarksController.value,
                                othersController: TextEditingController(),
                              );
                          },
                        );
                        viewModel.stereoImageController.value.text = viewModel.selectedStereoImage.join(",");
                      },
                      child: CustomTextFormField(
                        controller: viewModel.stereoImageController.value,
                        labelText: "${MyStrings.stereoImage}*",
                        helperText: "${MyStrings.stereoImage}*",
                        validator: ValidateInput.validateRequiredFields,
                        showCursor: false,
                        isEnabled: false,
                        suffixIcon: (viewModel.stereoImage.value == null) ?Padding(
                          padding: Dimens.suffixPadding,
                          child: SvgPicture.asset(MyImages.upload),
                        ):const Icon(Icons.done_rounded,color: MyColors.green,),
                      ),
                    ),
                    SizedBox(height: Dimens.standard_24),
                    CustomTextFormField(
                      labelStyle: MyStyles.dropdownMenuStyle,
                      controller: viewModel.sterioBrandController.value,
                      labelText: "${MyStrings.stereoBrand} *",
                      onChange: (value) {},
                      validator: (String? value) {
                        return null;
                      },
                    ),
                    SizedBox(height: Dimens.standard_24),
                    CustomDropDown(
                      hintText:  "${MyStrings.rearParkingSensor} *",
                      label: viewModel.selectedRearParkingSensor.value.isEmpty ? null : "${MyStrings.rearParkingSensor}*",
                      value: viewModel.selectedRearParkingSensor.value.isEmpty ? null : viewModel.selectedRearParkingSensor.value,
                      items: viewModel.rearParkingSensorList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: MyStyles.dropdownMenuStyle,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        viewModel.selectedRearParkingSensor.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: Dimens.standard_24),
                    CustomDropDown(
                      hintText: "${MyStrings.fogLamp} *",
                      label: viewModel.selectedFogLamp.value.isEmpty ? null : "${MyStrings.fogLamp}*",
                      value: viewModel.selectedFogLamp.value.isEmpty ? null : viewModel.selectedFogLamp.value,
                      items: viewModel.fogLampList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: MyStyles.dropdownMenuStyle,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        viewModel.selectedFogLamp.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: Dimens.standard_24),
                    GestureDetector(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomCheckBoxDialog(
                                title: MyStrings.sunroof, 
                                items: viewModel.sunRoofList, 
                                selectItem: viewModel.selectedSunRoof,
                                image: viewModel.sunroofImage,
                                remarksController : viewModel.sunroofRemarksController.value,
                                othersController: TextEditingController(),
                              );
                          },
                        );
                        viewModel.sunroofController.value.text = viewModel.selectedSunRoof.join(",");
                      },
                      child: CustomTextFormField(
                        controller: viewModel.sunroofController.value,
                        labelText: "${MyStrings.sunroof}*",
                        helperText: "${MyStrings.sunroof}*",
                        validator: ValidateInput.validateRequiredFields,
                        showCursor: false,
                        isEnabled: false,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                          child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimens.standard_24),
                    CustomDropDown(
                      hintText: MyStrings.gpsNavigation,
                      label: viewModel.selectedGpsNavigation.value.isEmpty ? null : "${MyStrings.gpsNavigation}*",
                      value: viewModel.selectedGpsNavigation.value.isEmpty ? null : viewModel.selectedGpsNavigation.value,
                      items: viewModel.gpsNavigationList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: MyStyles.dropdownMenuStyle,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        viewModel.selectedGpsNavigation.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: Dimens.standard_24),
                    CustomDropDown(
                      hintText: MyStrings.rearDefogger,
                      label: viewModel.selectedRearDefogger.value.isEmpty ? null : "${MyStrings.rearDefogger}*",
                      value: viewModel.selectedRearDefogger.value.isEmpty ? null : viewModel.selectedRearDefogger.value,
                      items: viewModel.rearDefoggerList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: MyStyles.dropdownMenuStyle,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        viewModel.selectedRearDefogger.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: Dimens.standard_60),
                    CustomElevatedButton(onPressed: (){
                      if (viewModel.page1Key.currentState!.validate()) {
                        viewModel.page1Key.currentState!.save();
                        viewModel.isPage1Fill.value = true;
                        viewModel.pageController.value.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      }
                    }, buttonText: MyStrings.next)

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
                SizedBox(height: Dimens.standard_3),
                GestureDetector(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomCheckBoxDialog(
                                title: MyStrings.alloyWheels, 
                                items: viewModel.alloyWheelsList, 
                                selectItem: viewModel.selectedAlloyWheel,
                                image: viewModel.alloyWheelImage,
                                remarksController : viewModel.alloyWheelsRemarksController.value,
                                othersController: TextEditingController(),
                              );
                          },
                        );
                        viewModel.alloyWheelsController.value.text = viewModel.selectedAlloyWheel.join(",");
                      },
                      child: CustomTextFormField(
                        controller: viewModel.alloyWheelsController.value,
                        labelText: "${MyStrings.alloyWheels}*",
                        helperText: "${MyStrings.alloyWheels}*",
                        validator: ValidateInput.validateRequiredFields,
                        showCursor: false,
                        isEnabled: false,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                          child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
                        ),
                      ),
                    ),
                SizedBox(height: Dimens.standard_24),
                CustomDropDown(
                  hintText: MyStrings.fogLamps,
                  label: viewModel.selectedAlloyWheel.value.isEmpty ? null : "${MyStrings.fogLamps}*",
                  value: viewModel.selectedFogLamps.value.isEmpty ? null : viewModel.selectedFogLamps.value,
                  items: viewModel.fogLampsList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: MyStyles.dropdownMenuStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    viewModel.selectedFogLamps.value = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return MyStrings.required;
                    }
                    return null;
                  },
                ),
                SizedBox(height: Dimens.standard_24),
                GestureDetector(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomCheckBoxDialog(
                                title: MyStrings.airBag, 
                                items: viewModel.airBagList, 
                                selectItem: viewModel.selectedAirBag,
                                image: viewModel.airBagImage,
                                remarksController : viewModel.airBagsRemarksController.value,
                                othersController: TextEditingController(),
                              );
                          },
                        );
                        viewModel.airBagsController.value.text = viewModel.selectedAirBag.join(",");
                      },
                      child: CustomTextFormField(
                        controller: viewModel.airBagsController.value,
                        labelText: "${MyStrings.airBag}*",
                        helperText: "${MyStrings.airBag}*",
                        validator: ValidateInput.validateRequiredFields,
                        showCursor: false,
                        isEnabled: false,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                          child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
                        ),
                      ),
                    ),
                SizedBox(height: Dimens.standard_24),
                CustomDropDown(
                  hintText: "${MyStrings.seatBelt} *",
                  label: viewModel.selectedSeatBelt.value.isEmpty ? null : "${MyStrings.seatBelt}*",
                  value: viewModel.selectedSeatBelt.value.isEmpty ? null : viewModel.selectedSeatBelt.value,
                  items: viewModel.seatBeltList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: MyStyles.dropdownMenuStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    viewModel.selectedFogLamps.value = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return MyStrings.required;
                    }
                    return null;
                  },
                ),
                SizedBox(height: Dimens.standard_24),
                GestureDetector(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomCheckBoxDialog(
                                title: MyStrings.absEbd, 
                                items: viewModel.absEbdList, 
                                selectItem: viewModel.selectAbsEbd,
                                image: viewModel.absEbdImage,
                                remarksController : viewModel.absEbdRemarksController.value,
                                othersController: TextEditingController(),
                              );
                          },
                        );
                        viewModel.absEbdController.value.text = viewModel.selectAbsEbd.join(",");
                      },
                      child: CustomTextFormField(
                        controller: viewModel.absEbdController.value,
                        labelText: "${MyStrings.absEbd}*",
                        helperText: "${MyStrings.absEbd}*",
                        validator: ValidateInput.validateRequiredFields,
                        showCursor: false,
                        isEnabled: false,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                          child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
                        ),
                      ),
                    ),
                SizedBox(height: Dimens.standard_24),
                GestureDetector(
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return CustomCheckBoxDialog(
                                title: MyStrings.gloveBox, 
                                items: viewModel.gloveBoxList, 
                                selectItem: viewModel.selectedGloveBox,
                                image: viewModel.gloveBoxImage,
                                remarksController : viewModel.gloveBoxRemarksController.value,
                                othersController: TextEditingController(),
                              );
                          },
                        );
                        viewModel.gloveBoxController.value.text = viewModel.selectedGloveBox.join(",");
                      },
                      child: CustomTextFormField(
                        controller: viewModel.gloveBoxController.value,
                        labelText: "${MyStrings.gloveBox}*",
                        helperText: "${MyStrings.gloveBox}*",
                        validator: ValidateInput.validateRequiredFields,
                        showCursor: false,
                        isEnabled: false,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                          child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
                        ),
                      ),
                    ),
                SizedBox(height: Dimens.standard_24),
                CustomTextFormField(
                  minLines: 5,
                  // for increase the the size of textformfield
                  maxLines: 5,
                  topPadding: 0,
                  labelStyle: MyStyles.regular,
                  controller: viewModel.anyInteriorModificationController.value,
                  labelText: MyStrings.interiorModifications,
                  onChange: (value) {},
                  validator: (String? value) {
                    return null;
                  },
                ),
                SizedBox(height: Dimens.standard_24),
                SizedBox(height: Dimens.standard_50),
                CustomElevatedButton(onPressed: (){
                  if(viewModel.page2Key.currentState!.validate()){
                    viewModel.page2Key.currentState!.save();
                    viewModel.isPage2Fill.value = true;
                    if (viewModel.isPage1Fill.value && viewModel.isPage2Fill.value){
                      Internet.checkInternet().then((value){
                        if(value){
                          viewModel.addFeatureInfo();
                        }else{
                          CustomToast.instance.showMsg(MyStrings.checkNetwork);
                        }
                      });
                    }else{
                      CustomToast.instance.showMsg(MyStrings.vMandatory);
                    }
                  }
                  // viewModel.addFeatureInfo();
                }, buttonText: MyStrings.submit)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    pages = [
      pageOne(context),
      pageTwo(context),
    ];
    return Obx(() => PopScope( child: Scaffold(
      key: _key,
      appBar: CommonAppBar(
        centerTitle: false,
        title: MyStrings.features,
        leading: IconButton(
          icon: SvgPicture.asset(MyImages.menu),
          color: MyColors.black,
          onPressed: () {
            _key.currentState!.openDrawer();
          },
          iconSize: 28,
        ),
        actions: [IconButton(onPressed: () {}, icon: SvgPicture.asset(MyImages.notification))],
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

    ));}
}
