import 'dart:developer';
import 'dart:io';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/dimens.dart';
import 'package:evaluator_app/utils/images.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_text_form_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickerCard extends StatelessWidget {
  final VoidCallback? onSubmit;
  final bool? isVideo;
  final Rx<File?> image;
  final TextEditingController remarksController;

  ImagePickerCard({super.key, this.onSubmit, this.isVideo = false, required this.remarksController, required this.image});

  Future pickImage(ImageSource source) async {
    try {
      if(source == ImageSource.camera){
        var cameraStatus = await Permission.camera.status;
        if (!cameraStatus.isGranted) {
          final result = await Permission.camera.request();
          if(!result.isGranted){
            openAppSettings();
          }
          print("camera access: " + result.isGranted.toString());
        } 
      }
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

  Future pickVideo(ImageSource source) async {
    try {
      final video = await ImagePicker().pickVideo(source: source,maxDuration: const Duration(seconds: 20));
      log(video.toString());
      if (video == null) return;
      final videoTemp = File(video.path);
      log(videoTemp.toString());
      image.value = videoTemp;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: SingleChildScrollView(child: dialogContent(context)),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Obx(
      () => Container(
        width: 340,
        height: MediaQuery.of(context).size.height * 0.69,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          shadows: const [
            BoxShadow(
              color: Color(0x30000000),
              blurRadius: 6,
              offset: Offset(0, 7),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x00000000),
              blurRadius: 59,
              offset: Offset(0, 212),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 14.0,
                backgroundColor: MyColors.red,
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  color: MyColors.white,
                  onPressed: () {
                    // image?.value = null;
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              ),
            ),
            Padding(
              padding: Dimens.padding16,
              child: Text(isVideo == true?MyStrings.uploadVideo:MyStrings.uploadImage, style: MyStyles.uploadImageTitleStyle),
            ),
            const Divider(
              color: MyColors.transparent1,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return uploadTypeCard(context);
                    },
                  );
                },
                child: image.value == null
                    ? Container(
                        width: 119,
                        height: 119,
                        decoration: ShapeDecoration(
                          color: MyColors.transparent,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 47.0, right: 47, bottom: 27, top: 35),
                              child: SizedBox(height: 25, width: 25, child: SvgPicture.asset(MyImages.add)),
                            ),
                            Text(
                              isVideo == true?MyStrings.uploadVideo:MyStrings.addImage,
                              style: const TextStyle(
                                color: Color(0xFF736B6B),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                height: 0.19,
                              ),
                            ),
                            const SizedBox(
                              height: 23,
                            )
                          ],
                        ),
                      )
                    : (isVideo == false && image.value != null && (image.value!.path.startsWith('http') || image.value!.path.startsWith('https')))?
                Stack(
                  children: [
                    /*Image.network(
                      image.value!.path,
                      width: 119,
                      height: 119,
                      fit: BoxFit.fill,
                    ),*/
                    Image.network(
                        image.value!.path,
                        width: 119,
                        height: 119,
                        fit: BoxFit.fill,
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
                    Positioned(
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
                              offset: const Offset(0, 3), // changes position of shadow
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
                  ],
                ):isVideo == false?
                Stack(
                  children: [
                    Image.file(
                      image.value!,
                            width: 119,
                            height: 119,
                            fit: BoxFit.fill,
                          ),
                    Positioned(
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
                              offset: const Offset(0, 3), // changes position of shadow
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
                  ],
                ):Text(image.value?.path ?? ''),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: CustomTextFormField(
                labelText: MyStrings.remarks,
                helperText: MyStrings.remarks,
                minLines: 2,
                maxLines: 2,
                controller: remarksController,
                validator: (p0) => null,
              ),
            ),
            const SizedBox(
              height: 67,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16),
              child: CustomElevatedButton(onPressed: () {
                // image?.value = image?.value;
                print(image.value.toString());
                Navigator.of(context).pop();
              }, buttonText: MyStrings.submit),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget uploadTypeCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width * 0.11,
        right: MediaQuery.of(context).size.width * 0.11,
        bottom: MediaQuery.of(context).size.height * 0.3,
        top: MediaQuery.of(context).size.height * 0.3,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: CircleAvatar(
              radius: 14.0,
              backgroundColor: MyColors.red,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                color: MyColors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                ),
              ),
            ),
          ),
          const Row(
            children: [
              Padding(
                padding: Dimens.padding16,
                child: Text(
                  MyStrings.chooseUploadType,
                  style: TextStyle(
                    color: MyColors.kPrimaryColor,
                    fontSize: 23,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: MyColors.transparent1,
          ),
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
                          if(isVideo != null && isVideo == true){
                            pickVideo(ImageSource.camera);
                          }else{
                            pickImage(ImageSource.camera);
                          }
                          Navigator.of(context).pop();
                        },
                        child: SizedBox(width: 90, height: 95, child: SvgPicture.asset(MyImages.camera))),
                    const Text(
                      MyStrings.camera,
                      style: TextStyle(
                        color: MyColors.greyMedium,
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
                          if(isVideo != null && isVideo == true){
                            pickVideo(ImageSource.gallery);
                          }else{
                            pickImage(ImageSource.gallery);
                          }
                          Navigator.of(context).pop();
                        },
                        child: SizedBox(width: 90, height: 90, child: Image.asset(MyImages.gallery))),
                    const Text(
                      MyStrings.gallery,
                      style: TextStyle(
                        color: MyColors.greyMedium,
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
    );
  }
}
