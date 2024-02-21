import 'dart:developer';

import 'package:evaluator_app/view_model/dashboard/features/feature_screen_view_model.dart';
import 'package:evaluator_app/widgets/common_app_bar.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_checkbox_dialog.dart';
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


  Widget pageOne() {
    return Obx(
          () => Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: viewModel.page1Key,
                child: Column(
                  children: [
                    SizedBox(height: Dimens.standard_3),
                    CustomDropDown(
                      hintText: "${MyStrings.keyLessEntry} *",
                      label: viewModel.selectedKeylessEntry.value.isEmpty ? null : "${MyStrings.keyLessEntry}*",
                      value: viewModel.selectedKeylessEntry.value.isEmpty ? null : viewModel.selectedKeylessEntry.value,
                      items: viewModel.keyLessEntryList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: MyStyles.dropdownMenuStyle,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        viewModel.selectedKeylessEntry.value = value;
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
                        showDialog(
                          barrierDismissible: false,
                          context: Get.context!,
                          builder: (context) => ImagePickerCard(
                            remarksController: viewModel.sterioImageRemarks.value,
                            image: viewModel.sterioCompartmentImage,
                            onSubmit: () {
                              Navigator.of(context).pop();
                              log(viewModel.sterioCompartmentImage.value.toString());
                            },
                          ),
                        );
                      },
                      child: CustomTextFormField(
                        controller: TextEditingController(),
                        labelText:  "${MyStrings.stereoImage} *",
                        helperText: "${MyStrings.stereoImage}*",
                        validator: viewModel.sterioCompartmentImage.value == null ? ValidateInput.validateRequiredFields : null,
                        showCursor: false,
                        isEnabled: false,
                        suffixIcon: viewModel.sterioCompartmentImage.value == null
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
                    CustomDropDown(
                      hintText: "${MyStrings.sunroof} *",
                      label: viewModel.selectedSunRoof.value.isEmpty ? null : "${MyStrings.sunroof}*",
                      value: viewModel.selectedSunRoof.value.isEmpty ? null : viewModel.selectedSunRoof.value,
                      items: viewModel.sunRoofList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: MyStyles.dropdownMenuStyle,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        viewModel.selectedSunRoof.value = value;
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
                CustomDropDown(
                  hintText: "${MyStrings.alloyWheels} *",
                  label: viewModel.selectedAlloyWheel.value.isEmpty ? null : "${MyStrings.alloyWheels}*",
                  value: viewModel.selectedAlloyWheel.value.isEmpty ? null : viewModel.selectedAlloyWheel.value,
                  items: viewModel.alloyWheelsList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: MyStyles.dropdownMenuStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    viewModel.selectedAlloyWheel.value = value;
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
                CustomDropDown(
                  hintText: "${MyStrings.airBag}*",
                  label: viewModel.selectedAirBag.value.isEmpty ? null : "${MyStrings.airBag}*",
                  value: viewModel.selectedAirBag.value.isEmpty ? null : viewModel.selectedAirBag.value,
                  items: viewModel.airBagList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: MyStyles.dropdownMenuStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    viewModel.selectedAirBag.value = value;
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
                            image: viewModel.clusterImage,
                            remarksController : viewModel.absEbdRemarksController.value
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
                CustomDropDown(
                  hintText:  "${MyStrings.gloveBox} *",
                  label: viewModel.selectedGloveBox.value.isEmpty ? null : "${MyStrings.gloveBox}*",
                  value: viewModel.selectedGloveBox.value.isEmpty ? null : viewModel.selectedGloveBox.value,
                  items: viewModel.gloveBoxList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: MyStyles.dropdownMenuStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    viewModel.selectedGloveBox.value = value;
                  },
                  validator: (value) {
                    if (value == null) {
                      return MyStrings.required;
                    }
                    return null;
                  },
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
                CustomElevatedButton(onPressed: (){}, buttonText: MyStrings.submit)
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
      pageOne(),
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
