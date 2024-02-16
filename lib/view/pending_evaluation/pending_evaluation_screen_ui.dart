import 'dart:developer';

import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_card.dart';
import 'package:evaluator_app/widgets/evaluation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
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
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 40,
                  child: Obx(() => CustomTextFormField(
                      topPadding: 0,
                      labelStyle: MyStyles.greyStyle,
                      controller: viewModel.pendingEvaluationController.value,
                      labelText: MyStrings.search,
                      onChange: (value) {
                        print(value);
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
                        return EvaluationCard(make: viewModel.carBasic.value.data![index].make ?? '',
                                             variant: viewModel.carBasic.value.data![index].variant?? '',
                                             regNumber: viewModel.carBasic.value.data![index].maskedRegNumber?? '',
                                             leadId: viewModel.carBasic.value.data![index].sId?? '',
                                             model: viewModel.carBasic.value.data![index].model?? '',
                                             transmission: viewModel.carBasic.value.data![index].sId?? '',
                                             date: viewModel.carBasic.value.data![index].updatedAt?? '',
                                              year:viewModel.carBasic.value.data![index].updatedAt?? '' );
                        /*return Padding(
                          padding: const EdgeInsets.only(top: 36, right: 10, left: 10),
                          child: Container(
                            clipBehavior: Clip.none,
                            height: 202,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: MyColors.white,
                              boxShadow: const [
                                BoxShadow(
                                  color: MyColors.grey,
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                  offset: Offset(0, 0),
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(viewModel.carBasic.value.data![index].make ?? "", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: MyColors.blue)),
                                      const SizedBox(height: 10),
                                      Text(viewModel.carBasic.value.data![index].variant ?? "", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400)),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 39,
                                        width: 139,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: MyColors.white, border: Border.all(color: MyColors.blue)),
                                        child: Center(
                                            child: Text(
                                              viewModel.carBasic.value.data![index].maskedRegNumber ?? "",
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.blue),
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 139,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: MyColors.blue, border: Border.all(color: MyColors.blue)),
                                        child: const Center(
                                            child: Text(
                                              MyStrings.resumeReport,
                                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: MyColors.white),
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 2.5,
                                        ),
                                        Text('LEAD ID : ' + viewModel.carBasic.value.data![index].uniqueId.toString(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,overflow: TextOverflow.ellipsis)),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 18,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: MyColors.lightBlue),
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 5.0, right: 5),
                                                child: Center(child: Text(viewModel.carBasic.value.data![index].variant ?? "", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: MyColors.black))),
                                              ),
                                            ),
                                            const SizedBox(width: 6),
                                            Container(
                                              height: 18,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: MyColors.lightBlue),
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 5.0, right: 5),
                                                child: Center(child: Text(viewModel.carBasic.value.data![index].model ?? "", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: MyColors.black))),
                                              ),
                                            ),
                                            const SizedBox(width: 6),
                                            Container(
                                              height: 18,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: MyColors.lightBlue),
                                              child: Padding(
                                                padding: EdgeInsets.only(left: 5.0, right: 5),
                                                child: Center(child: Text(viewModel.carBasic.value.data![index].fuelType ?? "", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: MyColors.black))),
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(top: 5),
                                              child: SvgPicture.asset(MyImages.speedometer),
                                            ),
                                            const SizedBox(width: 2),
                                            const Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text('KMS DRIVEN', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: MyColors.blue)),
                                            ),
                                            const SizedBox(width: 6),
                                            Padding(
                                              padding: EdgeInsets.only(top: 5),
                                              child: Text(viewModel.carBasic.value.data![index].highestBid.toString()?? "", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: MyColors.black)),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 1,
                                        ),
                                        Row(
                                          children: [Image.asset(MyImages.calendar2), const SizedBox(width: 5), const Text('INS.DATE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: MyColors.blue)),
                                            const SizedBox(width: 5),
                                            Text(
                                              DateFormat('dd-MM-yyyy').format(
                                                DateTime.parse(viewModel.carBasic.value.data![index].updatedAt ?? "")),style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: MyColors.black))],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Container(
                                          height: 40,
                                          width: 139,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: MyColors.blue, border: Border.all(color: MyColors.blue)),
                                          child: const Center(
                                              child: Text(
                                                MyStrings.delete,
                                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: MyColors.white),
                                              )),
                                         ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );*/
                      }),
                    )
                    : Center(
                  child: CircularProgressIndicator(),
                )),
                /*Expanded(
                    child: FutureBuilder(
                        future: PendingEvaluationViewModel.fetchCarBasicsData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: const CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Text('Error:${snapshot.error}');
                          } else {


                            return Obx(() =>  ListView.separated(
                                scrollDirection: Axis.vertical,
                                itemCount : viewModel.carBasic.value.data!.length,
                                separatorBuilder: (context, index) => const SizedBox(height: 1),
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 36, right: 10, left: 10),
                                    child: Container(
                                      clipBehavior: Clip.none,
                                      height:  202,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: MyColors.white,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: MyColors.grey,
                                            spreadRadius: 0,
                                            blurRadius: 5,
                                            offset: Offset(0, 0),
                                          )
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(18.0, 20, 18, 15),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(viewModel.carBasic.value.data![index].make ?? "", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: MyColors.blue)),
                                                const SizedBox(height: 10),
                                                 Text(viewModel.carBasic.value.data![index].variant ?? "", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400)),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  height: 39,
                                                  width: 139,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: MyColors.white, border: Border.all(color: MyColors.blue)),
                                                  child:  Center(
                                                      child: Text(
                                                        viewModel.carBasic.value.data![index].maskedRegNumber ?? "",
                                                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.blue),
                                                      )),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  height: 40,
                                                  width: 139,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: MyColors.blue, border: Border.all(color: MyColors.blue)),
                                                  child: const Center(
                                                      child: Text(
                                                        'Resume Report',
                                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: MyColors.white),
                                                      )),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                const SizedBox(
                                                  height: 2.5,
                                                ),
                                                 Text('LEAD ID : '+viewModel.carBasic.value.data![index].sId!, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                                                const SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: 18,
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: MyColors.lightBlue),
                                                      child:  Padding(
                                                        padding: EdgeInsets.only(left: 5.0, right: 5),
                                                        child: Center(child: Text(viewModel.carBasic.value.data![index].variant ?? "", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: MyColors.black))),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 6),
                                                    Container(
                                                      height: 18,
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: MyColors.lightBlue),
                                                      child:  Padding(
                                                        padding: EdgeInsets.only(left: 5.0, right: 5),
                                                        child: Center(child: Text(viewModel.carBasic.value.data![index].createdAt ?? "", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: MyColors.black))),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 6),
                                                    Container(
                                                      height: 18,
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: MyColors.lightBlue),
                                                      child:  Padding(
                                                        padding: EdgeInsets.only(left: 5.0, right: 5),
                                                        child: Center(child: Text(viewModel.carBasic.value.data![index].status ?? "", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: MyColors.black))),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(top: 5),
                                                      child: SvgPicture.asset(MyImages.speedometer),
                                                    ),
                                                    const SizedBox(width: 2),
                                                    const Padding(
                                                      padding: EdgeInsets.only(top: 5),
                                                      child: Text('KMS DRIVEN', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: MyColors.blue)),
                                                    ),
                                                    const SizedBox(width: 6),
                                                     Padding(
                                                      padding: EdgeInsets.only(top: 5),
                                                      child: Text( viewModel.carBasic.value.data![index].updatedAt ?? "", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: MyColors.black)),
                                                    )
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 1,
                                                ),
                                                Row(
                                                  children: [Image.asset(MyImages.calendar2), const SizedBox(width: 5), const Text('INS.DATE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: MyColors.blue)), const SizedBox(width: 5),  Text(viewModel.carBasic.value.data![index].vehicleLocation ?? "", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: MyColors.black))],
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Container(
                                                  height: 40,
                                                  width: 139,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: MyColors.blue, border: Border.all(color: MyColors.blue)),
                                                  child: const Center(
                                                      child: Text(
                                                        'Delete',
                                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: MyColors.white),
                                                      )),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }));
                          }
                        })),*/
              ],
            ),
          )),
    );
  }
}
