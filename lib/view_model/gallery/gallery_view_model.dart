import 'package:get/get.dart';

class GalleryScreenViewModel extends GetxController {
  // List<Map<String, dynamic>> imagesList = [
  //   {"title": MyStrings.exterior, "isClick": true.obs, "images":["Front Main (Scratched,Dented)", "Front Left", "Front Right"]},
  //   {"title": MyStrings.engine, "isClick": false.obs, "images":["Front Main (Scratched,Dented)", "Front Main (Scratched,Dented)"]},
  //   {"title": MyStrings.interior, "isClick": false.obs, "images":["Front Main (Scratched,Dented)", "Front Main (Scratched,Dented)", "Front Main (Scratched,Dented)"]},
  //   {"title": MyStrings.damage, "isClick": false.obs, "images":["Front Main (Scratched,Dented)", "Front Main (Scratched,Dented)", "Front Main (Scratched,Dented)", "Front Main (Scratched,Dented)","Front Main (Scratched,Dented)"]},
  // ];
  List<Map<String, dynamic>> imagesList = Get.arguments;
  RxInt imageIndex = 0.obs;
  RxBool showLoading = true.obs;
}