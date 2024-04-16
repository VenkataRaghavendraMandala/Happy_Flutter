import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter/foundation.dart';

class DownloadImagesScreen extends StatefulWidget {
  const DownloadImagesScreen({super.key});

  @override
  State<DownloadImagesScreen> createState() => _DownloadImagesScreenState();
}

class _DownloadImagesScreenState extends State<DownloadImagesScreen> {
  Future<void> downloadAndSaveImage(String imageUrl) async {
    // Fetch image data from the URL
    http.Response response = await http.get(Uri.parse(imageUrl));
    Uint8List imageData = response.bodyBytes;

    // Get the directory where we can save files
    Directory directory = await getApplicationDocumentsDirectory();
    String filePath = '${directory.path}/downloaded_image.jpg';

    // Compress and save the image
    File file = File(filePath);
    if (kDebugMode) {
      print(file);
    }
    file.writeAsBytesSync(await FlutterImageCompress.compressWithList(
      imageData,
      minHeight: 1920,
      minWidth: 1080,
      quality: 90,
    ));

    // Show a message indicating the image is saved
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Image downloaded and saved to $filePath'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Downloader'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            downloadAndSaveImage(
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerFun.jpg'); // Replace with your image URL
          },
          child: const Text('Download Image'),
        ),
      ),
    );
  }
}
