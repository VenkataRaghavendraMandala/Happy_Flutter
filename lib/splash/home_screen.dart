import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:happy/splash/gridview_screen.dart';
// ignore: unused_import
import 'package:happy/splash/notification_screen.dart';
import 'package:happy/splash/profile_screen.dart';
import 'package:happy/splash/youtube_screen.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => HomescreenState();
}

class HomescreenState extends State<Homescreen> {
  List<dynamic> users = [];
  List<dynamic> menuTitle = [];
  List<dynamic> menuImages = [];
  int currentPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          final email = user["email"];
          final name = user["name"]["first"];
          final image = user["picture"]["thumbnail"];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(image),
            ),
            title: Text(email),
            subtitle: Text(name),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchDetailsFromServer();
        },
        backgroundColor: Colors.blue,
        child: const Icon(
          Icons.favorite,
          color: Colors.white,
        ),
      ),
      drawer: Drawer(
          // backgroundColor: Colors.blueAccent,
          child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          'https://randomuser.me/api/portraits/thumb/men/81.jpg',
                          width: 60,
                          height: 60,
                        )),
                    const SizedBox(
                      height: 12,
                    ),
                    const Text(
                      'Venkata Raghavendra Mandala',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              )),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Homescreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.grid_view),
            title: const Text('GridView'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const YouTubeScreen()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profile'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()));
            },
          )
        ],
      )),
    );
  }

  void fetchDetailsFromServer() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      // print(json["results"]);
      users = json["results"];
    });
  }
}
