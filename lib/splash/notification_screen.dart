// ignore: unused_import
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:happy/apihelper/rest_api_handler_data.dart';
import 'package:happy/constanta/colors.dart';
import 'package:happy/model/art_works_model.dart';
import 'package:happy/Services/services.dart';
import 'package:happy/splash/artworkdetails_screen.dart';
// ignore: unused_import
import 'package:happy/splash/navigation_details_screen.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => NotificationState();
}

class NotificationState extends State<NotificationScreen> {
  List<ArtWorksModel> artWorks = [];

  @override
  void initState() {
    super.initState();
    //fetchArtWorks();
    fetchsendDataFromAPIHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.darkScaffoldBackgroundColor,
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: artWorks.length,
          itemBuilder: (context, index) {
            final artWork = artWorks[index];
            //final id = artWork.timestamp;
            final title = artWork.title;
            return ListTile(
              title: Text(title),
              subtitle: Text(title),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ArtWorkDetails(artWork: artWorks[index]))),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //fetchArtWorksDetails();
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.favorite),
      ),
    );
  }

  void fetchArtWorks() async {
    final response = await NetWorkManager.fetchDetailsFromServer();
    setState(() {
      artWorks = response;
    });
  }

  fetchsendDataFromAPIHelper() async {
    final response = await RestApiHandlerData.getArtWorksData(
        'https://api.artic.edu/api/v1/artworks');
    setState(() {
      artWorks = response;
    });
  }

  // void fetchArtWorksDetails() async {
  //   const url = 'https://api.artic.edu/api/v1/artworks';
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   setState(() {
  //     //print(json[user]);
  //     users = json["data"];
  //   });
  // }
}
