import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/svg.dart';
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
    Map<String, dynamic> image = Get.arguments;
    return Scaffold(
      backgroundColor: MyColors.black4,
      appBar: CommonAppBar(title: image["title"]),
      body: Stack(
        fit: StackFit.expand,
        children: [
          InteractiveViewer(
            minScale: 0.1,
            maxScale: 4.0,
            clipBehavior: Clip.none,
            child: Center(
              child: CachedNetworkImage(
                imageUrl: image["image"],
                fit: BoxFit.contain,
                errorWidget: (context, url, error) {
                  return SvgPicture.asset(MyImages.loadingCar);
                },
                placeholder: (context, url) {
                  return SvgPicture.asset(MyImages.loadingCar);
                },
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  image["image_title"],
                  style: MyStyles.white16700,
                ),
                if (image["subtitle"] != null && image["subtitle"].isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      '(${image["subtitle"]})',
                      style: MyStyles.white16700.copyWith(fontSize: 14),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}