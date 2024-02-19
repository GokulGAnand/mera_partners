import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/view_model/report/report_screen_view_model.dart';
import 'package:evaluator_app/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import '../../utils/dimens.dart';
import '../../utils/strings.dart';

class ReportScreen extends StatelessWidget {
  ReportScreen({super.key});

  ReportScreenViewModel viewModel = Get.find<ReportScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        centerTitle: false,
        leading: Icon(Icons.arrow_back_ios_new),
        title: MyStrings.report,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: Dimens.standard_44,
              decoration: const BoxDecoration(color: MyColors.blue),
              child: const Center(
                  child: Text(
                MyStrings.keraCarsReport,
                style: MyStyles.reportTitleStyle,
              )),
            ),
            SizedBox(
              height: Dimens.standard_5,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 223,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Hyundai-Grand-i10-Nios-200120231541.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: Dimens.standard_25,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'MARUTHI SUZUKI',
                        style: TextStyle(
                          color: Color(0xFF1D1B20),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: Dimens.standard_8,
                      ),
                      Text(
                        'WAGON R 1.0(2010-2013)',
                        style: TextStyle(
                          color: Color(0xFF5B5B5B),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: Dimens.standard_8,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: MyColors.blue,
                          ),
                          Text(
                            'CITY :',
                            style: TextStyle(
                              color: Color(0xFF153853),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              height: 0,
                            ),
                          ),
                          Text(
                            'Kozhikode',
                            style: TextStyle(
                              color: Color(0xFF5B5B5B),
                              fontSize: 12,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Customer Price',
                        style: TextStyle(
                          color: Color(0xFF5B5B5B),
                          fontSize: 12,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      SizedBox(
                        height: Dimens.standard_8,
                      ),
                      Text(
                        '₹ 3,25000',
                        style: TextStyle(
                          color: Color(0xFF153853),
                          fontSize: 23,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Obx(() => ExpansionPanelList(
                expansionCallback: (panelIndex, isExpanded) {
                  viewModel.isExpanded.value = isExpanded;
                },
                children: [
                  ExpansionPanel(
                      headerBuilder: (context, isExpanded){
                        print(isExpanded);
                        // viewModel.isExpanded.value = isExpanded;
                        return const ListTile(
                          title: Text(MyStrings.summary),
                          tileColor: MyColors.blue5001,
                        );
                      },
                      backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                      isExpanded: viewModel.isExpanded.value,
                      body: Column(
                        children: [
                          SizedBox(
                            height: 400,
                            child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                viewModel.ratingList[index].title
                                            ),
                                            RatingBar.builder(
                                              initialRating: viewModel.ratingList[index].rating,
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              ignoreGestures: true,
                                              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                              itemBuilder: (context, _) => const Icon(
                                                Icons.star,
                                                color: MyColors.blue,
                                              ),
                                              onRatingUpdate: (rating) {
                                              },
                                            ),

                                          ],
                                        ),
                                        const Divider()
                                      ],
                                    ),
                                  );
                                    ListTile(
                                    leading: Text(
                                      viewModel.ratingList[index].title
                                    ),
                                    title: RatingBar.builder(
                                      initialRating: viewModel.ratingList[index].rating,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      ignoreGestures: true,
                                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: MyColors.blue,
                                      ),
                                      onRatingUpdate: (rating) {
                                      },
                                    ),
                                  );
                                },
                              itemCount: viewModel.ratingList.length,
                            ),
                          )
                        ],
                      )
                  ),
                  ExpansionPanel(
                      headerBuilder: (context, isExpanded){
                        print(isExpanded);
                        // viewModel.isExpanded.value = isExpanded;
                        return const ListTile(
                          title: Text(MyStrings.vehicleDetails),
                          tileColor: MyColors.blue5001,
                        );
                      },
                      backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                      isExpanded: viewModel.isExpanded.value,
                      body: SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          viewModel.vehicleDetails[index].title
                                      ),
                                      Text(viewModel.vehicleDetails[index].value)

                                    ],
                                  ),
                                  const Divider()
                                ],
                              ),
                            );
                          },
                          itemCount: viewModel.vehicleDetails.length,
                        ),
                      )
                  ),
                  ExpansionPanel(
                      headerBuilder: (context, isExpanded){
                        print(isExpanded);
                        // viewModel.isExpanded.value = isExpanded;
                        return ListTile(
                          title: Text(MyStrings.features.toUpperCase()),
                          tileColor: MyColors.blue5001,
                        );
                      },
                      backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                      isExpanded: viewModel.isExpanded.value,
                      body: SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          viewModel.features[index].title
                                      ),
                                      Text(viewModel.features[index].value)

                                    ],
                                  ),
                                  const Divider()
                                ],
                              ),
                            );
                          },
                          itemCount: viewModel.features.length,
                        ),
                      )
                  ),
                  ExpansionPanel(
                      headerBuilder: (context, isExpanded){
                        print(isExpanded);
                        // viewModel.isExpanded.value = isExpanded;
                        return ListTile(
                          title: Text(MyStrings.documents.toUpperCase()),
                          tileColor: MyColors.blue5001,
                        );
                      },
                      backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                      isExpanded: viewModel.isExpanded.value,
                      body: SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          viewModel.documents[index].title
                                      ),
                                      Text(viewModel.documents[index].value)

                                    ],
                                  ),
                                  const Divider()
                                ],
                              ),
                            );
                          },
                          itemCount: viewModel.documents.length,
                        ),
                      )
                  ),
                  ExpansionPanel(
                      headerBuilder: (context, isExpanded){
                        print(isExpanded);
                        // viewModel.isExpanded.value = isExpanded;
                        return ListTile(
                          title: Text(MyStrings.exterior.toUpperCase()),
                          tileColor: MyColors.blue5001,
                        );
                      },
                      backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                      isExpanded: viewModel.isExpanded.value,
                      body: SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          viewModel.vehicleDetails[index].title
                                      ),
                                      Text(viewModel.vehicleDetails[index].value)

                                    ],
                                  ),
                                  const Divider()
                                ],
                              ),
                            );
                          },
                          itemCount: viewModel.vehicleDetails.length,
                        ),
                      )
                  ),
                  ExpansionPanel(
                      headerBuilder: (context, isExpanded){
                        print(isExpanded);
                        // viewModel.isExpanded.value = isExpanded;
                        return ListTile(
                          title: Text(MyStrings.air.toUpperCase()),
                          tileColor: MyColors.blue5001,
                        );
                      },
                      backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                      isExpanded: viewModel.isExpanded.value,
                      body: SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          viewModel.airCondition[index].title
                                      ),
                                      Text(viewModel.airCondition[index].value)

                                    ],
                                  ),
                                  const Divider()
                                ],
                              ),
                            );
                          },
                          itemCount: viewModel.airCondition.length,
                        ),
                      )
                  ),
                  ExpansionPanel(
                      headerBuilder: (context, isExpanded){
                        print(isExpanded);
                        // viewModel.isExpanded.value = isExpanded;
                        return ListTile(
                          title: Text(MyStrings.interiorAndElectrical.toUpperCase()),
                          tileColor: MyColors.blue5001,
                        );
                      },
                      backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                      isExpanded: viewModel.isExpanded.value,
                      body: SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          viewModel.interiorAndElectrical[index].title
                                      ),
                                      Text(viewModel.interiorAndElectrical[index].value)

                                    ],
                                  ),
                                  const Divider()
                                ],
                              ),
                            );
                          },
                          itemCount: viewModel.interiorAndElectrical.length,
                        ),
                      )
                  ),
                  ExpansionPanel(
                      headerBuilder: (context, isExpanded){
                        print(isExpanded);
                        // viewModel.isExpanded.value = isExpanded;
                        return ListTile(
                          title: Text(MyStrings.engine.toUpperCase()),
                          tileColor: MyColors.blue5001,
                        );
                      },
                      backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                      isExpanded: viewModel.isExpanded.value,
                      body: SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          viewModel.engine[index].title
                                      ),
                                      Text(viewModel.engine[index].value)

                                    ],
                                  ),
                                  const Divider()
                                ],
                              ),
                            );
                          },
                          itemCount: viewModel.engine.length,
                        ),
                      )
                  ),
                  ExpansionPanel(
                      headerBuilder: (context, isExpanded){
                        print(isExpanded);
                        // viewModel.isExpanded.value = isExpanded;
                        return ListTile(
                          title: Text(MyStrings.test.toUpperCase()),
                          tileColor: MyColors.blue5001,
                        );
                      },
                      backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                      isExpanded: viewModel.isExpanded.value,
                      body: SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          viewModel.testDrive[index].title
                                      ),
                                      Text(viewModel.testDrive[index].value)

                                    ],
                                  ),
                                  const Divider()
                                ],
                              ),
                            );
                          },
                          itemCount: viewModel.testDrive.length,
                        ),
                      )
                  ),
                  ExpansionPanel(
                      headerBuilder: (context, isExpanded){
                        print(isExpanded);
                        // viewModel.isExpanded.value = isExpanded;
                        return ListTile(
                          title: Text(MyStrings.imageGallery.toUpperCase()),
                          tileColor: MyColors.blue5001,
                        );
                      },
                      backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                      isExpanded: viewModel.isExpanded.value,
                      body: SizedBox(
                        height: 400,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          viewModel.vehicleDetails[index].title
                                      ),
                                      Text(viewModel.vehicleDetails[index].value)

                                    ],
                                  ),
                                  const Divider()
                                ],
                              ),
                            );
                          },
                          itemCount: viewModel.vehicleDetails.length,
                        ),
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

