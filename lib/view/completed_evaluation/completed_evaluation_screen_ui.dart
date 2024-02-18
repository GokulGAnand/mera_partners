import 'dart:developer';
import 'package:evaluator_app/view_model/completed_evaluation/completed_evaluation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';
import '../../widgets/common_app_bar.dart';
import '../../widgets/common_drawer.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/evaluation_card.dart';

/// ignore: must_be_immutable
class CompletedEvaluationListScreen extends StatelessWidget {
  CompletedEvaluationListScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<Widget>? pages;
  CompletedEvaluationViewModel viewModel = Get.find<CompletedEvaluationViewModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _key,
          appBar: CommonAppBar(
            centerTitle: false,
            title: MyStrings.completedEvaluation,
            leading: IconButton(
              icon: SvgPicture.asset(MyImages.menu),
              color: MyColors.black0,
              iconSize: 28,
              onPressed: () {
                _key.currentState!.openDrawer();
              },
            ),
            actions: [IconButton(onPressed: () {}, icon: SvgPicture.asset(MyImages.notification))],
          ),
          drawer: const CommonDrawer(),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 40,
                  child: Obx(
                    () => CustomTextFormField(
                      topPadding: 0,
                      labelStyle: MyStyles.greyStyle,
                      controller: viewModel.searchController.value,
                      labelText: MyStrings.search,
                      onChange: (value) {
                        log(value.toString());
                        viewModel.applyFilter(value);
                      },
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          MyImages.search1,
                        ),
                      ),
                      validator: (String? value) {
                        return null;
                      },
                    ),
                  ),
                ),
                Obx(() => viewModel.carBasic.value.data != null
                    ? Expanded(
                        child: ListView.separated(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: viewModel.carBasic.value.data!.length,
                            separatorBuilder: (context, index) => const SizedBox(height: 1),
                            itemBuilder: (context, index) {
                              return EvaluationCard(make: viewModel.carBasic.value.data![index].make ?? '',
                                  variant: viewModel.carBasic.value.data![index].variant?? '',
                                  regNumber: viewModel.carBasic.value.data![index].regNumber?? '',
                                  kmDriven: viewModel.carBasic.value.data![index].odometerReading != null?viewModel.carBasic.value.data![index].odometerReading.toString():'-',
                                  leadId: viewModel.carBasic.value.data![index].uniqueId != null ? viewModel.carBasic.value.data![index].uniqueId.toString():'',
                                  model: viewModel.carBasic.value.data![index].model?? '',
                                  transmission: viewModel.carBasic.value.data![index].transmission?? '',
                                  date: viewModel.carBasic.value.data![index].inspectionDate?? '',
                                  year:viewModel.carBasic.value.data![index].monthAndYearOfManufacture?? '' );
                            }),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      )),
              ],
            ),
          )),
    );
  }
}
