import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../utils/dimens.dart';

class QuotePriceBottomSheet extends StatelessWidget {
  const QuotePriceBottomSheet({super.key, required this.otbPrice, this.onPressed, required this.quotePriceController});

  final int otbPrice;
  final void Function()? onPressed;
  final TextEditingController quotePriceController ;

  @override
  Widget build(BuildContext context) {
    NumberFormat numberFormat = NumberFormat.currency(locale: 'HI', name: '₹ ', decimalDigits: 0);
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: MyColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 32,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(color: MyColors.grey, borderRadius: BorderRadius.circular(100)),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                MySvg.timer,
                width: 20,
                color: MyColors.green2,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "24min 06sec",
                style: MyStyles.green2_18700,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  MySvg.cancel,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            '${MyStrings.currentOtbPrice} : ₹ $otbPrice',
            style: MyStyles.selectedTabBarTitleStyle,
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            '${MyStrings.minQuotePrice}  ₹ 27,000',
            style: MyStyles.blue14500,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            borderColor: MyColors.kPrimaryColor,
            controller: quotePriceController,
              validator: (p0) => null,
            prefixIcon: const Icon(Icons.currency_rupee),
          ),
          const SizedBox(
            height: 8,
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 1.5,right: 1),
                child: Icon(Icons.info_outline,size: Dimens.iconSizeS,),
              ),
              Text(MyStrings.quotePriceDesc),
            ],
          ),
          const SizedBox(
            height: 36,
          ),
          // Obx(() {return
          CustomElevatedButton(
            onPressed: onPressed,
            buttonText: (MyStrings.quotePriceAt) + numberFormat.format(otbPrice),
            textStyle: MyStyles.white14700,
          ),
          // })
        ],
      ),
    );
  }
}
