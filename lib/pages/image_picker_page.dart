import 'package:business_directory/controllers/image_controller.dart';
import 'package:business_directory/utils/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImagePickerPage extends StatelessWidget {
  final imageController = Get.find<ImageController>();
  ImagePickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            final res = await pickImageFromGallery();
            res.fold((l) {
              print(l);
            }, (image) {
              imageController.setImagePathAndName(image.path, image.name);
              Get.back();
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.image, size: MediaQuery.of(context).size.width * 0.25),
              Text(
                "Gallery",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.2),
        GestureDetector(
          onTap: () async {
            final res = await pickImageFromCamera();
            res.fold((l) {
              print(l);
            }, (image) {
              imageController.setImagePathAndName(image.path, image.name);
              Get.back();
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera,
                size: MediaQuery.of(context).size.width * 0.25,
              ),
              Text(
                "Camera",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
