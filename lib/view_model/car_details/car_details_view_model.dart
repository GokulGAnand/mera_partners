import 'package:evaluator_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CarDetailsScreenViewModel extends GetxController {

  RxInt pageIndex = 0.obs;

  ///page 1
  
  List<String> imageList = [
    MyStrings.exterior,
    MyStrings.interior,
    MyStrings.engine,
    MyStrings.damage
  ];

  ScrollController page1ScrollController = ScrollController();

  void scrollListener() {
    if (page1ScrollController.offset >= page1ScrollController.position.maxScrollExtent &&
        !page1ScrollController.position.outOfRange) {
        pageIndex.value = 1;
        print("reach the bottom");
    }
  }

  ///page 2
  final documentKey = GlobalKey();
  final exteriorKey = GlobalKey();
  final interiorElectricalKey = GlobalKey();
  final engineKey = GlobalKey();
  final acKey = GlobalKey();
  final testDriveKey = GlobalKey();

  Future scrollItem(int index) async{
    BuildContext? context;
    if(index==0){
      context = documentKey.currentContext;
    } else if(index==1){
      context = exteriorKey.currentContext;
    } else if(index==2){
      context = interiorElectricalKey.currentContext;
    } else if(index==3){
      context = engineKey.currentContext;
    } else if(index==4){
      context = acKey.currentContext;
    } else if(index==5){
      context = testDriveKey.currentContext;
    }
    await Scrollable.ensureVisible(context!, duration: Duration(milliseconds: 800));
  }

  List<Map<String, dynamic>> rating = [
    {"title": MyStrings.documents, "rating": 0.0},
    {"title": MyStrings.exterior, "rating": 4.5},
    {"title": MyStrings.interiorAndElectrical, "rating": 3.0},
    {"title": MyStrings.engine, "rating": 1.5},
    {"title": MyStrings.ac, "rating": 3.2},
    {"title": MyStrings.testDrive, "rating": 2.4}
  ];

  late TabController exteriorTabController;
  late TabController interiorElectricalTabController;
  late TabController engineTabController;
  late TabController acTabController;
  late TabController testDriveTabController;

  RxBool exteriorShowMore = false.obs;
  RxBool interiorShowMore = false.obs;
  RxBool engineShowMore = false.obs;
  RxBool acShowMore = false.obs;
  RxBool testDriveShowMore = false.obs;

  RxBool playVideo = false.obs;

  late VideoPlayerController videoController;

  @override
  void onInit() {
    page1ScrollController.addListener(scrollListener);
    videoController = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {});
    super.onInit();
  }
}