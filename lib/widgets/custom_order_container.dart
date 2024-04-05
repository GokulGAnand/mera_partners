import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/dimens.dart';
import 'custom_toast.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/styles.dart';

class CustomOrderContainer extends StatelessWidget {
  const CustomOrderContainer({
    required this.carName,
    required this.carModel,
    required this.carID,
    required this.finalPrice,
    required this.imageURL,
    required this.button,
     this.dealStatus,
    this.backgroundBlackOpacity,
    required this.showButton,
    super.key,
  });

  final String carName;
  final String carModel;
  final String carID;
  final String finalPrice;
  final String imageURL;
  final Widget button;
  final Widget? dealStatus;
  final Widget? backgroundBlackOpacity;
  final bool showButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: MyColors.subTitleColor.withOpacity(0.15),
            blurRadius: 15.0,
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                width: double.infinity,
                height: 107,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      imageURL, // Use the imageURL parameter here
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              (backgroundBlackOpacity != null)
                  ? backgroundBlackOpacity!
                  : Container(
                width: double.infinity,
                height: 107,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.00, -1.00),
                    end: const Alignment(0, 1),
                    colors: [
                      MyColors.black3.withOpacity(0),
                      MyColors.black3.withOpacity(0.7),
                    ],
                  ),
                ),
              ),
              (dealStatus != null) ? dealStatus! : const SizedBox(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  carName,
                  style: MyStyles.black12400,
                ),
                SizedBox(  height: Dimens.standard_6),
                Text(
                  carModel,
                  style: MyStyles.black14700,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Clipboard.setData(const ClipboardData(text: ''));
                      CustomToast.instance.showMsg('Text copied to clipboard');
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.copy_rounded,
                          size: 16,
                        ),
                        Text(
                          "ID: $carID",
                          style: MyStyles.subtitle12400,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  "Final: ₹$finalPrice",
                  style: MyStyles.primary14700,
                ),
                SizedBox(
                  height: Dimens.standard_12,
                ),
                SizedBox(
                  height: 40,
                  child: showButton ? button : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
