import 'dart:async';

import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

/// ignore: must_be_immutable
class CustomSlider extends StatelessWidget {
  CustomSlider(
      {required this.sliderImage,
      required this.pageSliderController,
      required this.activePage,
      this.showBlackOpacity = false,
      this.height = 200,
      super.key});
  List<String> sliderImage;
  Rx<PageController> pageSliderController;
  var activePage;
  bool showBlackOpacity;
  double height;

  Timer? carouselTimer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (activePage.value == 5) {
        activePage.value = 0;
      }
      pageSliderController.value.animateToPage(
        activePage.value,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      activePage.value++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: height,
            child: PageView.builder(
              controller: pageSliderController.value,
              onPageChanged: (index) {
                activePage.value = index;
              },
              itemBuilder: (_, index) {
                return AnimatedBuilder(
                    animation: pageSliderController.value,
                    builder: (ctx, child) {
                      return child!;
                    },
                    child: Image.network(sliderImage[index], fit: BoxFit.cover,
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
                    }));
              },
              itemCount: sliderImage.length,
            ),
          ),
          if (showBlackOpacity)
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: height,
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
            bottom: 12,
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
                          color: activePage.value == index
                              ? MyColors.white
                              : MyColors.grey,
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
    );
  }
}
