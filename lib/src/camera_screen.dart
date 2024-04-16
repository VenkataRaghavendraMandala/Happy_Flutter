import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  final List<CameraDescription> cameras;

  const CameraScreen({super.key, required this.cameras});

  //CameraScreen(this.cameras);
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController controller;
  File? pickedImage;
  @override
  void initState() {
    super.initState();
    controller = CameraController(widget.cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker Example'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.file(pickedImage!),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                pickedImage = await pickImage();
                // Do something with the picked image, like display it in an ImageView
                // Image.file(pickedImage ?? File(""));
                if (kDebugMode) {
                  print(pickedImage ?? File(""));
                }
                setState(() {
                  //Image.file(pickedImage!);
                });
                // Image(
                //   image: FileImage(pickedImage ?? File("")),
                // );
              },
              child:
                  // pickedImage != null
                  //     ? Image.file(pickedImage!)
                  //     :
                  const Text('No image selected'),
            ),
          ),
        ],
      ),
    );
    //MaterialApp(
    //home:
    // CameraPreview(controller),
    //);
  }

  Future<File?> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    }
    return null;
  }
}
