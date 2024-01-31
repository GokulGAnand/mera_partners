import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/colors.dart';
import '../../utils/dimens.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../widgets/common_app_bar.dart';
import '../../widgets/common_drawer.dart';

/// ignore: must_be_immutable
class NewEvaluationPageOne extends StatelessWidget {
  NewEvaluationPageOne({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: MyStrings.newEvaluation1,
        leading: IconButton(
          icon: SvgPicture.asset(MyImages.menu),
          color: MyColors.black0,
          iconSize: 28,
          onPressed: () {
            _key.currentState!.openDrawer();
          },
        ),
        actions: [
          Row(
            children: [
              Padding(
                padding: Dimens.padding16,
                child: SvgPicture.asset(MyImages.notification,
                  width: Dimens.standard_24,
                  height: Dimens.standard_24,
                ),
              ),
            ],
          )
        ],
      ),
      drawer: const CommonDrawer(),
      body: Column(),
    );
  }
}
