import 'package:evaluator_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import '../utils/dimens.dart';
import '../utils/strings.dart';
import '../view_model/tutorial/tutorial_view_model.dart';
import 'custom_button.dart';

class TutorialWidgets extends StatelessWidget {
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
        // SizedBox(height: Dimens.standard_2),
        Container(
          height: size.height * 0.3,
          width: size.width * 0.8,
          // alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: MyColors.lightGrey),
          child: Container(
            height: size.height * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image ?? ''),
              ),
            ),
          ),
        ),
        Container(
          height: size.height * 0.35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            // color: Colors.white,
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Dimens.standard_20),
              Text(
                '$title',
                style: MyStyles.black18500,
              ),
              SizedBox(height: Dimens.standard_20),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text.rich(
                  TextSpan(
                      text: '${subtitle}',
                      style: MyStyles.black15400,
                      children: [
                        TextSpan(
                          text: " ${colourTitle ?? ''}",
                          style: TextStyle(
                            fontSize: 15,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w700,
                            color: colour,
                          ),
                        ),
                        const TextSpan(text: MyStrings.color, style: MyStyles.black15400),
                      ]),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: Dimens.standard_20),
              Obx(() => Align(
                    alignment: const Alignment(0, 0.10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List<Widget>.generate(
                        4,
                        (index) => Container(
                          margin: const EdgeInsets.all(1),
                          width: 24,
                          height: 10,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: controller.page.value == index ? MyColors.kPrimaryColor : MyColors.lightGrey,
                          ),
                        ),
                      ),
                    ),
                  )),
              SizedBox(height: Dimens.standard_20),
              Obx(
                () => CustomElevatedButton(
                  onPressed: () {
                    print('Current Page: ${controller.page.value}');
                    if (controller.page.value == 3) {
                      Navigator.of(context).popUntil((route) => route.isFirst);
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
      ],
    );
  }
}
