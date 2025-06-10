// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:splash_app/core/utils/color_manager.dart';

// class ImagePickerWidget extends StatelessWidget {
//   final Function(ImageSource) onPickImage;
//   final File? imageFile;

//   const ImagePickerWidget({
//     Key? key,
//     required this.onPickImage,
//     this.imageFile,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           height: 200,
//           width: double.infinity,
//           decoration: BoxDecoration(
//           //  border: Border.all(color: Colors.grey),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: imageFile != null
//               ? Image.file(imageFile!, fit: BoxFit.fill , )
//               : const Center(child: Text('No image selected')),
//         ),
//         const SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ElevatedButton.icon(
//               onPressed: () => onPickImage(ImageSource.gallery),
//               icon: const Icon(Icons.photo, color: ColorsManager.mainColor),
//               label: const Text('Gallery',
//                   style: TextStyle(color: ColorsManager.mainColor)),
//             ),
//             ElevatedButton.icon(
//               onPressed: () => onPickImage(ImageSource.camera),
//               icon: const Icon(Icons.camera_alt, color: ColorsManager.mainColor),
//               label: const Text('Camera',
//                   style: TextStyle(color: ColorsManager.mainColor)),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:splash_app/core/utils/color_manager.dart';

class ImagePickerWidget extends StatelessWidget {
  final Function(ImageSource) onPickImage;
  final File? imageFile;
  final double borderRadius;

  // ignore: prefer_const_constructors_in_immutables
  const ImagePickerWidget({
    Key? key,
    required this.onPickImage,
    this.imageFile,
    this.borderRadius = 10.0, // Default value, can be customized
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey), // Optional border
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: ClipRRect(
            // This clips the image with rounded corners
            borderRadius: BorderRadius.circular(borderRadius),
            child: imageFile != null
                ? Image.file(
                    imageFile!,
                    fit: BoxFit
                        .cover, // Changed from 'fill' to 'cover' for better aspect ratio
                  )
                : const Center(
                    child: Text(
                      'No image selected',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () => onPickImage(ImageSource.gallery),
              icon: const Icon(Icons.photo, color: ColorsManager.mainColor),
              label: const Text('Gallery',
                  style: TextStyle(color: ColorsManager.mainColor)),
            ),
            ElevatedButton.icon(
              onPressed: () => onPickImage(ImageSource.camera),
              icon:
                  const Icon(Icons.camera_alt, color: ColorsManager.mainColor),
              label: const Text('Camera',
                  style: TextStyle(color: ColorsManager.mainColor)),
            ),
          ],
        ),
      ],
    );
  }
}
