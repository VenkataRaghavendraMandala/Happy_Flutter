import 'dart:io';
import 'package:flutter/material.dart';
import 'package:happy/constanta/constants.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class FileDownloadScreen extends StatefulWidget {
  const FileDownloadScreen({super.key});

  @override
  State<FileDownloadScreen> createState() => FileDownloadState();
}

class FileDownloadState extends State<FileDownloadScreen> {
  Future<void> downloadPDF(String url, String filename) async {
    try {
      final response = await http.get(Uri.parse(url));
      final bytes = response.bodyBytes;
      final dir = await getExternalStorageDirectory();
      final file = File('${dir?.path}/$filename.pdf');
      await file.writeAsBytes(bytes);
      if (kDebugMode) {
        print(file);
        print('PDF Downloaded');
      }
      // ignore: use_build_context_synchronously
      CommonMethods.showAlertMethod("PDF", "Sucessfully Downloaded", context);
    } catch (e) {
      if (kDebugMode) {
        print('Failed to download PDF: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Downloader'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            downloadPDF(
              'https://www.orimi.com/pdf-test.pdf',
              'example',
            );
          },
          child: const Text('Download PDF'),
        ),
      ),
    );
  }
}
