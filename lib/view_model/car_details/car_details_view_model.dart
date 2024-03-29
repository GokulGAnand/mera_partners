import 'package:evaluator_app/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class CarDetailsScreenViewModel extends GetxController {

  RxInt pageIndex = 0.obs;

  ///page 1
  String carStatus = "";
  //""
  //bid won
  //bid closed
  //car sold 

  List<String> imageList = [
    MyStrings.exterior,
    MyStrings.interior,
    MyStrings.engine,
    MyStrings.damage
  ];

  late ScrollController scrollController;
  RxBool showSliverAppBarTitle = false.obs;

  void scrollListener() {
    scrollController = ScrollController()
    ..addListener(() {
        showSliverAppBarTitle.value = isSliverAppBarExpanded? true: false ;
    });
  }

  bool get isSliverAppBarExpanded {
    return scrollController.hasClients &&
        scrollController.offset > (600 - kToolbarHeight);
  }

  ///page 2
  final GlobalKey<State<StatefulWidget>> documentKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> exteriorKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> interiorElectricalKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> engineKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> acKey = GlobalKey();
  final GlobalKey<State<StatefulWidget>> testDriveKey = GlobalKey();

  RxInt inspectionIndex = 0.obs;
  Future scrollItem() async{
    BuildContext? context;
    if(inspectionIndex.value==0){
      context = documentKey.currentContext;
    } else if(inspectionIndex.value==1){
      context = exteriorKey.currentContext;
    } else if(inspectionIndex.value==2){
      context = interiorElectricalKey.currentContext;
    } else if(inspectionIndex.value==3){
      context = engineKey.currentContext;
    } else if(inspectionIndex.value==4){
      context = acKey.currentContext;
    } else if(inspectionIndex.value==5){
      context = testDriveKey.currentContext;
    }
    await Scrollable.ensureVisible(context!, duration: const Duration(milliseconds: 800));
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
    scrollListener();
    videoController = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {});
    super.onInit();
  }
}