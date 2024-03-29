// ignore: unused_import
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
// ignore: unused_import
import 'package:happy/splash/login_screen.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  // SplashPageState() {}
  final SwiperController _controller = SwiperController();
  int _currentIndex = 0;
  final List<String> titles = [
    "Welcome",
    "Awesome App",
    "Flutter App",
  ];
  final List<String> subtitles = [
    "Welcome to this awesome intro screen app.",
    "This is an awesome app, of intro screen design",
    "Flutter is awesome for app development"
  ];
  final List<Color> colors = [
    Colors.green.shade300,
    Colors.blue.shade300,
    Colors.indigo.shade300,
  ];
  final List<String> images = [
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerBlazes.jpg",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerFun.jpg",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/images/ForBiggerMeltdowns.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Swiper(
            loop: false,
            index: _currentIndex,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _controller,
            pagination: const SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                activeColor: Colors.red,
                activeSize: 20.0,
              ),
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return SplashItem(
                title: titles[index],
                subtitle: subtitles[index],
                bg: colors[index],
                imageUrl: images[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: TextButton(
              child: const Text("Skip"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon:
                  Icon(_currentIndex == 2 ? Icons.check : Icons.arrow_forward),
              onPressed: () {
                if (_currentIndex != 2) {
                  _controller.next();
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class SplashItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color? bg;
  final String? imageUrl;

  const SplashItem(
      {super.key, required this.title, this.subtitle, this.bg, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg ?? Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.white),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 20.0),
                Text(
                  subtitle!,
                  style: const TextStyle(color: Colors.white, fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 40.0),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Material(
                      elevation: 4.0,
                      child: Image.network(
                        imageUrl ?? "",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
