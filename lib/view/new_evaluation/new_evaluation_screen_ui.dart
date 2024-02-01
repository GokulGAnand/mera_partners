import 'package:evaluator_app/view_model/new_evaluation/new_evaluation_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/dimens.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';
import '../../utils/validate_input.dart';
import '../../widgets/common_app_bar.dart';
import '../../widgets/common_drawer.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

/// ignore: must_be_immutable
class NewEvaluationScreen extends StatelessWidget {
  NewEvaluationScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget>? pages;
  NewEvaluationViewModel viewModel = Get.find<NewEvaluationViewModel>();

  showPicker(){
    return YearPicker(firstDate: DateTime.now(), lastDate: DateTime.now(), selectedDate: DateTime.now(), onChanged: (value) {

    },);
  }

  Widget pageOne(){
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18),
          child: Center(
            child: CustomElevatedButton(
              onPressed: () {
              },
              buttonText: MyStrings.next,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Dimens.standard_23,),

            CustomTextFormField(
              controller: viewModel.customerMobileNumController.value,
              labelText: MyStrings.customerMobileNumber,
              helperText: MyStrings.customerMobileNumber,
              validator: (p0) {
                return null;
              },
            ),
            SizedBox(height: Dimens.standard_24,),
            CustomTextFormField(
              controller: TextEditingController(),
              labelText: "${MyStrings.manufacturingYear}*",
              helperText: "${MyStrings.manufacturingYear}*",
              validator: ValidateInput.validateLoginPassword,
              showCursor: false,
              onClick: () async {
                final selectedDate = showDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2050), context: Get.context!,
                );
              },
              suffixIcon: InkWell(
                onTap: () async {
                  final selectedDate = showDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2050), context: Get.context!,
                  );
                },
                child: const Icon(
                  Icons.calendar_today_outlined,
                  color: MyColors.grey,
                  size: 22,
                ),
              ),
            ),
            SizedBox(height: Dimens.standard_24,),
            CustomTextFormField(
              controller: TextEditingController(),
              labelText: "${MyStrings.carMake}*",
              helperText: "${MyStrings.carMake}*",
              validator: ValidateInput.validateLoginPassword,
            ),
            SizedBox(height: Dimens.standard_24,),
            CustomTextFormField(
              controller: TextEditingController(),
              labelText: "${MyStrings.carModel}*",
              helperText: "${MyStrings.carModel}*",
              validator: ValidateInput.validateLoginPassword,
            ),
            SizedBox(height: Dimens.standard_24,),
            CustomTextFormField(
              controller: TextEditingController(),
              labelText: "${MyStrings.variant}*",
              helperText: "${MyStrings.variant}*",
              validator: ValidateInput.validateLoginPassword,
              suffixIcon: InkWell(
                onTap: () {
                },
                child: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: MyColors.grey,
                  size: 22,
                ),
              ),
            ),
            SizedBox(height: Dimens.standard_24,),

      DropdownButtonFormField(
      decoration: InputDecoration(
      enabledBorder: OutlineInputBorder( //<-- SEE HERE
      borderSide: BorderSide(color: Colors.black, width: 2),
    ),
    focusedBorder: OutlineInputBorder( //<-- SEE HERE
    borderSide: BorderSide(color: Colors.black, width: 2),
    ),
    ),
    dropdownColor: MyColors.grey,
    value: viewModel.dropdownValue,
    onChanged: (String? newValue) {
      viewModel.dropdownValue = newValue!;
    },
    items: <String>['Dog', 'Cat', 'Tiger', 'Lion'].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
    value: value,
    child: Text(
    value,
    style: TextStyle(fontSize: 15),
    ),
    );
    }).toList(),
    ),
            CustomTextFormField(
              controller: TextEditingController(),
              labelText: "${MyStrings.vehicleRegistration}*",
              helperText: "${MyStrings.vehicleRegistration}*",
              validator: ValidateInput.validateLoginPassword,
              suffixIcon: InkWell(
                onTap: () {
                },
                child: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: MyColors.grey,
                  size: 22,
                ),
              ),
            ),
            SizedBox(height: Dimens.standard_24,),
            CustomTextFormField(
              controller: TextEditingController(),
              labelText: "${MyStrings.registrationNumber}*",
              helperText: "${MyStrings.registrationNumber}*",
              validator: ValidateInput.validateLoginPassword,
            ),
            SizedBox(height: Dimens.standard_24,),
            CustomTextFormField(
              controller: TextEditingController(),
              labelText: "${MyStrings.registrationDate}*",
              helperText: "${MyStrings.registrationDate}*",
              validator: ValidateInput.validateLoginPassword,
              suffixIcon: InkWell(
                onTap: () {
                },
                child: const Icon(
                  Icons.calendar_today_outlined,
                  color: MyColors.grey,
                  size: 22,
                ),
              ),
            ),
            SizedBox(height: Dimens.standard_24,),
          ],
        ),
      ),
    );
  }

  Widget pageTwo(){
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18),
          child: Center(
            child: CustomElevatedButton(
              onPressed: () {
              },
              buttonText: MyStrings.next,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Dimens.padding16,
          child: Column(
            children: [
              SizedBox(height: Dimens.standard_23,),
              /*const Row(
                children: [
                  Text('${MyStrings.page}2',style: MyStyles.blackW500F15Style,),
                ],
              ),
              SizedBox(height: Dimens.standard_20,),*/

              CustomTextFormField(
                controller: TextEditingController(),
                labelText: '${MyStrings.rcOwnerName}*',
                helperText: '${MyStrings.rcOwnerName}*',
                validator: ValidateInput.validateLoginPassword,
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.ownershipNumber}*",
                helperText: "${MyStrings.ownershipNumber}*",
                validator: ValidateInput.validateLoginPassword,
                suffixIcon: InkWell(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: MyColors.grey,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.regState}*",
                helperText: "${MyStrings.regState}*",
                validator: ValidateInput.validateLoginPassword,
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.regCity}*",
                helperText: "${MyStrings.regCity}*",
                validator: ValidateInput.validateLoginPassword,
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.valuationState}*",
                helperText: "${MyStrings.valuationState}*",
                validator: ValidateInput.validateLoginPassword,
                suffixIcon: InkWell(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: MyColors.grey,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.valuationCity}*",
                helperText: "${MyStrings.valuationCity}*",
                validator: ValidateInput.validateLoginPassword,
                suffixIcon: InkWell(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: MyColors.grey,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.fuelType}*",
                helperText: "${MyStrings.fuelType}*",
                validator: ValidateInput.validateLoginPassword,
                suffixIcon: InkWell(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.calendar_today_outlined,
                    color: MyColors.grey,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.transmission}*",
                helperText: "${MyStrings.transmission}*",
                validator: ValidateInput.validateLoginPassword,
                suffixIcon: InkWell(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.calendar_today_outlined,
                    color: MyColors.grey,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24,),
            ],
          ),
        ),
      ),
    );
  }

  Widget pageThree(){
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18),
          child: Center(
            child: CustomElevatedButton(
              onPressed: () {
              },
              buttonText: MyStrings.next,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Dimens.padding16,
          child: Column(
            children: [
              SizedBox(height: Dimens.standard_23,),
              /*const Row(
                children: [
                  Text('${MyStrings.page}3',style: MyStyles.blackW500F15Style,),
                ],
              ),
              SizedBox(height: Dimens.standard_20,),*/

              CustomTextFormField(
                controller: TextEditingController(),
                labelText: '${MyStrings.bodyType}*',
                helperText: '${MyStrings.bodyType}*',
                validator: ValidateInput.validateLoginPassword,
                suffixIcon: InkWell(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: MyColors.grey,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.vehicleUsage}*",
                helperText: "${MyStrings.vehicleUsage}*",
                validator: ValidateInput.validateLoginPassword,
                suffixIcon: InkWell(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: MyColors.grey,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.length}*",
                helperText: "${MyStrings.length}*",
                validator: ValidateInput.validateLoginPassword,
                suffixIcon: InkWell(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: MyColors.grey,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.customerPrice}*",
                helperText: "${MyStrings.customerPrice}*",
                validator: ValidateInput.validateLoginPassword,
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.engineCC}*",
                helperText: "${MyStrings.engineCC}*",
                validator: ValidateInput.validateLoginPassword,
                suffixIcon: InkWell(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: MyColors.grey,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.ccClass}*",
                helperText: "${MyStrings.ccClass}*",
                validator: ValidateInput.validateLoginPassword,
                suffixIcon: InkWell(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: MyColors.grey,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.engineNumber}*",
                helperText: "${MyStrings.engineNumber}*",
                validator: ValidateInput.validateLoginPassword,
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.color}*",
                helperText: "${MyStrings.color}*",
                validator: ValidateInput.validateLoginPassword,
                suffixIcon: InkWell(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.calendar_today_outlined,
                    color: MyColors.grey,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24,),
            ],
          ),
        ),
      ),
    );
  }

  Widget pageFour(){
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18),
          child: Center(
            child: CustomElevatedButton(
              onPressed: () {
              },
              buttonText: MyStrings.submit,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: Dimens.padding16,
          child: Column(
            children: [
              SizedBox(height: Dimens.standard_23,),
              /*const Row(
                children: [
                  Text('${MyStrings.page}4',style: MyStyles.blackW500F15Style,),
                ],
              ),
              SizedBox(height: Dimens.standard_20,),*/

              CustomTextFormField(
                controller: TextEditingController(),
                labelText: MyStrings.seats,
                helperText: MyStrings.seats,
                validator: ValidateInput.validateLoginPassword,
                suffixIcon: InkWell(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: MyColors.grey,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.odometerWorking}*",
                helperText: "${MyStrings.odometerWorking}*",
                validator: ValidateInput.validateLoginPassword,
                suffixIcon: InkWell(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: MyColors.grey,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: MyStrings.odometerReading,
                helperText: MyStrings.odometerReading,
                validator: ValidateInput.validateLoginPassword,
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.accidental}*",
                helperText: "${MyStrings.accidental}*",
                validator: ValidateInput.validateLoginPassword,
                suffixIcon: InkWell(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: MyColors.grey,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: "${MyStrings.oEMWarrantyRemaining}*",
                helperText: "${MyStrings.oEMWarrantyRemaining}*",
                validator: ValidateInput.validateLoginPassword,
                suffixIcon: InkWell(
                  onTap: () {
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: MyColors.grey,
                    size: 22,
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: MyStrings.noOfMonthsRemaining,
                helperText: MyStrings.noOfMonthsRemaining,
                validator: ValidateInput.validateLoginPassword,
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: MyStrings.noOfKmsRemaining,
                helperText: MyStrings.noOfKmsRemaining,
                validator: ValidateInput.validateLoginPassword,
              ),
              SizedBox(height: Dimens.standard_24,),
              CustomTextFormField(
                controller: TextEditingController(),
                labelText: MyStrings.remarks,
                helperText: MyStrings.remarks,
                validator: ValidateInput.validateLoginPassword,
              ),
              SizedBox(height: Dimens.standard_24,),
            ],
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    pages = [
      pageOne(),
      pageTwo(),
      pageThree(),
      pageFour()
    ];
    return Obx(() => Scaffold(
      appBar: CommonAppBar(
        centerTitle: false,
        title: MyStrings.newEvaluation1,
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
                child: SvgPicture.asset(MyImages.notification,
                  width: Dimens.standard_24,
                  height: Dimens.standard_24,
                ),
              ),
            ],
          )
        ],
      ),
      drawer: const CommonDrawer(),
          body: Stack(
            children: [
              PageView.builder(
                controller: viewModel.pageController.value,
                onPageChanged: (int page) {
                  viewModel.activePage.value = page;
                },
                itemCount: pages!.length,
                itemBuilder: (BuildContext context, int index) {
                  return pages![index % pages!.length];
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16,0,0,0),
                child: Positioned(
                  child:
                  Row(
                    children: [
                      Text(MyStrings.page+(viewModel.activePage.value+1).toString(),style: MyStyles.blackW500F15Style,),
                    ],
                  ),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Positioned(child:
                Row(
                  children: List<Widget>.generate(
                      pages!.length,
                          (index) => InkWell(
                            onTap: () {
                              viewModel.pageController.value.animateToPage(index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                              height: 5,
                              margin: const EdgeInsets.only(left: 10,right: 10),
                              width: MediaQuery.of(context).size.width / pages!.length,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: viewModel.activePage.value == index
                                    ? MyColors.kPrimaryColor
                                    : MyColors.lightBlue,
                              ),

                            ),
                          )),
                ),),
              )
            ],
          ),
        ));
      }
  }

