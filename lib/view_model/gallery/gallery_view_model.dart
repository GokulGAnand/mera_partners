import 'package:get/get.dart';

class GalleryScreenViewModel extends GetxController {
  //title, isClick, images[<Master>]
  List<Map<String, dynamic>> imagesList = Get.arguments;
  RxInt imageIndex = 0.obs;
  RxBool showLoading = true.obs;
}