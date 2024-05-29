import 'package:mera_partners/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../view_model/tutorial/tutorial_view_model.dart';
import '../../widgets/tutorial_widgets.dart';

class TutorialScreen extends GetView<TutorialScreenViewModel> {
  TutorialScreen({super.key});

  final TutorialScreenViewModel viewModel = Get.isRegistered<TutorialScreenViewModel>() ? Get.find<TutorialScreenViewModel>() : Get.put(TutorialScreenViewModel());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.95,
      height: MediaQuery.of(context).size.height * 0.63,
      child: PageView(
        controller: controller.indicator,
        onPageChanged: ((value) {
          controller.page.value = value;
        }),
        children:  [
          TutorialWidgets(
            image: MyImages.scBid,
            title: MyStrings.stagesOfBidding,
            subtitle: MyStrings.tutorialSubtitle,
            colour: MyColors.black,
            colourTitle: "black",
          ),
          TutorialWidgets(
            image: MyImages.highBid,
            title: MyStrings.stagesOfBidding,
            subtitle: MyStrings.tutorialSubtitle1,
            colour: MyColors.kPrimaryColor,
            colourTitle: "blue",
          ),
          TutorialWidgets(
            image: MyImages.leadBid,
            title: MyStrings.stagesOfBidding,
            subtitle: MyStrings.tutorialSubtitle2,
            colour: MyColors.green,
            colourTitle: "green",
          ),
          TutorialWidgets(
            image: MyImages.looseBid,
            title: MyStrings.stagesOfBidding,
            subtitle: MyStrings.tutorialSubtitle3,
            colour: MyColors.red,
            colourTitle: "red",
          ),
        ],

      ),
    );
  }

}
