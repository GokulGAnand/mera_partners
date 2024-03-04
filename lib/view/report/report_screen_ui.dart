import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/view_model/report/report_screen_view_model.dart';
import 'package:evaluator_app/widgets/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/dimens.dart';
import '../../utils/strings.dart';
import '../../widgets/custom_button.dart';

/// ignore: must_be_immutable
class ReportScreen extends StatelessWidget {
  ReportScreen({super.key});

  ReportScreenViewModel viewModel = Get.find<ReportScreenViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        centerTitle: false,
        leading: IconButton(onPressed: () {
          Get.back();
        }, icon: const Icon(Icons.arrow_back_ios_new),),
        title: MyStrings.report,
      ),
      body: Obx(()=>
        SingleChildScrollView(
          child: viewModel.reportResponse.value.data == null?
          const Center(
            child: CircularProgressIndicator(),
          )
              :Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: Dimens.standard_44,
                decoration: const BoxDecoration(color: MyColors.blue),
                child: const Center(
                    child: Text(
                  MyStrings.meraCarsReport,
                  style: MyStyles.reportTitleStyle,
                )),
              ),
              SizedBox(
                height: Dimens.standard_5,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 223,
                    decoration: BoxDecoration(
                      image: viewModel.reportResponse.value.data != null && viewModel.reportResponse.value.data?.allCarInfo?.rightImage != null ?DecorationImage(
                        image: NetworkImage(viewModel.reportResponse.value.data!.allCarInfo!.rightImage!.url ?? viewModel.reportResponse.value.data!.allCarInfo!.leftImage!.url!),
                        fit: BoxFit.fill,
                      ):null,
                    ),
                  ),
                  CustomElevatedButton(
                  buttonHeight: 39,
                  buttonWidth: double.maxFinite,
                  buttonStyle: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.blueGray100,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                  ),
                  textStyle: MyStyles.regularTitle,
                  onPressed: () {  },
                    buttonText: MyStrings.viewAllImages,)
                ],
              ),
              SizedBox(
                height: Dimens.standard_25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start  ,
                      children: [
                        Text(
                          viewModel.reportResponse.value.data?.allCarInfo?.make ?? '',
                          style: MyStyles.reportTitle
                        ),
                        const SizedBox(
                          height: Dimens.standard_8,
                        ),
                        Text(
                          viewModel.reportResponse.value.data?.allCarInfo?.model ?? '',
                          style: MyStyles.greyMedium
                        ),
                        const SizedBox(
                          height: Dimens.standard_8,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: MyColors.blue,
                            ),
                            Text(
                              'CITY : ',
                              style: MyStyles.regular12
                            ),
                            Text(
                              viewModel.reportResponse.value.data?.allCarInfo?.vehicleLocation ?? '',
                              style: MyStyles.greyMedium
                            ),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          MyStrings.customerPrice,
                          style: MyStyles.greyMedium500
                        ),
                        const SizedBox(
                          height: Dimens.standard_8,
                        ),
                        Text(
                          viewModel.reportResponse.value.data!=null?'₹ ${viewModel.reportResponse.value.data!.customerPrice!}':'₹ ',
                          style: MyStyles.reportStyle,
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
                          return const ListTile(
                            title: Text(MyStrings.summary),
                            tileColor: MyColors.blue5001,
                            titleTextStyle: MyStyles.reportTitle,
                          );
                        },
                        backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                        isExpanded: viewModel.isExpanded.value,
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 300,
                                child: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  viewModel.ratingList[index].title,
                                                style: MyStyles.reportTextStyle,
                                              ),
                                              RatingBar.builder(
                                                initialRating: viewModel.ratingList[index].rating,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                itemCount: 5,
                                                ignoreGestures: true,
                                                itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                                                itemBuilder: (context, _) => const Icon(
                                                  Icons.star,
                                                  color: MyColors.blue,
                                                ),
                                                onRatingUpdate: (rating) {},
                                              ),

                                            ],
                                          ),
                                          const Divider()
                                        ],
                                      );
                                    },
                                  itemCount: viewModel.ratingList.length,
                                ),
                              )
                            ],
                          ),
                        )
                    ),
                    ExpansionPanel(
                        headerBuilder: (context, isExpanded){
                          return const ListTile(
                            title: Text(MyStrings.vehicleDetails),
                            tileColor: MyColors.blue5001,
                            titleTextStyle: MyStyles.reportTitle,
                          );
                        },
                        backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                        isExpanded: viewModel.isExpanded.value,
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 480,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              viewModel.vehicleDetails[index].title,
                                            style: MyStyles.reportTextStyle,
                                          ),
                                          Text(viewModel.vehicleDetails[index].value,style: MyStyles.black12w400)

                                        ],
                                      ),
                                    ),
                                    const Divider()
                                  ],
                                );
                              },
                              itemCount: viewModel.vehicleDetails.length,
                            ),
                          ),
                        )
                    ),
                    ExpansionPanel(
                        headerBuilder: (context, isExpanded){
                          return ListTile(
                            title: Text(MyStrings.features.toUpperCase()),
                            tileColor: MyColors.blue5001,
                            titleTextStyle: MyStyles.reportTitle,
                          );
                        },
                        backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                        isExpanded: viewModel.isExpanded.value,
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 650,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              viewModel.features[index].title,
                                            style: MyStyles.reportTextStyle,
                                          ),
                                          Text(viewModel.features[index].value,style: MyStyles.black12w400)

                                        ],
                                      ),
                                    ),
                                    const Divider()
                                  ],
                                );
                              },
                              itemCount: viewModel.features.length,
                            ),
                          ),
                        )
                    ),
                    ExpansionPanel(
                        headerBuilder: (context, isExpanded){
                          return ListTile(
                            title: Text(MyStrings.documents.toUpperCase()),
                            tileColor: MyColors.blue5001,
                            titleTextStyle: MyStyles.reportTitle,
                          );
                        },
                        backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                        isExpanded: viewModel.isExpanded.value,
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 150,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              viewModel.documents[index].title,
                                            style: MyStyles.reportTextStyle,
                                          ),
                                          Text(viewModel.documents[index].value,style: MyStyles.black12w400)

                                        ],
                                      ),
                                    ),
                                    const Divider()
                                  ],
                                );
                              },
                              itemCount: viewModel.documents.length,
                            ),
                          ),
                        )
                    ),
                    ExpansionPanel(
                        headerBuilder: (context, isExpanded){
                          return ListTile(
                            title: Text(MyStrings.exterior.toUpperCase()),
                            tileColor: MyColors.blue5001,
                            titleTextStyle: MyStyles.reportTitle,
                          );
                        },
                        backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                        isExpanded: viewModel.isExpanded.value,
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 2850,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              viewModel.exterior[index].title,
                                            style: MyStyles.reportTextStyle,
                                          ),
                                          Text(viewModel.exterior[index].value,style: MyStyles.black12w400)

                                        ],
                                      ),
                                      const Divider()
                                    ],
                                  ),
                                );
                              },
                              itemCount: viewModel.exterior.length,
                            ),
                          ),
                        )
                    ),
                    ExpansionPanel(
                        headerBuilder: (context, isExpanded){
                          return ListTile(
                            title: Text(MyStrings.air.toUpperCase()),
                            tileColor: MyColors.blue5001,
                            titleTextStyle: MyStyles.reportTitle,
                          );
                        },
                        backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                        isExpanded: viewModel.isExpanded.value,
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 400,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              viewModel.airCondition[index].title,
                                            style: MyStyles.reportTextStyle,
                                          ),
                                          Text(viewModel.airCondition[index].value,style: MyStyles.black12w400)

                                        ],
                                      ),
                                    ),
                                    const Divider()
                                  ],
                                );
                              },
                              itemCount: viewModel.airCondition.length,
                            ),
                          ),
                        )
                    ),
                    ExpansionPanel(
                        headerBuilder: (context, isExpanded){
                          return ListTile(
                            title: Text(MyStrings.interiorAndElectrical.toUpperCase()),
                            tileColor: MyColors.blue5001,
                            titleTextStyle: MyStyles.reportTitle,
                          );
                        },
                        backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                        isExpanded: viewModel.isExpanded.value,
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 650,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              viewModel.interiorAndElectrical[index].title,
                                            style: MyStyles.reportTextStyle,
                                          ),
                                          Text(viewModel.interiorAndElectrical[index].value,style: MyStyles.black12w400)

                                        ],
                                      ),
                                    ),
                                    const Divider()
                                  ],
                                );
                              },
                              itemCount: viewModel.interiorAndElectrical.length,
                            ),
                          ),
                        )
                    ),
                    ExpansionPanel(
                        headerBuilder: (context, isExpanded){
                          return ListTile(
                            title: Text(MyStrings.engine.toUpperCase()),
                            tileColor: MyColors.blue5001,
                            titleTextStyle: MyStyles.reportTitle,
                          );
                        },
                        backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                        isExpanded: viewModel.isExpanded.value,
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 850,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              viewModel.engine[index].title,
                                            style: MyStyles.reportTextStyle,
                                          ),
                                          Text(viewModel.engine[index].value,style: MyStyles.black12w400)

                                        ],
                                      ),
                                    ),
                                    const Divider()
                                  ],
                                );
                              },
                              itemCount: viewModel.engine.length,
                            ),
                          ),
                        )
                    ),
                    ExpansionPanel(
                        headerBuilder: (context, isExpanded){
                          return ListTile(
                            title: Text(MyStrings.test.toUpperCase()),
                            tileColor: MyColors.blue5001,
                            titleTextStyle: MyStyles.reportTitle,
                          );
                        },
                        backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                        isExpanded: viewModel.isExpanded.value,
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: 500,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                              viewModel.testDrive[index].title,
                                            style: MyStyles.reportTextStyle,
                                          ),
                                          Text(viewModel.testDrive[index].value,style: MyStyles.black12w400)

                                        ],
                                      ),
                                    ),
                                    const Divider()
                                  ],
                                );
                              },
                              itemCount: viewModel.testDrive.length,
                            ),
                          ),
                        )
                    ),
                    ExpansionPanel(
                        headerBuilder: (context, isExpanded){
                          return ListTile(
                            title: Text(MyStrings.imageGallery.toUpperCase()),
                            tileColor: MyColors.blue5001,
                            titleTextStyle: MyStyles.reportTitle,
                          );
                        },
                        backgroundColor:viewModel.isExpanded.value?MyColors.white: MyColors.blue5001,
                        isExpanded: viewModel.isExpanded.value,
                        body: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 260,
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 20, mainAxisSpacing: 20, childAspectRatio: 3.5 / 3.5),
                                  itemCount: viewModel.dashboard.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        if(index == 0){
                                        }else if(index == 1){
                                        }else if(index == 2){
                                        }else if(index == 3){
                                        }else if(index == 4){
                                        }else if(index == 5){
                                        }
                                      },
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.2,
                                            height: MediaQuery.of(context).size.width * 0.2,
                                            decoration: BoxDecoration(color: MyColors.lightBlue, borderRadius: BorderRadius.circular(8)),
                                            child: Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: Center(child: SvgPicture.asset(viewModel.dashboard[index].icon ?? "",)),
                                            ),
                                          ),
                                          Text(viewModel.dashboard[index].label ?? "", textAlign: TextAlign.center, style: MyStyles.cardTitleStyleBlue),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: viewModel.imageUrls.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 14.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: MyColors.kPrimaryColor),
                                      borderRadius: BorderRadius.circular(4)
                                    ),
                                      child: Column(
                                        children: [
                                          Image.network(viewModel.imageUrls[index],
                                              fit: BoxFit.fill,
                                              errorBuilder: (context, error, stackTrace) {
                                                return const Center(
                                                  child: Text('No Image'),
                                                );
                                              },
                                              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                                return child;
                                              },
                                              loadingBuilder: (context, child, loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                } else {
                                                  return const Center(
                                                    child: CircularProgressIndicator(),
                                                  );
                                                }}),
                                          Container(
                                            height: 39,
                                            width: double.maxFinite,
                                            decoration: BoxDecoration(
                                                color: MyColors.lightBlue,
                                                // border: Border.all(color: MyColors.kPrimaryColor),
                                                borderRadius: BorderRadius.circular(0)
                                            ),
                                            child: Center(
                                              child: Text(
                                                MyStrings.imageGallery,
                                                style: MyStyles.regularTitle,
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                );
                              },),
                              Row(
                                children: [
                                  Text('${MyStrings.reportId}: ${viewModel.reportResponse.value.data?.sId}',
                                    style: MyStyles.greyMedium,
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
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

