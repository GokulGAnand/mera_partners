import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/dimens.dart';
import '../../view_model/procured_bill/procured_bill_view_model.dart';
import '../../widgets/bank_details_bottom_sheet.dart';
import '../../widgets/custom_button.dart';

class ProcuredBillScreen extends StatelessWidget {
    ProcuredBillScreen({super.key});
   ProcuredBillScreenViewModel viewModel = Get.isRegistered<ProcuredBillScreenViewModel>()? Get.find<ProcuredBillScreenViewModel>()  : Get.put(ProcuredBillScreenViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.lightBlue1,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Container(
              color: MyColors.white,
              child: ListTile(
                tileColor: null, // Set tileColor to null
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(Icons.arrow_back, color: MyColors.black, size: 24),
                ),
                title: const Text('2016 Duster', style: MyStyles.selectedTabBarTitleStyle),
                subtitle: const Text('110 PS RXZ 4X2 AMT', style: MyStyles.black16700),
              ),
            ),
          ),
          Divider(
            color: MyColors.lightBlue1,
            height: Dimens.standard_1,
          ),
          Container(
            color: MyColors.white,
            height: MediaQuery.of(context).size.height * 0.26,
            child: Padding(
              padding: const EdgeInsets.only(right: 50, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Dimens.standard_20),
                  const Text(MyStrings.billSummary, style: MyStyles.pageTitleStyle),
                  SizedBox(height: Dimens.standard_10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            MyStrings.totalPayment,
                            style: MyStyles.black16400,
                          ),
                          SizedBox(height: Dimens.standard_10),
                          const Text(MyStrings.additionalCharges, style: MyStyles.black16400),
                          SizedBox(height: Dimens.standard_10),
                          const Text(MyStrings.gst, style: MyStyles.black16400),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('₹1,93,000', style: MyStyles.black16400),
                          SizedBox(height: Dimens.standard_10),
                          const Text('₹5000', style: MyStyles.black16400),
                          SizedBox(height: Dimens.standard_10),
                          const Text('₹50', style: MyStyles.black16400),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: Dimens.standard_15),
                  Row(
                    children: List.generate(
                      100 ~/ 1,
                          (index) => Expanded(
                        child: Container(
                          color: index % 2 == 0 ? Colors.transparent : Colors.grey,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Dimens.standard_10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(MyStrings.totalAmount, style: MyStyles.black16700),
                      Text('₹1,98,500', style: MyStyles.blue16W700),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: Dimens.standard_10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: Dimens.standard_20),
              const Padding(
                padding: EdgeInsets.only(top: 2.5, right: 6),
                child: Icon(Icons.info_outline, color: MyColors.black, size: 16),
              ),
              const Text(MyStrings.transfer, style: MyStyles.subTitleBlackStyle),
            ],
          ),
          SizedBox(height: Dimens.standard_10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: Dimens.standard_20),
              const Text(
                MyStrings.needHelp,
                style: MyStyles.pageTitleStyle,
              ),
            ],
          ),
          SizedBox(height: Dimens.standard_10),
          Row(
            children: [
              SizedBox(width: Dimens.standard_20),
              InkWell(
                onTap: ()async {
                  await viewModel.launchCaller();
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: MyColors.kPrimaryColor, width: 2),
                    color: MyColors.lightBlue,
                  ),
                  child:  const Padding(
                    padding: EdgeInsets.only(left: 6),
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              MyStrings.customerSupport,
                              style: MyStyles.kPrimary16500,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.call,
                              color: MyColors.kPrimaryColor,
                              size: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: Center(
          child: CustomElevatedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: Get.context!,
                builder: (BuildContext context) {
                  return const CustomBottomSheet();
                },
              );
            },
            buttonHeight: MediaQuery.of(context).size.height * 0.06,
            buttonWidth: MediaQuery.of(context).size.width * 0.9,
            buttonText: MyStrings.viewButton,
            textStyle: MyStyles.white14700,
          ),
        ),
      ),
    );
  }
}
