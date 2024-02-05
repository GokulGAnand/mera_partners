import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/images.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/common_app_bar.dart';
import 'package:evaluator_app/widgets/common_drawer.dart';
import 'package:evaluator_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TestDriveScreen extends StatelessWidget {
  TestDriveScreen({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        appBar: CommonAppBar(
          centerTitle: false,
          title: MyStrings.test,
          leading: IconButton(
            icon: SvgPicture.asset(MyImages.menu),
            color: MyColors.black,
            onPressed: () {
              _key.currentState!.openDrawer();
            },
            iconSize: 28,
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: SvgPicture.asset(MyImages.notification))
          ],
        ),
        drawer: const CommonDrawer(),

      ),
    );
  }
}
