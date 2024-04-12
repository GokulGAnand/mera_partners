import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/view/home/orders/tabs/negotiation.dart';
import 'package:evaluator_app/view/home/orders/tabs/procured.dart';
import 'package:evaluator_app/view/home/orders/tabs/rc_transfer.dart';
import 'package:evaluator_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: SizedBox(
                  height: 50,
                  child: CustomTextFormField(
                      controller: TextEditingController(),
                      prefixIcon: const Icon(Icons.search),
                      borderColor: MyColors.kPrimaryColor.withOpacity(0.1),
                      focusedBorderColor: MyColors.kPrimaryColor,
                      contentPadding: const EdgeInsets.all(8),
                      enabledBorderColor:
                          MyColors.kPrimaryColor.withOpacity(0.1),
                      fillColor: MyColors.kPrimaryColor.withOpacity(0.1),
                      validator: null),
                )),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 50,
                  height: 44,
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: MyColors.kPrimaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: MyColors.kPrimaryColor.withOpacity(0.1))),
                  child: SvgPicture.asset(MySvg.notification),
                )
              ],
            ),
            TabBar(
              controller: tabController,
              labelStyle: MyStyles.selectedTabBarTitleStyle,
              labelColor: MyColors.black,
              unselectedLabelStyle: MyStyles.selectedTabBarTitleStyle,
              unselectedLabelColor: MyColors.grey.withOpacity(0.5),
              indicatorColor: MyColors.kPrimaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 4,
              dividerColor: MyColors.grey.withOpacity(0.25),
              dividerHeight: 2,
              tabs: const [
                Tab(text: MyStrings.negotiation),
                Tab(text: MyStrings.procured),
                Tab(text: MyStrings.rcTransfer),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children:  [
                  const Center(child: Negotiation()),
                  Center(child: Procured()),
                  Center(child: RcTransfer()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
