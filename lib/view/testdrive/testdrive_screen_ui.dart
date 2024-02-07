import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/images.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/common_app_bar.dart';
import 'package:evaluator_app/widgets/common_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../view_model/testdrive/testdrive_screen_view_model.dart';
import '../../widgets/custom_dropdown.dart';

/// ignore: must_be_immutable
class TestDriveScreen extends StatelessWidget {
  TestDriveScreen({super.key});
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  TestDriveViewModel viewModel = Get.find<TestDriveViewModel>();


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
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      viewModel.pageController.value.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                      child: Container(
                        height: 5,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: viewModel.activePage.value == 0
                              ? MyColors.kPrimaryColor
                              : MyColors.lightBlue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            CustomDropDown(
              hintText: MyStrings.steering,
              label: viewModel.selectedSteeringWheel.value.isEmpty
                  ? null
                  : "${MyStrings.steering}*",
              value: viewModel.selectedSteeringWheel.value.isEmpty
                  ? null
                  : viewModel.selectedSteeringWheel.value,
              items: viewModel.steeringWheelList.map<DropdownMenuItem<String>>(
                    (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: MyStyles.dropdownMenuStyle,
                    ),
                  );
                },
              ).toList(),
              onChanged: (value) {
                viewModel.selectedSteeringWheel.value = value;
              },
              validator: (value) {
                if (value == null) {
                  return MyStrings.required;
                }
                return null;
              },
            ),
            CustomDropDown(
              hintText: MyStrings.steering,
              label: viewModel.selectedSteeringWheel.value.isNotEmpty
                  ? null
                  : "${MyStrings.steering}*",
              value: viewModel.selectedSteeringWheel.value.isEmpty
                  ? null
                  : viewModel.selectedSteeringWheel.value,
              items: viewModel.steeringWheelList.map<DropdownMenuItem<String>>(
                    (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: MyStyles.dropdownMenuStyle,
                    ),
                  );
                },
              ).toList(),
              onChanged: (value) {
                viewModel.selectedSteeringWheel.value = value;
              },
              validator: (value) {
                if (value == null) {
                  return MyStrings.required;
                }
                return null;
              },
            ),
          ],
        ),




      ),
    );
  }
}
