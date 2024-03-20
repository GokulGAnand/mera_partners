import 'package:evaluator_app/view_model/gallery/gallery_view_model.dart';
import 'package:get/get.dart';

class GalleryBinding extends Bindings{

  @override
  void dependencies(){
    Get.lazyPut(() => GalleryScreenViewModel());
  }

}