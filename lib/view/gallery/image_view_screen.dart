import 'package:flutter_svg/flutter_svg.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/images.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //title, image_title, image
    Map<String, dynamic> image = Get.arguments;
    return Scaffold(
      backgroundColor: MyColors.black4,
      appBar: CommonAppBar(title: image["title"]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              image["image_title"],
              style: MyStyles.white16700,
            ),
          ),
          InteractiveViewer(
            child: AspectRatio(
                                aspectRatio: 16/9,
                                child: Image.network(image["image"],
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
          ),
          // InteractiveViewer(
          //   child: Container(
          //     width: double.infinity,
          //     height: 216,
          //     decoration: const BoxDecoration(
          //         image: DecorationImage(
          //             image: NetworkImage(
          //                 "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
          //             fit: BoxFit.fill)),
          //   ),
          // ),
        ],
      ),
    );
  }
}
