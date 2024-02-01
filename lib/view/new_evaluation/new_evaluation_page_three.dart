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

class NewEvaluationPageThree extends StatelessWidget {
  NewEvaluationPageThree({super.key});

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
                Text('${MyStrings.page}3',style: MyStyles.blackW500F15Style,),
              ],
            ),
            SizedBox(height: Dimens.standard_20,),

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
    );
  }
}