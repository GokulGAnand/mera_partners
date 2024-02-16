import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

class EvaluationCard extends StatelessWidget {
  const EvaluationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          padding: const EdgeInsets.fromLTRB(18.0, 20, 18, 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text('MARUTHI SUZUKI', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: MyColors.blue)),
                  const SizedBox(height: 10),
                  const Text('WAGON R 1.0(2010-2013)', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 39,
                    width: 139,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: MyColors.white, border: Border.all(color: MyColors.blue)),
                    child: const Center(
                        child: Text(
                          'KL51 F 0980',
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
                  const Text('LEAD ID : 1234567890', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 18,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: MyColors.lightBlue),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 5),
                          child: Center(child: Text('LXI', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: MyColors.black))),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        height: 18,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: MyColors.lightBlue),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 5),
                          child: Center(child: Text('2014', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: MyColors.black))),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Container(
                        height: 18,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(9), color: MyColors.lightBlue),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 5.0, right: 5),
                          child: Center(child: Text('Manual', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: MyColors.black))),
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
                      const Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Text('10000', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: MyColors.black)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Row(
                    children: [Image.asset(MyImages.calendar2), const SizedBox(width: 5), const Text('INS.DATE', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: MyColors.blue)), const SizedBox(width: 5), const Text('01-02-22', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: MyColors.black))],
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
  }
}
