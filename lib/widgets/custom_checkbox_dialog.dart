import 'dart:developer';
import 'dart:io';
import 'package:evaluator_app/utils/colors.dart';
import 'package:evaluator_app/utils/dimens.dart';
import 'package:evaluator_app/utils/images.dart';
import 'package:evaluator_app/utils/strings.dart';
import 'package:evaluator_app/utils/styles.dart';
import 'package:evaluator_app/utils/validate_input.dart';
import 'package:evaluator_app/widgets/custom_button.dart';
import 'package:evaluator_app/widgets/custom_text_form_field.dart';
import 'package:evaluator_app/widgets/custom_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class CustomCheckBoxDialog extends StatelessWidget {
  CustomCheckBoxDialog({
    required this.title,
    required this.items,
    this.image,
    required this.selectItem,
    this.remarksController,
    required this.othersController,
    super.key});
  final String title; 
  final List<String> items; 
  final Rx<File?>? image;
  final RxList<String> selectItem;
  final TextEditingController? remarksController;
  final TextEditingController othersController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future pickImage(ImageSource source) async {
    try {
      if(source == ImageSource.camera){
        var cameraStatus = await Permission.camera.status;
        if (!cameraStatus.isGranted) {
          final result = await Permission.camera.request();
          if(!result.isGranted){
            openAppSettings();
          }
          log("camera access: ${result.isGranted}");
        } 
      }
      final image = await ImagePicker().pickImage(source: source);
      log(image.toString());
      if (image == null) return;
      final imageTemp = File(image.path);
      log(imageTemp.toString());
      this.image!.value = imageTemp;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print('Failed to pick image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    for(int i=0; i<selectItem.length; i++){
      if(selectItem[i].isEmpty){
        selectItem.removeAt(i);
      }
    }
    return Stack(
      children: [
        AlertDialog(
          backgroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.white,
          contentPadding: EdgeInsets.zero,
          insetPadding: const EdgeInsets.all(20.0),
          title: Text(title,
          style: MyStyles.uploadImageTitleStyle,),
          titlePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          shape: const OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide.none
          ),
          content: Form(
            key: formKey,
            child: SizedBox(
              // width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.height * 0.7,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListBody(
                      children: items
                          .map((item) => Obx(
                            () {
                              return Column(
                                children: [
                                  const Divider(height: 5,),
                                  CheckboxListTile(
                                        value: selectItem.contains(item.toLowerCase()),
                                        title: Text(item,
                                        style: MyStyles.blackW500F15Style,),
                                        onChanged: (isSelected){
                                           if (isSelected!) {
                                            selectItem.add(item.toLowerCase());
                                          } else {
                                            selectItem.remove(item.toLowerCase());
                                          }
                                        },
                                      ),
                                ],
                              );
                            }
                          ))
                          .toList(),
                    ),
                    Obx(
                      ()=>
                         (selectItem.contains("other") )?Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16),
                        child: CustomTextFormField(
                          labelText: MyStrings.other,
                          helperText: MyStrings.other,
                          minLines: 1,
                          maxLines: 1,
                          controller: othersController,
                          validator: ValidateInput.validateRequiredFields,
                        ), )
                    :const SizedBox()),
                    dialogContent(context)
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 8.0,
          top: 42,
          child: Align(
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
        ),
      ],
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
        width: 340,
        // height: MediaQuery.of(context).size.height * 0.69,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          // shadows: const [
          //   BoxShadow(
          //     color: Color(0x30000000),
          //     blurRadius: 6,
          //     offset: Offset(0, 7),
          //     spreadRadius: 0,
          //   ),
          //   BoxShadow(
          //     color: Color(0x00000000),
          //     blurRadius: 59,
          //     offset: Offset(0, 212),
          //     spreadRadius: 0,
          //   )
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              color: MyColors.transparent1,
            ),
            const SizedBox(
              height: 20,
            ),
            (image==null)?const SizedBox() 
            :Obx(
              ()=>Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      child: image!.value == null
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
                                  const Text(
                                    MyStrings.addImage,
                                    style: TextStyle(
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
                          : (image!.value != null && (image!.value!.path.startsWith('http') || image!.value!.path.startsWith('https')))?
                      Stack(
                        children: [
                          /*Image.network(
                            image.value!.path,
                            width: 119,
                            height: 119,
                            fit: BoxFit.fill,
                          ),*/
                          Image.network(
                              image!.value!.path,
                              width: 119,
                              height: 119,
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return const Center(
                                  child: CircularProgressIndicator(),
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
                                  image!.value = null;
                                },icon:const Icon( Icons.remove_sharp),
                                color: MyColors.white,
                                iconSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ):
                      Stack(
                        children: [
                          Image.file(
                            image!.value!,
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
                                  image!.value = null;
                                },icon:const Icon( Icons.remove_sharp),
                                color: MyColors.white,
                                iconSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                height: 30,
              ),
              (remarksController == null)?
              const SizedBox()
              :Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: CustomTextFormField(
                  labelText: MyStrings.remarks,
                  helperText: MyStrings.remarks,
                  minLines: 2,
                  maxLines: 2,
                  controller: remarksController!,
                  validator: (p0) => null,
                ),
              ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: CustomElevatedButton(onPressed: () {
                if (formKey.currentState!.validate()) {
                  if((selectItem.isNotEmpty && !selectItem.contains("Good") && image != null && image!.value != null) || (selectItem.isNotEmpty && selectItem.contains("good") && image != null && image!.value == null)){
                    if(selectItem.contains(othersController.value.text) == false){
                      selectItem.add(othersController.value.text);
                    }
                    selectItem.remove("Other");
                    Navigator.of(context).pop();
                  }else if ((selectItem.isNotEmpty && !selectItem.contains("Good")) && image != null && image!.value == null && selectItem[0].isNotEmpty){
                    CustomToast.instance.showMsg(MyStrings.vUploadImage);
                  }else{
                    Navigator.of(context).pop();
                  }
                }
              }, buttonText: MyStrings.submit),
            ),
          ],
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
                          pickImage(ImageSource.camera);
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
                          pickImage(ImageSource.gallery);
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