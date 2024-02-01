import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/dimens.dart';
import '../../utils/strings.dart';
import '../../utils/validate_input.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

/// ignore: must_be_immutable
class NewEvaluationPageOne extends StatelessWidget {
  NewEvaluationPageOne({super.key});

  // NewEvaluationViewModel _viewModel = Get.find<NewEvaluationViewModel>();

  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: Dimens.padding16,
        child: Column(
          children: [
            SizedBox(height: Dimens.standard_23,),
            // const Row(
            //   children: [
            //     Text('${MyStrings.page}1',style: MyStyles.blackW500F15Style,),
            //   ],
            // ),
            SizedBox(height: Dimens.standard_20,),

            CustomTextFormField(
              controller: TextEditingController(),
              labelText: MyStrings.customerMobileNumber,
              helperText: MyStrings.customerMobileNumber,
              validator: ValidateInput.validateLoginPassword,
            ),
            SizedBox(height: Dimens.standard_24,),
            CustomTextFormField(
              controller: TextEditingController(),
              labelText: "${MyStrings.manufacturingYear}*",
              helperText: "${MyStrings.manufacturingYear}*",
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
}
