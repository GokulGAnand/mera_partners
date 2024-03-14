import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';


import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/strings.dart';
import '../view_model/tutorial/tutorial_view_model.dart';
import 'custom_button.dart';
class TutorialWidgets extends StatelessWidget{
  final String? image;
  final String? title;
  final String? subtitle;
  final Color colour;
  final String? colourTitle;

  const TutorialWidgets({super.key, this.image, this.title, this.subtitle, required this.colour, this.colourTitle});

  @override
  Widget build(BuildContext context) {
    TutorialScreenViewModel controller = Get.find<TutorialScreenViewModel>();
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: Dimens.standard_20),
        Container(
          height: size.height * 0.3,
          width: size.width * 0.72,
          // alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: MyColors.grey
          ),
          child:Container(
            height: size.height * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image ?? ''), ),
            ),
          ) ,
        ),

        Container(
          height: size.height * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            // color: Colors.white,
          ),
          padding: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: Dimens.standard_10
                ),
                Text(
                  '${title}',
                  style: const TextStyle(fontSize: 18, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500, color: MyColors.black),
                ),
                SizedBox(
                     height: Dimens.standard_15
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text.rich(
                    TextSpan(
                        text:  '${subtitle}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          color: MyColors.black2,
                        ),

                        children: [
                          TextSpan(
                            text: " ${colourTitle ?? ''}",
                            style:  TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              color:colour ,

                            ),

                          ),
                          TextSpan(
                            text: MyStrings.color,
                            style:  TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              color:MyColors.black ,
                            ),
                          ),

                        ]
                    ), textAlign: TextAlign.center,

                  ),


                ),
                SizedBox(height: Dimens.standard_15),
                Obx(
                        () =>
                        Align(
                            alignment: const Alignment(0, 0.10),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List<Widget>.generate(
                                    4,
                                        (index) =>
                                        Container(
                                            margin: const EdgeInsets.all(1),
                                            width: 24,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: controller.page.value == index ? MyColors.blue : MyColors.grey,
                                            ),

                                        ),

                                ),

                            ),
                        )),
                SizedBox(height: Dimens.standard_18),
                Obx(
                      () => CustomElevatedButton(
                                          onPressed: () {
                      print('Current Page: ${controller.page.value}');
                      if (controller.page.value == 3) {
                      } else {
                        controller.indicator.jumpToPage(
                          controller.page.value.toInt() + 1,
                        );
                      }
                      controller.update();
                                          },
                                          textColor: MyColors.white,
                                          buttonText: controller.page.value == 3 ? MyStrings.startBiding : MyStrings.next,
                                        ),
                )
              ],
            ),
          ),
        ),


      ],
    );
  }

}