import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BidsScreen extends StatefulWidget {
  const BidsScreen({super.key});

  @override
  State<BidsScreen> createState() => _BidsScreenState();
}

class _BidsScreenState extends State<BidsScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
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
                      prefixIcon: Icon(Icons.search),
                      borderColor: MyColors.blue.withOpacity(0.1),
                      focusedBorderColor: MyColors.blue.withOpacity(0.1),
                      fillColor: const Color.fromARGB(255, 149, 185, 221).withOpacity(0.1),
                      validator: null),
                  )),
                const SizedBox(width: 15,),
                Container(
                  width: 50,
                  height: 45,
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: MyColors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: MyColors.blue)
                  ),
                  child: SvgPicture.asset("assets/svg/notification.svg"),
                )
              ],
            ),
            TabBar(
                    controller: tabController,
                    labelStyle: MyStyles.selectedTabBarTitleStyle,
                    labelColor: MyColors.black,
                    unselectedLabelStyle: MyStyles.selectedTabBarTitleStyle,
                    unselectedLabelColor: MyColors.grey.withOpacity(0.5),
                    indicatorColor: MyColors.blue,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 4,
                    dividerColor: MyColors.grey.withOpacity(0.25),
                    dividerHeight: 2,
                    tabs: const [
                      Tab(text: 'LIVE(4)'),
                      Tab(text: 'OTB(4)'),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: const [
                        Center(child: Text("LIVE(4)")),
                        Center(child: Text("OTB(4)")),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}