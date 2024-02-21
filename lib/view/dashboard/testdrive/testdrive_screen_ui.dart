import 'package:evaluator_app/service/internet_check.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/images.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/common_app_bar.dart';
import 'package:evaluator_app/widgets/common_drawer.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../view_model/dashboard/testdrive/testdrive_screen_view_model.dart';
import '../../../widgets/custom_dropdown.dart';

/// ignore: must_be_immutable
class TestDriveScreen extends StatelessWidget {
  TestDriveScreen({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  TestDriveViewModel viewModel = Get.find<TestDriveViewModel>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: CommonAppBar(
          centerTitle: false,
          title: MyStrings.test,
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
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          viewModel.pageController.value.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                          child: Container(
                            height: 5,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: viewModel.activePage.value == 0 ? MyColors.kPrimaryColor : MyColors.lightBlue,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.fromLTRB(16,0,16,0),
                    child: CustomDropDown(
                      hintText:" ${MyStrings.steering}*",
                      label: viewModel.selectedSteeringSystem.value.isEmpty ? null : "${MyStrings.steering}*",
                      value: viewModel.selectedSteeringSystem.value.isEmpty ? null : viewModel.selectedSteeringSystem.value,
                      items: viewModel.steeringSystemList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: MyStyles.dropdownMenuStyle,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        viewModel.selectedSteeringSystem.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.fromLTRB(16,0,16,0),
                    child: CustomDropDown(
                      hintText: "${MyStrings.steeringWheel}*",
                      label: viewModel.selectedSteeringWheel.value.isEmpty ? null : "${MyStrings.steeringWheel}*",
                      value: viewModel.selectedSteeringWheel.value.isEmpty ? null : viewModel.selectedSteeringWheel.value,
                      items: viewModel.steeringWheelList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: MyStyles.dropdownMenuStyle,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        viewModel.selectedSteeringWheel.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.fromLTRB(16,0,16,0),
                    child: CustomDropDown(
                      hintText: "${MyStrings.steeringAdjustment}*",
                      label: viewModel.selectedSteeringAdjustment.value.isEmpty ? null : "${MyStrings.steeringAdjustment}*",
                      value: viewModel.selectedSteeringAdjustment.value.isEmpty ? null : viewModel.selectedSteeringAdjustment.value,
                      items: viewModel.steeringAdjustmentList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: MyStyles.dropdownMenuStyle,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        viewModel.selectedSteeringAdjustment.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.fromLTRB(16,0,16,0),
                    child: CustomDropDown(
                      hintText: "${MyStrings.steeringMountedAudio}*",
                      label: viewModel.selectedSteeringMounted.value.isEmpty ? null : "${MyStrings.steeringMountedAudio}*",
                      value: viewModel.selectedSteeringMounted.value.isEmpty ? null : viewModel.selectedSteeringMounted.value,
                      items: viewModel.steeringMountedAudioControlList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: MyStyles.dropdownMenuStyle,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        viewModel.selectedSteeringMounted.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.fromLTRB(16,0,16,0),
                    child: CustomDropDown(
                      hintText: "${MyStrings.cruiseControl}*",
                      label: viewModel.selectedCruiseControl.value.isEmpty ? null : "${MyStrings.cruiseControl}*",
                      value: viewModel.selectedCruiseControl.value.isEmpty ? null : viewModel.selectedCruiseControl.value,
                      items: viewModel.cruiseControlList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: MyStyles.dropdownMenuStyle,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        viewModel.selectedCruiseControl.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.fromLTRB(16,0,16,0),
                    child: CustomDropDown(
                      hintText: "${MyStrings.seatAdjustment}*",
                      label: viewModel.selectedSeatAdjustment.value.isEmpty ? null : "${MyStrings.seatAdjustment}*",
                      value: viewModel.selectedSeatAdjustment.value.isEmpty ? null : viewModel.selectedSeatAdjustment.value,
                      items: viewModel.seatAdjustmentList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: MyStyles.dropdownMenuStyle,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        viewModel.selectedSeatAdjustment.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.fromLTRB(16,0,16,0),
                    child: CustomDropDown(
                      hintText: "${MyStrings.suspensionSystem}*",
                      label: viewModel.selectedSuspensionSystem.value.isEmpty ? null : "${MyStrings.suspensionSystem}*",
                      value: viewModel.selectedSuspensionSystem.value.isEmpty ? null : viewModel.selectedSuspensionSystem.value,
                      items: viewModel.suspensionSystemList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: MyStyles.dropdownMenuStyle,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        viewModel.selectedSuspensionSystem.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.fromLTRB(16,0,16,0),
                    child: CustomDropDown(
                      hintText: "${MyStrings.brakes}*",
                      label: viewModel.selectedBrakes.value.isEmpty ? null : "${MyStrings.brakes}*",
                      value: viewModel.selectedBrakes.value.isEmpty ? null : viewModel.selectedBrakes.value,
                      items: viewModel.brakesList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: MyStyles.dropdownMenuStyle,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        viewModel.selectedBrakes.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.fromLTRB(16,0,16,0),
                    child: CustomDropDown(
                      hintText: "${MyStrings.clutchSystem}*",
                      label: viewModel.selectedCluthSystem.value.isEmpty ? null : "${MyStrings.clutchSystem}*",
                      value: viewModel.selectedCluthSystem.value.isEmpty ? null : viewModel.selectedCluthSystem.value,
                      items: viewModel.clutchSystemList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: MyStyles.dropdownMenuStyle,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        viewModel.selectedCluthSystem.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.fromLTRB(16,0,16,0),
                    child: CustomDropDown(
                      hintText: "${MyStrings.transmissionAutomatic}*",
                      label: viewModel.selectedTransmissionAutomatic.value.isEmpty ? null : "${MyStrings.transmissionAutomatic}*",
                      value: viewModel.selectedTransmissionAutomatic.value.isEmpty ? null : viewModel.selectedTransmissionAutomatic.value,
                      items: viewModel.transmissionAutomaticList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: MyStyles.dropdownMenuStyle,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        viewModel.selectedTransmissionAutomatic.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.fromLTRB(16,0,16,0),
                    child: CustomDropDown(
                      hintText:  "${MyStrings.vehicleHorn}*",
                      label: viewModel.selectedVehicleHorn.value.isEmpty ? null : "${MyStrings.vehicleHorn}*",
                      value: viewModel.selectedVehicleHorn.value.isEmpty ? null : viewModel.selectedVehicleHorn.value,
                      items: viewModel.vehicleHornList.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: MyStyles.dropdownMenuStyle,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        viewModel.selectedVehicleHorn.value = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          return MyStrings.required;
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 30,top: 50),
                  child: CustomElevatedButton(onPressed: () {
                    if(viewModel.formKey.currentState!.validate()){
                      Internet.checkInternet().then((value){
                        if(value){
                          viewModel.addTestDrive();
                          viewModel.GetTestDriveInfo();
                        }else{
                          CustomToast.instance.showMsg(MyStrings.checkNetwork);
                        }
                      });
                    }

                  }, buttonText: (MyStrings.submit)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
