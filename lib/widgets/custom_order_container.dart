import 'package:evaluator_app/model/response/live/live_cars_list_response.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'custom_toast.dart';

class CustomOrderContainer extends StatelessWidget {
   CustomOrderContainer(
      {required this.button,
      this.dealStatus,
      this.backgroundBlackOpacity,
        required this.showButton,
      super.key});

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
                blurRadius: 15.0)
          ]),
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
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                        fit: BoxFit.fill)),
              ),
              (backgroundBlackOpacity != null)
                  ? backgroundBlackOpacity!
                  : Container(
                      width: double.infinity,
                      height: 107,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.00, -1.00),
                          end: Alignment(0, 1),
                          colors: [
                            MyColors.black3.withOpacity(0),
                            MyColors.black3.withOpacity(0.7)
                          ],
                        ),
                      ),
                    ),
              (dealStatus != null) ? dealStatus! : const SizedBox()
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2016 Duster",
                  style: MyStyles.black12400,
                ),
                Text(
                  "110 PS RXZ 4X2 AMT",
                  style: MyStyles.black14700,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: ''));
                      CustomToast.instance.showMsg('Text copied to clipboard');
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.copy_rounded,
                          size: 16,
                        ),
                        Text(
                          "ID:73423642 ",
                          style: MyStyles.subtitle12400,
                        ),
                      ],
                    ),
                  ),
                ),

                Text(
                  "Final: ₹19,99,999",
                  style: MyStyles.primary14700,
                ),
                const SizedBox(
                  height: 12,
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
