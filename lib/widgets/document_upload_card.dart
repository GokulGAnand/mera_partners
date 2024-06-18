import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';
import '../utils/styles.dart';
import '../utils/svg.dart';
import 'image_picker_bottom_sheet.dart';

class DocumentUploadCard extends StatelessWidget {
  final Rx<File?> image;
  final String label;

  const DocumentUploadCard({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Obx(
      () => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.43,
            height: size.height * 0.2,
            child: GestureDetector(
              onTap: () async {
                showModalBottomSheet<void>(
                  context: Get.context!,
                  builder: (BuildContext context) {
                    return ImagePickerSheet(
                      image: image,
                    );
                  },
                );
              },
              child: DottedBorder(
                  color: MyColors.blueLight,
                  radius: const Radius.circular(6),
                  borderType: BorderType.RRect,
                  strokeWidth: 2,
                  borderPadding: const EdgeInsets.only(top: 15, left: 1),
                  dashPattern: const [3, 3],
                  child: Column(
                    mainAxisAlignment: image.value == null ? MainAxisAlignment.spaceAround : MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          image.value == null
                              ? const Icon(Icons.file_upload_outlined)
                              : const Icon(
                                  Icons.done_rounded,
                                  color: MyColors.green,
                                ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            image.value != null ? MyStrings.uploaded : MyStrings.upload,
                            style: image.value != null ? MyStyles.black164001 : MyStyles.grey16400,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      if (image.value != null)
                        GestureDetector(
                          onTap: () {
                            _showFullScreenImage(context, image.value, null);
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.file(
                              image.value!,
                              frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                                return child;
                              },
                              width: size.width * 0.3,
                              height: size.height * 0.09,
                              fit: BoxFit.fill,
                            ),
                          ),
                        )
                    ],
                  )),
            ),
          ),
          Positioned(
            top: 4,
            left: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                color: MyColors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: Text(label),
              ),
            ),
          ),
          if (image.value != null)
            Positioned(
                child: GestureDetector(
              onTap: () async {
                showModalBottomSheet<void>(
                  context: Get.context!,
                  builder: (BuildContext context) {
                    return ImagePickerSheet(
                      image: image,
                    );
                  },
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: 30,
                  color: MyColors.kPrimaryColor,
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        MyStrings.edit,
                        style: MyStyles.white14400,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SvgPicture.asset(
                        MySvg.edit,
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ))
        ],
      ),
    );
  }
}

void _showFullScreenImage(BuildContext context, File? imageFile, String? imageUrl) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              if (imageFile != null)
                Image.file(imageFile)
              else if (imageUrl != null)
                Image.network(imageUrl)
              else
                const Text('No image available'),
            ],
          ),
        ),
      );
    },
  );
}
