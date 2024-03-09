import 'package:evaluator_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingWidgets extends StatelessWidget {
  final String? image;
  final String? title;
  final String? subtitle;
  final int values;
  const OnBoardingWidgets({super.key, this.image, this.title, this.subtitle,required this.values});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,

        ),
        Container(
           height: 300,
          // width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image??''),
              fit: BoxFit.values[values]
            ),
          ),
        ),
        Container(
          height: Get.height * 0.35,
          width: Get.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${title}',
                style: const TextStyle(fontSize: 24,fontStyle: FontStyle.normal,fontWeight: FontWeight.w700,color: MyColors.black),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                '${subtitle}',
                style: const TextStyle(fontSize: 15,fontStyle: FontStyle.normal,fontWeight: FontWeight.w400,color: MyColors.grey),
                textAlign: TextAlign.center,
              )
            ],
          ),
        )
      ],
    );
  }
}
