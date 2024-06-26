import 'package:flutter_svg/svg.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/images.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/images.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> image = Get.arguments;
    return Scaffold(
      backgroundColor: MyColors.black4,
      appBar: CommonAppBar(title: image["title"]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,bottom: 8,),
            child: Row(
              children: [
                Expanded(
                  child: image["subtitle"] != null && image["subtitle"].isNotEmpty
                      ? Text(
                    image["image_title"] + ' (${image["subtitle"]})',
                    style: MyStyles.white16700,
                  )
                      : const SizedBox(),
                )
              ],
            ),
          ),
          Expanded(
            child: InteractiveViewer(
              minScale: 0.1,
              maxScale: 4.0,
              clipBehavior: Clip.none,
              child: Center(
                child: Image.network(
                  image["image"],
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return SvgPicture.asset(MyImages.loadingCar);
                  },
                  frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                    return child;
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
