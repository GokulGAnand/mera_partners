import 'package:evaluator_app/view_model/new_evaluation/new_evaluation_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// ignore: must_be_immutable
class NewEvaluationScreen extends StatelessWidget {
  NewEvaluationScreen({super.key});

  NewEvaluationViewModel viewModel = Get.put(NewEvaluationViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: Stack(
            children: [
              PageView.builder(
                controller: viewModel.pageController.value,
                onPageChanged: (int page) {
                  viewModel.activePage.value = page;
                },
                itemCount: viewModel.pages.length,
                itemBuilder: (BuildContext context, int index) {
                  return viewModel.pages[index % viewModel.pages.length];
                },
              ),

              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      viewModel.pages.length,
                          (index) => InkWell(
                            onTap: () {
                              viewModel.pageController.value.animateToPage(index,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeIn);
                            },
                            child: Container(
                              height: 5,
                              width: 20,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: viewModel.activePage.value == index
                                    ? Colors.amber
                                    : Colors.grey,
                              ),

                            ),
                          )),
                ),
              ),
            ],
          ),
        ));
      }
  }

