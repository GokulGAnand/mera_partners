import 'package:mera_partners/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/dimens.dart';
import '../../utils/colors.dart';
import '../../utils/strings.dart';
import '../../utils/styles.dart';
import '../../view_model/home/orders/procured_bill_view_model.dart';
import '../../widgets/bank_details_bottom_sheet.dart';
import '../../widgets/custom_button.dart';

class ProcuredBillScreen extends StatelessWidget {
  ProcuredBillScreen({super.key});

  final ProcuredScreenViewModel viewModel = Get.isRegistered<ProcuredScreenViewModel>()
      ? Get.find<ProcuredScreenViewModel>()
      : Get.put(ProcuredScreenViewModel());

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? arguments = Get.arguments as Map<String, dynamic>?;
    final String? finalPrice = arguments?['finalPrice'];
    final String? carModel = arguments?['carModel'];
    final String? carName = arguments?['carName'];
    final String? gstAmount = arguments?['gst'];
    final String? serviceFees = arguments?['serviceFees'];
    final String? totalAmount = arguments?['totalAmount'];
    final String? totalPayment = finalPrice; // Assigning finalPrice to totalPayment as per your existing code
    final String additionalCharges = serviceFees ?? ''; // Example value for additional charges
    final String gst = gstAmount ?? ''; // Example value for GST

    // Calculate total amount
    // final num totalAmount = (int.tryParse(totalPayment ?? '0') ?? 0) +
    //     (int.tryParse(additionalCharges) ?? 0) +
    //     (int.tryParse(gst) ?? 0);


    return Scaffold(
      backgroundColor: MyColors.lightBlue1,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only( top: 20,bottom: 20),
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
                  title: Text(carName ?? '', style: MyStyles.selectedTabBarTitleStyle),
                  subtitle:  Text(carModel?? '', style: MyStyles.black16700),
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
                            const Text(MyStrings.totalPayment, style: MyStyles.black16400),
                            SizedBox(height: Dimens.standard_10),
                            const Text(MyStrings.additionalCharges, style: MyStyles.black16400),
                            SizedBox(height: Dimens.standard_10),
                            const Text(MyStrings.gst, style: MyStyles.black16400),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(Constants.numberFormat.format(int.tryParse(totalAmount ?? '0') ?? 0), style: MyStyles.black16400),
                            SizedBox(height: Dimens.standard_10),
                            Text(Constants.numberFormat.format(int.tryParse(additionalCharges) ?? 0), style: MyStyles.black16400),
                            SizedBox(height: Dimens.standard_10),
                             Text(Constants.numberFormat.format(int.tryParse(gst) ?? 0), style: MyStyles.black16400),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(MyStrings.totalAmount, style: MyStyles.black16700),
                        Text(Constants.numberFormat.format(int.tryParse(totalAmount ?? '0') ?? 0), style: MyStyles.blue16W700),
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
            SizedBox(height: Dimens.standard_16),
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
                  onTap: () async {
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
                    child: const Padding(
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
