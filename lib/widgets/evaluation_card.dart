import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../utils/colors.dart';
import '../utils/images.dart';
import '../utils/strings.dart';

class EvaluationCard extends StatelessWidget {
  final String make;
  final String model;
  final String variant;
  final String regNumber;
  final String leadId;
  final String transmission;
  final String date;
  final String year;
  final String? kmDriven;
  final String? id;

  const EvaluationCard({super.key, required this.make, required this.variant, required this.regNumber, required this.leadId, required this.model, required this.transmission, required this.date, required this.year, this.kmDriven, this.id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 45, right: 10, left: 10),
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
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(make, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: MyColors.blue)),
                  const SizedBox(height: 10),
                  Text(model, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 39,
                    width: 139,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: MyColors.white, border: Border.all(color: MyColors.blue)),
                    child: Center(
                        child: Text(
                      regNumber,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: MyColors.blue),
                    )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  /*Container(
                    height: 40,
                    width: 139,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: MyColors.blue, border: Border.all(color: MyColors.blue)),
                    child: const Center(
                        child: Text(
                      MyStrings.resumeReport,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: MyColors.white),
                    )),
                  ),*/
                  CustomElevatedButton(
                    buttonHeight: 40,
                    buttonWidth: 139,
                      textStyle:  const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: MyColors.white),
                      onPressed: () {
                        Get.toNamed(AppRoutes.dashBoardScreen,arguments: id);
                      },
                      buttonText: MyStrings.resumeReport)
                ],
              ),
                const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 2.5,
                    ),
                    Text('LEAD ID : $leadId', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis)),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 18,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: MyColors.lightBlue),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0, right: 5),
                            child: Center(child: Text(variant, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: MyColors.black))),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          height: 18,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: MyColors.lightBlue),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0, right: 5),
                            child: Center(child: Text(year, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: MyColors.black))),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Container(
                          height: 18,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: MyColors.lightBlue),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 5.0, right: 5),
                            child: Center(child: Text(transmission, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: MyColors.black))),
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
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(kmDriven ?? '', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: MyColors.black)),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 1,
                    ),
                    Row(
                      children: [Image.asset(MyImages.calendar2), const SizedBox(width: 5), const Text('INS.DATE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: MyColors.blue)),
                        const SizedBox(width: 5), Text(date, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: MyColors.black))
                      ],
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
    );
  }
}
