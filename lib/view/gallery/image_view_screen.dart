import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> imageData = Get.arguments;
    return Scaffold(
      backgroundColor: MyColors.black4,
      appBar: CommonAppBar(title: imageData["title"]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "${imageData["image_title"]} ",
              style: MyStyles.white16700,
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
          InteractiveViewer(
            child: AspectRatio(
                              aspectRatio: 16/9,
                              child: Image.network(imageData["image"],
                              fit: BoxFit.fill,),
                              ),)
        ],
      ),
    );
  }
}
