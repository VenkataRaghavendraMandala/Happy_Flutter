import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter/foundation.dart';

class DownloadVideoScreen extends StatefulWidget {
  const DownloadVideoScreen({super.key});

  @override
  State<DownloadVideoScreen> createState() => _DownloadVideoScreenState();
}

class _DownloadVideoScreenState extends State<DownloadVideoScreen> {
  Future<void> downloadAndSaveVideo(String videoUrl) async {
    try {
      // Create a Dio instance for making HTTP requests
      Dio dio = Dio();

      // Define a file name for the video
      String fileName = videoUrl.split('/').last;

      // Get the cache directory for storing the downloaded file
      DefaultCacheManager cacheManager = DefaultCacheManager();
      File videoFile = await cacheManager.getSingleFile(videoUrl);
      if (kDebugMode) {
        print(videoFile);
      }
      // Check if the file already exists in the cache
      if (videoFile.existsSync()) {
        // If the file already exists, show a message or perform any desired action
        if (kDebugMode) {
          print('Video already downloaded and saved!');
        }
      } else {
        // If the file doesn't exist, download it
        await dio.download(videoUrl, cacheManager.getFile(videoUrl));

        // Retrieve the downloaded video file
        videoFile = await cacheManager.getSingleFile(videoUrl);
        if (kDebugMode) {
          print(videoFile);
        }
        // Check if the file was downloaded successfully
        if (videoFile.existsSync()) {
          // If the file was downloaded successfully, show a message or perform any desired action
          if (kDebugMode) {
            print('Video downloaded and saved successfully!');
          }
        } else {
          // If there was an error downloading the file, show an error message or handle the error accordingly
          if (kDebugMode) {
            print('Error downloading the video!');
          }
        }
      }
    } catch (e) {
      // Handle any errors that occur during the process
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Downloader'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            String videoUrl =
                'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4';
            downloadAndSaveVideo(videoUrl);
          },
          child: const Text('Download Video'),
        ),
      ),
    );
  }
}
