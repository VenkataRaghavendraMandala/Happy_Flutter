// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:happy/constanta/colors.dart';
import 'package:happy/constanta/constants_images.dart';

class NetflixScreen extends StatefulWidget {
  const NetflixScreen({super.key});

  @override
  State<NetflixScreen> createState() => _NetflixScreenState();
}

class _NetflixScreenState extends State<NetflixScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.darkScaffoldBackgroundColor,
        title: const Text(
          'Netflix',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          loadBanner(),
          loadHeaderView('Telugu Movies', 'View All'),
          loadNetflixView(),
          loadHeaderView('Tamil Movies', 'View All'),
          loadNetflixView(),
          loadHeaderView('Hindi Movies', 'View All'),
          loadNetflixView(),
        ],
      ),
    );
  }

  Widget loadBanner() {
    return SizedBox(
      height: 200,
      child: Image.asset(
        AllImages().hotelImage,
        height: 200,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget loadHeaderView(String title, String buttonTitle) {
    return Container(
      padding: const EdgeInsets.all(0),
      height: 50,
      width: double.infinity,
      color: Colors.redAccent,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          MaterialButton(
            onPressed: () {},
            child: Text(buttonTitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget loadNetflixView() {
    return SizedBox(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Container(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
        height: 300,
        width: 200,
        //color: Colors.black,
        decoration: const BoxDecoration(
            // borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                //color: Colors.grey,
                offset: Offset(0.0, 0.4),
                blurRadius: 10.0,
              )
            ]),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        AllImages().hotelImage,
                        height: 140.0,
                        width: 140.0,
                      ),
                    ),
                    const Text('RRR',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
