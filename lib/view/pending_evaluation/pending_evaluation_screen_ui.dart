import 'dart:developer';
import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/evaluation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../view_model/pending_evaluation/pending_evaluation_screen_view_model.dart';
import '../../widgets/common_app_bar.dart';
import '../../widgets/common_drawer.dart';
import '../../widgets/custom_text_form_field.dart';

/// ignore: must_be_immutable
class PendingEvaluationScreen extends StatelessWidget {
  PendingEvaluationScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  PendingEvaluationViewModel viewModel = Get.find<PendingEvaluationViewModel>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          Get.toNamed(AppRoutes.homeScreen);
        },
        child: Scaffold(
            key: _key,
            appBar: CommonAppBar(
              centerTitle: false,
              title: MyStrings.pendingEvaluation1,
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
            body: Obx(
              () => Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 40,
                      child: CustomTextFormField(
                        topPadding: 0,
                        labelStyle: MyStyles.greyStyle,
                        controller: viewModel.pendingEvaluationController.value,
                        labelText: MyStrings.search,
                        onChange: (value) {
                          log(value);
                          viewModel.applySearch(value);
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
                    // if(viewModel.carBasic.value.data != null),
                    Obx(() => viewModel.carBasic.value.data != null
                        ? Expanded(
                            child: ListView.separated(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: viewModel.carBasic.value.data!.length,
                                separatorBuilder: (context, index) => const SizedBox(height: 1),
                                itemBuilder: (context, index) {
                                  return EvaluationCard(
                                    make: viewModel.carBasic.value.data![index].make ?? '',
                                    variant: viewModel.carBasic.value.data![index].variant ?? '',
                                    regNumber: viewModel.carBasic.value.data![index].regNumber ?? '',
                                    leadId: viewModel.carBasic.value.data![index].uniqueId.toString(),
                                    model: viewModel.carBasic.value.data![index].model ?? '',
                                    transmission: viewModel.carBasic.value.data![index].transmission ?? '',
                                    date: viewModel.carBasic.value.data![index].inspectionDate ?? '',
                                    year: viewModel.carBasic.value.data![index].monthAndYearOfManufacture ?? '',
                                    id: viewModel.carBasic.value.data![index].sId,
                                  );
                                }),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          )),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
