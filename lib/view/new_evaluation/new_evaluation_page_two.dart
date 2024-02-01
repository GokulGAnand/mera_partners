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

class NewEvaluationPageTwo extends StatelessWidget {
  NewEvaluationPageTwo({super.key});

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
            const Row(
              children: [
                Text('${MyStrings.page}2',style: MyStyles.blackW500F15Style,),
              ],
            ),
            SizedBox(height: Dimens.standard_20,),

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
    );
  }
}
