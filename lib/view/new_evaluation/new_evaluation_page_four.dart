import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/dimens.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';
import '../../utils/validate_input.dart';
import '../../view_model/new_evaluation/new_evaluation_screen_view_model.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';

class NewEvaluationPageFour extends StatelessWidget {
  NewEvaluationPageFour({super.key});
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
              buttonText: MyStrings.submit,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: Dimens.padding16,
        child: Column(
          children: [
            SizedBox(height: Dimens.standard_23,),
            const Row(
              children: [
                Text('${MyStrings.page}4',style: MyStyles.blackW500F15Style,),
              ],
            ),
            SizedBox(height: Dimens.standard_20,),

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
    );
  }
}