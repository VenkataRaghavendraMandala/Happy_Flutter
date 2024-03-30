// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:happy/constanta/constants.dart';
import 'package:happy/constanta/constants_images.dart';
// ignore: depend_on_referenced_packages, unused_import
import 'package:url_launcher/url_launcher.dart';

class OpenWebUrlScreen extends StatefulWidget {
  const OpenWebUrlScreen({super.key});

  @override
  State<OpenWebUrlScreen> createState() => _OpenWebUrlScreenState();
}

class _OpenWebUrlScreenState extends State<OpenWebUrlScreen> {
  // final Uri _url = Uri.parse('https://flutter.dev');
  final emailTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Open WebURL',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Image.asset(
            AllImages().hotelImage,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 44,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailTextController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            hintText: emailValidation,
                            prefix: Icon(Icons.email),
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.all(20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // launchUrl() async {
  //   if (!await launchUrl(url)) {
  //     throw Exception('Could not launch $_url');
  //   }
  // }
}
