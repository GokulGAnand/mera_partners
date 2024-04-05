import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../routes/app_routes.dart';
import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';
import '../utils/svg.dart';
import 'custom_button.dart';
import 'custom_toast.dart';

class LikedCarsWidget extends StatelessWidget {
  final String imageUrl;
  final String status;
  final String name;
  final String model;
  final String id;
  final String bidAmount;

  const LikedCarsWidget({super.key,
    required this.imageUrl,
    required this.status,
    required this.name,
    required this.model,
    required this.id,
    required this.bidAmount,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: MyColors.subTitleColor.withOpacity(0.15),
              blurRadius: 15.0,
            )
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
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
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
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    radius: 14,
                    backgroundColor: Colors.white,
                    child: SvgPicture.asset(
                      MySvg.liked,
                      width: 18,
                    ),
                  ),
                ),
      
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 17,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: MyColors.green1,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      status,
                      style: MyStyles.white12500,
                    ),
                  ),
                    const SizedBox(height: Dimens.standard_8),
                  Text(
                    name,
                    style: MyStyles.black12400,
                  ),
                   const SizedBox(height: Dimens.standard_8),
                  Text(
                    model,
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
                            "ID: $id",
                            style: MyStyles.subtitle12400,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Text(
                    MyStrings.highestBid,
                    style: MyStyles.primary12500,
                  ),
                   SizedBox(height: Dimens.standard_2),
                  Text(
                    "₹$bidAmount",
                    style: MyStyles.primary16500,
                  ),
                   const SizedBox(height: Dimens.standard_8),
                  SizedBox(
                    height: 40,
                    child: CustomElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.carDetailsScreen);
                      },
                      buttonStyle: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(2),
                        backgroundColor: MyColors.kPrimaryColor.withOpacity(0.1),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                          side: const BorderSide(color: MyColors.kPrimaryColor),
                        ),
                      ),
                      buttonColor: MyColors.kPrimaryColor.withOpacity(0.3),
                      buttonText: MyStrings.viewDetail,
                      textStyle: MyStyles.primary14500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
