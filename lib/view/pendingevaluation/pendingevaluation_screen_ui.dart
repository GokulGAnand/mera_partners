import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../widgets/common_app_bar.dart';
import '../../widgets/custom_text_form_field.dart';

class PendingEvaluationScreen extends StatelessWidget {
  PendingEvaluationScreen({super.key});
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
       child: Scaffold(
         appBar: CommonAppBar(
           title: MyStrings.pendingEvaluation1,
           leading: IconButton(
             icon: SvgPicture.asset(MyImages.menu),
             color: MyColors.black0,
             iconSize: 28,
             onPressed: () {

             },
           ),
           actions: [
             IconButton(
                 onPressed: () {},
                 icon: SvgPicture.asset(MyImages.notification))
           ],
         ),
         body: CustomTextFormField(controller: _textEditingController, validator: (String? value) {
           return null;
           },)
       ),
    );
  }
}
