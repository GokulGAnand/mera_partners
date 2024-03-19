import 'dart:async';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/images.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';
import 'custom_button.dart';

/// ignore: must_be_immutable
class CustomCarDetailCard extends StatelessWidget {
  final String imageUrl;
  final List<String> images;
  final String carLocation;
  final String bidStatus;
  final String bidAmount;
  final String carModel;
  final String carVariant;
  final num rating;
  final String fuelType;
  final String? criticalIssue;
  final String id;
  final String fmv;
  final String kmDriven;
  final String ownerShip;
  final String transmission;
  late final Rx<bool>? isFavourite = false.obs;
  Rx<PageController> pageController = PageController(initialPage: 0, viewportFraction: 0.85).obs;
  var activePage = 0.obs;
  Timer? carouselTimer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (activePage.value == 5) {
        activePage.value = 0;
      }
      pageController.value.animateToPage(
        activePage.value,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      activePage.value++;
    });
  }

  CustomCarDetailCard({
    super.key,
    required this.imageUrl,
    required this.carLocation,
    required this.bidStatus,
    required this.bidAmount,
    required this.carModel,
    required this.carVariant,
    required this.rating,
    required this.fuelType,
    this.criticalIssue,
    required this.id,
    required this.fmv,
    required this.kmDriven,
    required this.ownerShip,
    required this.transmission,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    carouselTimer = getTimer();
    return Padding(
      padding: const EdgeInsets.only(bottom: 58.0,top: 8),
      child: Container(
        // elevation: 5,
        // color: MyColors.white,
        // surfaceTintColor: MyColors.white,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: MyColors.white1,
            boxShadow: const [
              BoxShadow(
                color: MyColors.greyShadow,
                blurRadius: 8,
                offset: Offset(0, 3),
                spreadRadius: 0,
              )
            ],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(8)),
        // shape: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        child: SizedBox(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    child: Obx(
                      () => SizedBox(
                        height: 200,
                        child: PageView.builder(
                          controller: pageController.value,
                          onPageChanged: (index) {
                            activePage.value = index;
                          },
                          itemBuilder: (_, index) {
                            return AnimatedBuilder(
                                animation: pageController.value,
                                builder: (ctx, child) {
                                  return child!;
                                },
                                child: Image.network(images[index], fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
                                  return SvgPicture.asset(MyImages.loadingCar);
                                }, frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                  return child;
                                }, loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return SvgPicture.asset(MyImages.loadingCar);
                                  }
                                }));
                          },
                          itemCount: images.length,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 213,
                      decoration: ShapeDecoration(
                        gradient: LinearGradient(
                          begin: const Alignment(0.00, -0.00),
                          end: const Alignment(0, 1),
                          colors: [Colors.black.withOpacity(0), Colors.black],
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 10,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          MyImages.location,
                        ),
                        Text(carLocation, style: MyStyles.white11400),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
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
                            isFavourite!.value == true ? isFavourite!.value = false : isFavourite!.value = true;
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: MediaQuery.of(context).size.width * 0.39,
                    child: Obx(
                      () => SizedBox(
                        width: 41,
                        height: 4.56,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            5,
                            (index) => GestureDetector(
                              child: Container(
                                margin: const EdgeInsets.only(left: 2.0),
                                child: Icon(
                                  Icons.circle,
                                  size: 6.0,
                                  color: activePage.value == index ? MyColors.white : MyColors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 37,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment(2.00, 0.00),
                    begin: Alignment(-1, 0),
                    colors: [Color(0xFF1B69B8), Color(0x0036454F)],
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    Text(bidStatus, style: MyStyles.whiteTitleStyle),
                    const SizedBox(
                      width: 15,
                    ),
                    if (bidAmount.isNotEmpty) Text('₹$bidAmount', textAlign: TextAlign.center, style: MyStyles.white16700),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(carModel, style: MyStyles.subTitleBlackStyle),
                            const SizedBox(
                              width: 2,
                            ),
                            if (criticalIssue?.toLowerCase() == 'good') SvgPicture.asset(MyImages.verified)
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(carVariant, style: MyStyles.black16700),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '${MyStrings.rating} ',
                          style: TextStyle(
                            color: rating >= 4
                                ? MyColors.green2
                                : rating >= 2.5 && rating <= 3.5
                                    ? MyColors.yellow
                                    : MyColors.red,
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        Text(
                          rating.toString(),
                          style: TextStyle(
                            color: rating >= 4
                                ? MyColors.green2
                                : rating >= 2.5 && rating <= 3.5
                                    ? MyColors.yellow
                                    : MyColors.red,
                            fontSize: 14,
                            fontFamily: 'DM Sans',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        const SizedBox(
                          width: 1.5,
                        ),
                        Icon(
                          Icons.star,
                          color: rating >= 4
                              ? MyColors.green2
                              : rating >= 2.5 && rating <= 3.5
                                  ? MyColors.yellow
                                  : MyColors.red,
                          size: Dimens.iconSizeS,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: const BoxDecoration(color: MyColors.lightBlue),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(fuelType, style: MyStyles.regular12),
                          const SizedBox(width: 6),
                          const Text('|', style: MyStyles.regular12),
                          const SizedBox(width: 6),
                          Text('$kmDriven KM', style: MyStyles.regular12),
                          const SizedBox(width: 6),
                          const Text('|', style: MyStyles.regular12),
                          const SizedBox(width: 6),
                          Text(ownerShip, style: MyStyles.regular12),
                          const SizedBox(width: 6),
                          if (transmission.isNotEmpty) const Text('|', style: MyStyles.regular12),
                          if (transmission.isNotEmpty) const SizedBox(width: 6),
                          Text(transmission, style: MyStyles.regular12),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              if (criticalIssue != null && criticalIssue?.toLowerCase() != 'good')
                Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.warning,
                        color: MyColors.red,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(criticalIssue ?? '', style: MyStyles.red12700),
                    ],
                  ),
                ),
              if (criticalIssue != null)
                const SizedBox(
                  height: 21,
                ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bid ends in',
                          style: MyStyles.orange12500,
                        ),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer_sharp,
                              color: MyColors.orange,
                              size: 14,
                            ),
                            Text('09min 06sec', style: MyStyles.orange14700),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 14,
                          child: Row(
                            children: [
                              GestureDetector(
                                child: const Icon(
                                  Icons.copy,
                                  color: MyColors.black,
                                  size: Dimens.iconSizeS,
                                ),
                                onTap: () {
                                  Clipboard.setData(ClipboardData(text: id));
                                  CustomToast.instance.showMsg('Text copied to clipboard');
                                },
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('ID:$id', style: MyStyles.black12400),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(MyImages.carTag),
                            const SizedBox(
                              width: 4,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(text: 'FMV  ', style: MyStyles.subTitleGreayStyle),
                                  TextSpan(text: '₹$fmv', style: MyStyles.grey14700),
                                ],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomElevatedButton(
                        buttonWidth: MediaQuery.of(context).size.width * 0.38,
                        buttonHeight: Dimens.defHeight,
                        textColor: MyColors.kPrimaryColor,
                        buttonStyle: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              width: 1,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: MyColors.kPrimaryColor,
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        onPressed: () {},
                        buttonText: MyStrings.autoBid),
                    CustomElevatedButton(buttonWidth: MediaQuery.of(context).size.width * 0.38, buttonHeight: Dimens.defHeight, onPressed: () {}, buttonText: MyStrings.bid),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
