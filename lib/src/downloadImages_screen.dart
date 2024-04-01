// import 'package:flutter/material.dart';

// class DownloadImagesScreen extends StatefulWidget {
//   const DownloadImagesScreen({super.key});

//   @override
//   State<DownloadImagesScreen> createState() => _DownloadImagesScreenState();
// }

// class _DownloadImagesScreenState extends State<DownloadImagesScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }

// Future<void> _saveImage(BuildContext context) async {
//     final scaffoldMessenger = ScaffoldMessenger.of(context);
//     late String message;

//     try {
//       // Download image
//       final http.Response response = await http.get(
//           Uri.parse(_url));

//       // Get temporary directory
//       final dir = await getTemporaryDirectory();

//       // Create an image name
//       var filename = '${dir.path}/SaveImage${random.nextInt(100)}.png';

//       // Save to filesystem
//       final file = File(filename);
//       await file.writeAsBytes(response.bodyBytes);

//       // Ask the user to save it
//       final params = SaveFileDialogParams(sourceFilePath: file.path);
//       final finalPath = await FlutterFileDialog.saveFile(params: params);

//       if (finalPath != null) {
//         message = 'Image saved to disk';
//       }
//     } catch (e) {
//       message = e.toString();
//       scaffoldMessenger.showSnackBar(SnackBar(
//         content: Text(
//           message,
//           style:  const TextStyle(
//             fontSize: 12,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: const Color(0xFFe91e63),
//       ));
//     }

//     if (message != null) {

//       scaffoldMessenger.showSnackBar(SnackBar(
//         content: Text(
//           message,
//           style:  const TextStyle(
//             fontSize: 12,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         backgroundColor: const Color(0xFFe91e63),
//       ));

//     }
//   }



// }