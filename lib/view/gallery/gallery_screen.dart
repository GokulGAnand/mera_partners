import 'package:cached_network_image/cached_network_image.dart';
import 'package:mera_partners/routes/app_routes.dart';
import 'package:mera_partners/utils/colors.dart';
import 'package:mera_partners/utils/images.dart';
import 'package:mera_partners/utils/strings.dart';
import 'package:mera_partners/utils/styles.dart';
import 'package:mera_partners/utils/svg.dart';
import 'package:mera_partners/view_model/gallery/gallery_view_model.dart';
import 'package:mera_partners/widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  
  @override
  void initState() {
    for(int i=0; i<galleryScreenViewModel.imagesList.length; i++){
      if(galleryScreenViewModel.imagesList[i]["isClick"].value == true){
        // for (var element in galleryScreenViewModel.imagesList) {element["isClick"].value = false;}
        // galleryScreenViewModel.imagesList[i]["isClick"].value = true;
        galleryScreenViewModel.imageIndex.value = i;
      }
      for(int j=0; j<galleryScreenViewModel.imagesList[i]["images"].length; j++){
        if(galleryScreenViewModel.imagesList[i]["images"][j].listValue != null){
          for(int k=0; k<galleryScreenViewModel.imagesList[i]["images"][j].listValue.length; k++){
            if(galleryScreenViewModel.imagesList[i]["images"][j].listValue[k].isEmpty){
              galleryScreenViewModel.imagesList[i]["images"][j].listValue.removeAt(k);
            }
          }
        }
      }
    }
    // Future.delayed(const Duration(seconds: 3)).then((value) {
      galleryScreenViewModel.showLoading.value = false;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["title"]),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return Column(
              children: [
                Container(
                  height: 30,
                  margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: galleryScreenViewModel.imagesList.length,
                    itemBuilder: (context, index) {
                      return Obx(
                        () {
                          return GestureDetector(
                            onTap: (){
                              galleryScreenViewModel.imageIndex.value = index;
                              setState(() {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Row(
                                children: [
                                  Text(
                                    "${galleryScreenViewModel.imagesList[index]["title"]}",
                                    // "${galleryScreenViewModel.imagesList[index]["title"]}${(galleryScreenViewModel.imagesList[index]["title"] == MyStrings.exterior)?" (${galleryScreenViewModel.imagesList[index]["images"].length})":""}",
                                    style: TextStyle(
                                    color: (galleryScreenViewModel.imageIndex.value == index)?MyColors.kPrimaryColor:MyColors.black,
                                    fontSize: 14,
                                    fontFamily: 'DM Sans',
                                    fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  
                                  (galleryScreenViewModel.imagesList[index]["title"] == MyStrings.damage)?Padding(
                                    padding: const EdgeInsets.only(left: 4.0),
                                    child: CircleAvatar(
                                      radius: 9,
                                      backgroundColor: MyColors.red4,
                                      child: Text(
                                    galleryScreenViewModel.imagesList[index]["images"].length.toString(),
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
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: (galleryScreenViewModel.showLoading.value)?4:galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"].length,
                  itemBuilder: (context, index) {
                    return Obx((){
                      if(galleryScreenViewModel.showLoading.value){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                                        width: double.infinity,
                                        height: 216,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(MyImages.imageLoading),
                                                fit: BoxFit.fill)),
                                      ),
                            SvgPicture.asset(MySvg.carLoading)
                          ],
                        ),
                      );
                    }
                      if(galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"][index].image != null && galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"][index].image.isNotEmpty) {
                        return GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.imageViewScreen, arguments:
                            {"title": galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["title"],
                              "image_title" : galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"][index].title,
                              "image" : galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"][index].image,
                              "subtitle": galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"][index]?.listValue?.join(",") ?? ''
                            },
                            );
                            },

                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 4/3,
                              child: CachedNetworkImage(imageUrl: galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"][index].image.toString(),
                              fit: BoxFit.fill,
                                errorWidget: (context, url, error) {
                                  return SvgPicture.asset(MyImages.loadingCar);
                                },
                                placeholder: (context, url) {
                                  return SvgPicture.asset(MyImages.loadingCar);
                                },
                              ),
                              ),
                            // Container(
                            //       width: double.infinity,
                            //       height: 216,
                            //       decoration: BoxDecoration(
                            //           image: DecorationImage(
                            //               image: NetworkImage(
                            //                   galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["imageList"][index].value.toString()),
                            //               fit: BoxFit.fill)),
                            //     ),
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Container(
                                width: galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"][index]?.listValue.length >=2 ? MediaQuery.of(context).size.width - 15 : null,
                                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: MyColors.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: IntrinsicWidth(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"][index].title.toString(),
                                                style: MyStyles.black12500,
                                              ),
                                              if (galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"][index]?.listValue != null &&
                                                  galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"][index]?.listValue.isNotEmpty)
                                                TextSpan(
                                                  text: " (${galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"][index]?.listValue?.join(", ") ?? ''})",
                                                  style: MyStyles.black12500,
                                                ),
                                            ],
                                          ),
                                          softWrap: true,
                                          overflow: TextOverflow.clip,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // child: Row(
                                //   children: [
                                //     Text(
                                //       galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"][index].title.toString(),
                                //       style: MyStyles.black12500,
                                //     ),
                                //     if(galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"][index]?.listValue != null && (galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"][index]?.listValue.isNotEmpty))
                                //     Text(
                                //       "${" (" + (galleryScreenViewModel.imagesList[galleryScreenViewModel.imageIndex.value]["images"][index]?.listValue?.join(",") ?? '')})",
                                //       style: MyStyles.black12500,
                                //     ),
                                //   ],
                                // )
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                      }
                      return const SizedBox();
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