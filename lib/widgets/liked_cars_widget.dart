import 'dart:convert';
import 'dart:developer';
import 'package:flutter_svg/svg.dart';
import 'package:mera_partners/utils/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../routes/app_routes.dart';
import '../service/endpoints.dart';
import '../service/exception_error_util.dart';
import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/images.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';
import '../view_model/home/my_cars/bidded_cars/bidded_cars_view_model.dart';
import 'custom_button.dart';
import 'custom_toast.dart';

class LikedCarsWidget extends StatelessWidget {
  final BidCarsListViewModel bidCarsListViewModel = Get.find<BidCarsListViewModel>();
  final String imageUrl;
  final String status;
  final String variant;
  final String model;
  final String id;
  final String carId;
  final String bidAmount;
  late final Rx<bool>? isFavourite = true.obs;

  LikedCarsWidget({super.key,
    required this.imageUrl,
    required this.status,
    required this.variant,
    required this.model,
    required this.id,
    required this.bidAmount,
    required this.carId,
  });

  /// Like Feature API integration
  void updateLikedCar(bool like) async {
    //todo - change status data
    try {
      log(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/$carId').toString());
      log(jsonEncode({"status": like== true?"LikedCar" :"Unlike"}));
      var response = await http.patch(Uri.parse('${EndPoints.baseUrl}${EndPoints.status}/$carId'),
      headers: globals.jsonHeaders, body: jsonEncode({"status": like== true? "LikedCar" :"Unlike"}));
      log(response.body.toString());
      if (response.statusCode == 200) {
        print('checking: ${bidCarsListViewModel.likeResponse}');
        Get.find<BidCarsListViewModel>().getLikedCarData();
        Get.find<BidCarsListViewModel>().likeResponse.refresh();
        CustomToast.instance.showMsg(MyStrings.success);
      } else {
        CustomToast.instance.showMsg(response.reasonPhrase ?? MyStrings.unableToConnect);
      }
    } catch (e) {
      log(e.toString());
      CustomToast.instance.showMsg(ExceptionErrorUtil.handleErrors(e).errorMessage ?? MyStrings.unableToConnect);
    }
  }



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
                SizedBox(
                  width: double.infinity,
                  height: 107,
                  child: Image.network(imageUrl,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        return SvgPicture.asset(MyImages.loadingCar);
                      }, frameBuilder:
                          (context, child, frame, wasSynchronouslyLoaded) {
                        return child;
                      }, loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return SvgPicture.asset(MyImages.loadingCar);
                        }
                      }),
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
                  child: Container(
                    width: 23,
                    height: 23,
                    clipBehavior: Clip.antiAlias,
                    decoration: const ShapeDecoration(color: Colors.white, shape: OvalBorder(), shadows: [
                      BoxShadow(
                        color: MyColors.greyShadow,
                        blurRadius: 8,
                        offset: Offset(0, 3),
                        spreadRadius: 2,
                      )
                    ]),
                    child: Obx(
                          () => GestureDetector(
                        child: Icon(
                          isFavourite!.value ? Icons.favorite : Icons.favorite_border,
                          color: isFavourite!.value ? MyColors.red : MyColors.grey,
                          size: 16,
                        ),
                        onTap: () {
                          print("Tapping like button");
                          updateLikedCar(isFavourite!.value ? false : true);
                          isFavourite!.value == true ? isFavourite!.value = false : isFavourite!.value = true;
                          print("Like status: ${isFavourite!.value}");
                        },
                      ),
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
                    variant,
                    style: MyStyles.black12400,
                  ),
                   // const SizedBox(height: Dimens.standard_8),
                  Text(
                    model,
                    style: MyStyles.black14700,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: id));
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
