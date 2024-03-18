import 'package:evaluator_app/routes/app_routes.dart';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/images.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/svg.dart';
import 'package:evaluator_app/view_model/gallery/gallery_view_model.dart';
import 'package:evaluator_app/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  GalleryScreenViewModel galleryScreenViewModel =
      Get.isRegistered<GalleryScreenViewModel>()
          ? Get.find<GalleryScreenViewModel>()
          : Get.put(GalleryScreenViewModel());
  
  List<Map<String, dynamic>> imagesList = [
    {"title": "Exterior", "isClick": true.obs, "images":["Front Main (Scratched,Dented)", "Front Left", "Front Right"]},
    {"title": "Engine", "isClick": false.obs, "images":["Front Main (Scratched,Dented)", "Front Main (Scratched,Dented)"]},
    {"title": "Interior", "isClick": false.obs, "images":["Front Main (Scratched,Dented)", "Front Main (Scratched,Dented)", "Front Main (Scratched,Dented)"]},
    {"title": "Damages", "isClick": false.obs, "images":["Front Main (Scratched,Dented)", "Front Main (Scratched,Dented)", "Front Main (Scratched,Dented)", "Front Main (Scratched,Dented)","Front Main (Scratched,Dented)"]},
  ];
  RxInt imageIndex = 0.obs;
  RxBool showLoading = true.obs;
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) {
      showLoading.value = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: imagesList[imageIndex.value]["title"]),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return Column(
              children: [
                Container(
                  height: 30,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imagesList.length,
                    itemBuilder: (context, index) {
                      return Obx(
                        () {
                          return GestureDetector(
                            onTap: (){
                              imageIndex.value = index;
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Row(
                                children: [
                                  Text(
                                    "${imagesList[index]["title"]}" + "${(index==0)?" (${imagesList[index]["images"].length})":""}",
                                    style: TextStyle(
                                    color: (imageIndex.value == index)?MyColors.kPrimaryColor:MyColors.black,
                                    fontSize: 14,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  
                                  (index==3)?Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: CircleAvatar(
                                      radius: 9,
                                      backgroundColor: MyColors.red4,
                                      child: Text(
                                    imagesList[index]["images"].length.toString(),
                                    style: MyStyles.white11700,
                                    ),
                                    ),
                                  )
                                  :const SizedBox()
                                ],
                              ),
                            ),
                          );
                        }
                      );
                    }
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: (showLoading.value)?4:imagesList[imageIndex.value]["images"].length,
                  itemBuilder: (context, index) {
                    return Obx((){
                      if(showLoading.value){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                                        width: double.infinity,
                                        height: 216,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(MyImages.imageLoading),
                                                fit: BoxFit.fill)),
                                      ),
                            SvgPicture.asset(MySvg.carLoading)
                          ],
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: (){
                        Get.toNamed(AppRoutes.imageViewScreen, arguments: imagesList[imageIndex.value]["title"]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Stack(
                          children: [
                            Container(
                                  width: double.infinity,
                                  height: 216,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                                          fit: BoxFit.fill)),
                                ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: MyColors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  imagesList[imageIndex.value]["images"][index].toString(),
                                  style: MyStyles.black12500,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                    });
                  }
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}