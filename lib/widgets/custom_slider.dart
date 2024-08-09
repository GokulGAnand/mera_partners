import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.sliderImage,
    required this.pageSliderController,
    required this.activePage,
    this.showBlackOpacity = false,
    this.height = 200,
  });

  final List<String> sliderImage;
  final Rx<PageController> pageSliderController;
  final RxInt activePage;
  final bool showBlackOpacity;
  final double height;

  @override
  Widget build(BuildContext context) {
    // Set initialPage to ensure only one page is visible at a time
     pageSliderController.value = PageController(initialPage: 0);

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 0) {
          if (activePage.value > 0) {
            activePage.value--;
            pageSliderController.value.animateToPage(
              activePage.value,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }
        } else if (details.delta.dx < 0) {
          if (activePage.value < sliderImage.length - 1) {
            activePage.value++;
            pageSliderController.value.animateToPage(
              activePage.value,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          }
        }
      },
      child: Obx(
            () => SizedBox(
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
                    pageSliderController.value.animateToPage(
                      activePage.value,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  itemBuilder: (_, index) {
                    return CachedNetworkImage(
                      imageUrl: sliderImage[index],
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) {
                        return SvgPicture.asset(MyImages.loadingCar);
                      },
                      placeholder: (context, url) {
                        return SvgPicture.asset(MyImages.loadingCar);
                      },
                    );
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
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black
                        ],
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
                // left: MediaQuery.of(context).size.width * 0.39,
                left: 0,
                right: 0,
                child: Obx(
                      () => SizedBox(
                    width: 41,
                    height: 4.56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5,
                            (index) => GestureDetector(
                          onTap: () => pageSliderController.value.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          ),
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
        ),
      ),
    );
  }
}
