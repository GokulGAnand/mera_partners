import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageViewScreen extends StatelessWidget {
  const ImageViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.black4,
      appBar: CommonAppBar(title: Get.arguments),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Front Main (Scratched,Dented) ",
              style: MyStyles.white16700,
            ),
          ),
          InteractiveViewer(
            child: Container(
              width: double.infinity,
              height: 216,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                      fit: BoxFit.fill)),
            ),
          ),
        ],
      ),
    );
  }
}
