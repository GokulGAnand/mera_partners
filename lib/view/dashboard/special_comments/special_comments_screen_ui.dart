import 'package:evaluator_app/utils/dimens.dart';
import 'package:evaluator_app/widgets/common_drawer.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../service/internet_check.dart';
import '../../../utils/colors.dart';
import '../../../utils/images.dart';
import '../../../utils/strings.dart';
import '../../../utils/styles.dart';
import '../../../view_model/dashboard/special_comments/special_comments_view_model.dart';
import '../../../widgets/common_app_bar.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/custom_toast.dart';

/// ignore: must_be_immutable
class SpecialCommentsScreen extends StatelessWidget {
  SpecialCommentsScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  SpecialCommentsViewModel viewModel = Get.find<SpecialCommentsViewModel>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        key: _key,
        centerTitle: false,
        title: MyStrings.specialComments,
        leading: IconButton(
          icon: SvgPicture.asset(MyImages.menu),
          color: MyColors.black,
          onPressed: () {
            _key.currentState!.openDrawer();
          },
        ),
        actions: [IconButton(onPressed: () {}, icon: SvgPicture.asset(MyImages.notification))],
      ),
      drawer: const CommonDrawer(),
      body: SingleChildScrollView(
        child: Form(
          key: viewModel.formKey,
          child: Column(
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
                      padding: const EdgeInsets.fromLTRB(10, 40, 10, 0),
                      child: Container(
                        height: 5,
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: viewModel.activePage.value == 0 ? MyColors.kPrimaryColor : MyColors.lightBlue,
                        ),
                      ),
                    ),
                  ))
                ],
              ),
              const SizedBox(height: 50),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: CustomDropDown(
                    hintText: '${MyStrings.carCondition}*',
                    label: viewModel.selectedCarCondition.value.isEmpty ? null : "${MyStrings.carCondition}*",
                    value: viewModel.selectedCarCondition.value.isEmpty ? null : viewModel.selectedCarCondition.value,
                    items: viewModel.specialCommentsList.map<DropdownMenuItem<String>>(
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
                      viewModel.selectedCarCondition.value = value;
                    },
                    validator: (value) {
                      if (value == null) {
                        return MyStrings.required;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(height: Dimens.standard_24),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: CustomTextFormField(
                    minLines: 5,
                    // for increase the the size of textformfield
                    maxLines: 5,
                    topPadding: 0,
                    labelStyle: MyStyles.regular,
                    controller: viewModel.specialCommentsController.value,
                    labelText: MyStrings.comments,
                    onChange: (value) {},
                    validator: (String? value) {
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 270),
              Padding(
                padding: const EdgeInsets.fromLTRB(17, 0, 17, 25),
                child: CustomElevatedButton(
                    onPressed: () {
                      if (viewModel.formKey.currentState!.validate()) {
                        Internet.checkInternet().then((value) {
                          if (value) {
                            viewModel.addComments();
                            viewModel.getComments();
                          } else {
                            CustomToast.instance.showMsg(MyStrings.checkNetwork);
                          }
                        });
                      }
                    },
                    buttonText: MyStrings.submit),
              )
            ],
          ),
        ),
      ),
    );
  }
}
