import 'package:evaluator_app/service/internet_check.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/validate_input.dart';
import 'package:evaluator_app/widgets/common_app_bar.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_checkbox_dialog.dart';
import 'package:evaluator_app/widgets/custom_text_form_field.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/images.dart';
import '../../../utils/styles.dart';
import '../../../view_model/dashboard/airconditioning/airconditioning_screen_view_model.dart';
import '../../../widgets/common_drawer.dart';
import '../../../widgets/custom_dropdown.dart';

/// ignore: must_be_immutable
class AirConditioningScreen extends StatelessWidget {
   AirConditioningScreen({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
   AirConditioningViewModel viewModel = Get.find<AirConditioningViewModel>();
   List<Widget>? pages;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: CommonAppBar(
        centerTitle: false,
        title: MyStrings.air1,
        leading: IconButton(
          icon: SvgPicture.asset(MyImages.menu),
          color: MyColors.black,
          onPressed: (){
            _key.currentState!.openDrawer();
          },
        ),
        actions: [IconButton(onPressed: () {}, icon: SvgPicture.asset(MyImages.notification))],
      ),
      drawer: const CommonDrawer(),
     body:  SingleChildScrollView(
       child: Form(
         key: viewModel.formKey,
         child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: InkWell(
                    onTap: (){
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
                  ))
                ],
              ),
              const SizedBox(height: 50),
              Obx(
                    () => Padding(
                  padding: const EdgeInsets.fromLTRB(16,0,16,0),
                  child: CustomDropDown(
                    hintText: MyStrings.acWorking,
                    label: viewModel.  selectedAcWorking.value.isEmpty ? null : "${MyStrings.acWorking}*",
                    value: viewModel.  selectedAcWorking.value.isEmpty ? null : viewModel.selectedAcWorking.value,
                    items: viewModel.acWorkingList.map<DropdownMenuItem<String>>(
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
                      viewModel.selectedAcWorking.value = value;
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
                  ()=>Padding(
                    padding: const EdgeInsets.fromLTRB(16,0,16,0),
                    child: GestureDetector(
                      onTap: () async {
                         await showDialog(barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return CustomCheckBoxDialog(
                                title: MyStrings.cooling, 
                                items: viewModel.coolingList, 
                                selectItem: viewModel.selectedCooling,
                                othersController: TextEditingController(),
                              );
                          },
                        );
                        viewModel.coolingController.value.text = viewModel.selectedCooling.join(",");
                      },
                      child: CustomTextFormField(
                        controller: viewModel.coolingController.value,
                        labelText: "${MyStrings.cooling}*",
                        helperText: "${MyStrings.cooling}*",
                        validator: (value)=>ValidateInput.validateRequiredFields(value),
                        showCursor: false,
                        isEnabled: false,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                          child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              Obx(
                    () => Padding(
                  padding: const EdgeInsets.fromLTRB(16,0,16,0),
                  child: CustomDropDown(
                    hintText: MyStrings.heater,
                    label: viewModel. selectedHeater.value.isEmpty ? null : "${MyStrings.heater}*",
                    value: viewModel. selectedHeater.value.isEmpty ? null : viewModel.selectedHeater.value,
                    items: viewModel.heaterList.map<DropdownMenuItem<String>>(
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
                      viewModel.selectedHeater.value = value;
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
                    hintText: MyStrings.climateControl,
                    label: viewModel. selectedClimateControl.value.isEmpty ? null : "${MyStrings.climateControl}*",
                    value: viewModel. selectedClimateControl.value.isEmpty ? null : viewModel.selectedClimateControl.value,
                    items: viewModel.climateControlList.map<DropdownMenuItem<String>>(
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
                      viewModel.selectedClimateControl.value = value;
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
                  ()=>Padding(
                    padding: const EdgeInsets.fromLTRB(16,0,16,0),
                    child: GestureDetector(
                      onTap: () async {
                         await showDialog(barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) {
                            return CustomCheckBoxDialog(
                                title: MyStrings.acCondenserCompressor, 
                                items: viewModel.acCondenserCompressorList, 
                                selectItem: viewModel.selectedAcCondenserCompressor,
                                othersController: TextEditingController(),
                              );
                          },
                        );
                        viewModel.acCondenserCompressorController.value.text = viewModel.selectedAcCondenserCompressor.join(",");
                      },
                      child: CustomTextFormField(
                        controller: viewModel.acCondenserCompressorController.value,
                        labelText: "${MyStrings.acCondenserCompressor}*",
                        helperText: "${MyStrings.acCondenserCompressor}*",
                        validator: (value)=>ValidateInput.validateRequiredFields(value),
                        showCursor: false,
                        isEnabled: false,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(17, 8.0, 17, 8),
                          child: SvgPicture.asset(MyImages.arrowDown, width: 2, height: 2,),
                        ),
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 20),
              Obx
                (() => Padding(
                  padding: const EdgeInsets.fromLTRB(16,0,16,0),
                  child: CustomDropDown(
                    hintText: MyStrings.acFilterDamaged,
                    label: viewModel. selectedAcCFilterDamaged.value.isEmpty ? null : "${MyStrings.acFilterDamaged}",
                    value: viewModel. selectedAcCFilterDamaged.value.isEmpty ? null : viewModel.selectedAcCFilterDamaged.value,
                    items: viewModel.acFilterDamagedList.map<DropdownMenuItem<String>>(
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
                      viewModel.selectedAcCFilterDamaged.value = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                )
              ),
              const SizedBox(height: 20),
              Obx(
                    () => Padding(
                  padding: const EdgeInsets.fromLTRB(16,0,16,0),
                  child: CustomDropDown(
                    hintText: MyStrings.acBlowerGrill,
                    label: viewModel. selectedAcBlowerGrill.value.isEmpty ? null : "${MyStrings.acBlowerGrill}",
                    value: viewModel. selectedAcBlowerGrill.value.isEmpty ? null : viewModel.selectedAcBlowerGrill.value,
                    items: viewModel.acBlowerGrillList.map<DropdownMenuItem<String>>(
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
                      viewModel.selectedAcBlowerGrill.value = value;
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
                    hintText: MyStrings.rearDefogger,
                    label: viewModel. selectedRearDefogger.value.isEmpty ? null : "${MyStrings.rearDefogger}",
                    value: viewModel. selectedRearDefogger.value.isEmpty ? null : viewModel.selectedRearDefogger.value,
                    items: viewModel.rearDefoggerList.map<DropdownMenuItem<String>>(
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
                      viewModel.selectedRearDefogger.value = value;
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
                child: CustomElevatedButton(onPressed: (){
                  if (viewModel.formKey.currentState!.validate()) {
                    Internet.checkInternet().then((value){
                      if (value){
                        viewModel.addCondition();
                        // viewModel.getAcinfo();
                      }else{
                        CustomToast.instance.showMsg(MyStrings.checkNetwork);
                      }
                      });
                        }

                }, buttonText: MyStrings.submit),
              )
            ],
         ),
       ),
     ),
    );
  }
}
