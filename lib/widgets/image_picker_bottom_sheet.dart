import 'dart:developer';
import 'dart:io';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/dimens.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerSheet extends StatelessWidget {
  final Rx<File?> image;

  const ImagePickerSheet({super.key, required this.image});

  Future pickImage(ImageSource source) async {
    try {
      /*if(source == ImageSource.camera){
        var cameraStatus = await Permission.camera.status;
        if (!cameraStatus.isGranted) {
          final result = await Permission.camera.request();
          if(!result.isGranted){
            openAppSettings();
          }
          log("camera access: ${result.isGranted}");
        }
      }*/
      final image = await ImagePicker().pickImage(source: source);
      log(image.toString());
      if (image == null) return;
      final imageTemp = File(image.path);
      log(imageTemp.toString());
      this.image.value = imageTemp;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=> SizedBox(
        height: image.value == null ? MediaQuery.of(context).size.height*0.3 : MediaQuery.of(context).size.height*0.5,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(MyStrings.addDocument, style: MyStyles.blackBold20,),
              const SizedBox(
                height: 10,
              ),
              if(image.value != null)
                Stack(
                  children: [
                    image.value!.path.startsWith('http') || image.value!.path.startsWith('https')?Image.network(image.value?.path ?? '')
                        :Image.file(
                      image.value!,
                      width: 119,
                      height: 119,
                      fit: BoxFit.fill,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Positioned(
                        child: Container(
                          width: 20,
                          height: 25,
                          decoration: ShapeDecoration(
                            shape: const CircleBorder(),
                            color: MyColors.red,
                            shadows: [
                              BoxShadow(
                                color: Colors.grey
                                    .withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.only(right: 4),
                            onPressed: (){
                              image.value = null;
                            },icon:const Icon( Icons.remove_sharp),
                            color: MyColors.white,
                            iconSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              if(image.value != null)
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: Dimens.padding16,
                child: Row(
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              pickImage(ImageSource.camera);
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.add_a_photo_outlined)),
                        const Text(
                          MyStrings.camera,
                          style: TextStyle(
                            color: MyColors.grey,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 32,
                    ),
                    Column(
                      children: [
                        GestureDetector(
                            onTap: () {
                              pickImage(ImageSource.gallery);
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.add_box_outlined)),
                        const Text(
                          MyStrings.gallery,
                          style: TextStyle(
                            color: MyColors.grey,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
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
