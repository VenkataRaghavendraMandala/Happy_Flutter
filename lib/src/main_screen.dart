// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:happy/constanta/constants_images.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          'Main Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          loadBannerImage(),
          categoryDetails(),
          loadBannerImage(),
          categoryDetails(),
        ],
      ),
    );
  }

  Widget loadBannerImage() {
    return Container(
      color: Colors.grey,
      child: Image.asset(AllImages().hotelImage),
    );
  }

  Widget categoryDetails() {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 30,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
                padding: const EdgeInsets.all(12.0),
                color: Colors.greenAccent,
                height: 200,
                width: 120,
                child: Column(
                  children: [
                    Expanded(
                      child: Hero(
                          //borderRadius: BorderRadius.circular(200),
                          tag: index,
                          child: Image.asset(
                            AllImages().hotelImage,
                            width: 120,
                            height: 120,
                            //fit: BoxFit.fitHeight,
                          )),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text('Raghava',
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'rs.1200',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
