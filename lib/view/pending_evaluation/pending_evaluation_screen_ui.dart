import 'package:evaluator_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../utils/colors.dart';
import '../../utils/images.dart';
import '../../utils/strings.dart';
import '../../view_model/pending_evaluation/pending_evaluation_screen_view_model.dart';
import '../../widgets/common_app_bar.dart';
import '../../widgets/common_drawer.dart';
import '../../widgets/custom_text_form_field.dart';

class PendingEvaluationScreen extends StatelessWidget {
  PendingEvaluationScreen({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  PendingEvaluationViewModel viewModel = Get.find();


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
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(MyImages.notification))
            ],
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
                  child: CustomTextFormField
                    (
                    topPadding: 0,
                    labelStyle: MyStyles.greyStyle,
                    controller: viewModel.pendingEvaluationController.value,
                    labelText: MyStrings.search,
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
                Expanded(
                  child:FutureBuilder(
                    future: viewModel.fetchCarBasicsData(),
                    builder:  (context,snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting){
                        return CircularProgressIndicator();
                        }else if (snapshot.hasError){
                        return Text('Error:${snapshot.error}');
                        }else{
                        return ListView.separated(
                            scrollDirection: Axis.vertical,
                            itemCount: 4,
                            separatorBuilder: (context, index) => const SizedBox(height:1),
                            itemBuilder: (context,index) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 36,right: 10,left: 10),
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
                                        offset: Offset(0,0),
                                      )
                                    ],
                                  ),
                                  child:  Padding(
                                    padding: const EdgeInsets.fromLTRB(18.0,20,18,15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            const Text('MARUTHI SUZUKI',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: MyColors.blue)),
                                            const SizedBox(height: 10),
                                            const Text('WAGON R 1.0(2010-2013)',style: TextStyle(fontSize: 11,fontWeight: FontWeight.w400)),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              height: 39,
                                              width: 139,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(6),
                                                  color: MyColors.white,
                                                  border: Border.all(
                                                      color: MyColors.blue
                                                  )
                                              ),
                                              child: const Center(child: Text('KL51 F 0980',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: MyColors.blue),)),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              height: 40,
                                              width: 139,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(6),
                                                  color: MyColors.blue,
                                                  border: Border.all(
                                                      color: MyColors.blue
                                                  )
                                              ),
                                              child: const Center(child: Text('Resume Report',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: MyColors.white),)),
                                            ),

                                          ],
                                        ),
                                        Column(
                                          children: [
                                            const SizedBox(
                                              height: 2.5,
                                            ),
                                            const Text('LEAD ID : 1234567890',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400)),
                                            const SizedBox(
                                                height: 10
                                            ),
                                            Row(
                                              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                  height: 18,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(9),
                                                      color: MyColors.lightBlue
                                                  ),
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(left: 5.0,right: 5),
                                                    child: Center(child: Text('LXI',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: MyColors.black))),
                                                  ),
                                                ),
                                                const SizedBox(width: 6),
                                                Container(
                                                  height: 18,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(9),
                                                      color: MyColors.lightBlue
                                                  ),
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(left: 5.0,right: 5),
                                                    child: Center(child: Text('2014',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: MyColors.black))),
                                                  ),
                                                ),
                                                const SizedBox(width: 6),
                                                Container(
                                                  height: 18,
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(9),
                                                      color: MyColors.lightBlue
                                                  ),
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(left: 5.0,right: 5),
                                                    child: Center(child: Text('Manual',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: MyColors.black))),
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
                                                  child: Text('KMS DRIVEN',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: MyColors.blue)),
                                                ),
                                                const SizedBox(width: 6),
                                                const Padding(
                                                  padding: EdgeInsets.only(top: 5),
                                                  child: Text('10000',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: MyColors.black)),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 1,
                                            ),
                                            Row(
                                              children: [
                                                Image.asset(MyImages.calendar2),
                                                const SizedBox(width: 5),
                                                const Text('INS.DATE',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: MyColors.blue)),
                                                const SizedBox(width: 5),
                                                const Text('01-02-22',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: MyColors.black))
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Container(
                                              height: 40,
                                              width: 139,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(6),
                                                  color: MyColors.blue,
                                                  border: Border.all(
                                                      color: MyColors.blue
                                                  )
                                              ),
                                              child: const Center(child: Text('Delete',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: MyColors.white),)),
                                            ),
                                          ],
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }
                        );
                      }
                    }
                  )

                ),
              ],
            ),
          )),
    );
  }
}
