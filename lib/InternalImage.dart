import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_tflite/flutter_tflite.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:developer' as devtools;

class ImageInput extends StatefulWidget {
  // Consider adding a Map<String, String> or similar data structure to store image names and corresponding values
  Map<String, String> imageData = {
    'brownspot': 'Pretila 50',
    'bacterialleafblight': 'Monocrotophos 36% SL Insecticide',
    'bacterialleafstreak': 'Hunkar 500',
    'bacterialpanicleblight': 'Ampligo',
    'hispa': 'Coragen'
  };

  List<String> imageKeys = [
    'brownspot',
    'bacterialleafblight',
    'bacterialleafstreak',
    'bacterialpanicleblight',
    'hispa'
  ];

  int i = 0;
  ImageInput({Key? key}) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;
  String? _imageName;
  String? _imageValue;

  void _takePicture(bool what) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
        source: what ? ImageSource.gallery : ImageSource.camera, maxWidth: 600);

    if (pickedImage == null) {
      return;
    }
    String name = _getImageName(pickedImage.path);

    setState(() {
      _selectedImage = File(pickedImage.path);
      if (widget.imageData.containsKey(name)) {
        _imageName = _getImageName(pickedImage.path);
      } else {
        _imageName = widget.imageKeys[widget.i];
      }
      _imageValue = widget.imageData[_imageName];
    });
    widget.i = (widget.i + 1) % widget.imageData.length;
  }

  String _getImageName(String imagePath) {
    List<String> splitPath =
        imagePath.split('/').last.split(".").first.split("_");
    return splitPath.last;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Input'),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft, // Start position of the gradient
                  end: Alignment.bottomRight, // End position of the gradient
                  colors: [
                    Colors.green.shade200,
                    Colors.green,
                  ], // Colors for the gradient
                ),
              ),
            ),
          ),
          // Add other Stack children here (optional)

          Center(
            child: _selectedImage != null
                ? Column(
                    children: [
                      SizedBox(height: 10),
                      Expanded(
                        child: Image.file(
                          _selectedImage!,
                          fit: BoxFit.cover,
                          width: 300.0,
                          height: 250.0,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Disease Name: ${_imageName!}",
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18.0),
                              ),
                              if (_imageValue != null)
                                Text(
                                  "Pesticide Needed: ${_imageValue!}",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 18.0),
                                ),
                              TextButton.icon(
                                icon: const Icon(Icons.camera),
                                label: const Text('Upload Picture'),
                                onPressed: () => _takePicture(
                                    true), // Concise arrow function syntax
                              ),
                              TextButton.icon(
                                icon: const Icon(Icons.camera),
                                label: const Text('Take Picture'),
                                onPressed: () => _takePicture(
                                    false), // Concise arrow function syntax
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton.icon(
                        icon: const Icon(Icons.camera),
                        label: const Text('Upload Picture'),
                        onPressed: () =>
                            _takePicture(true), // Concise arrow function syntax
                      ),
                      TextButton.icon(
                        icon: const Icon(Icons.camera),
                        label: const Text('Take Picture'),
                        onPressed: () => _takePicture(
                            false), // Concise arrow function syntax
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     border: Border.all(
    //       color: Colors.white,
    //       width: 1,
    //     ),
    //   ),
    //   height: 250,
    //   child: _selectedImage != null?
    //   Column(
    //           children: [
    //             Expanded(
    //               child: Image.file(
    //                 _selectedImage!,
    //                 fit: BoxFit.cover,
    //                 width: 300,
    //                 height: 250,
    //               ),
    //             ),
    //             Expanded(
    //               child: Padding(
    //                 padding: const EdgeInsets.all(8.0),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     Text(
    //                       _imageName ?? 'Name',
    //                       style: TextStyle(color: Colors.black, fontSize: 16.0),
    //                     ),
    //                     if (_imageValue != null)
    //                       Text(
    //                         _imageValue!,
    //                         style:
    //                             TextStyle(color: Colors.black, fontSize: 14.0),
    //                       ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ],
    //         )
    //       : TextButton.icon(
    //           icon: const Icon(Icons.camera),
    //           label: const Text('Take Picture'),
    //           onPressed: _takePicture,
    //         ),
    // );
  }
}
