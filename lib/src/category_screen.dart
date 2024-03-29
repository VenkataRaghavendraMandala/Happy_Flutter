// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:happy/constanta/constants_images.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          title: const Text(
            "Category",
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
        body: loadPlaceDetails());
  }

  Widget loadPlaceDetails() {
    return SizedBox(
        height: double.infinity / 2,
        width: double.infinity / 2,
        child: Container(
          padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
          height: double.infinity / 2,
          width: double.infinity / 2,
          child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  //  padding: const EdgeInsets.all(20),
                  height: double.infinity / 2,
                  width: double.infinity / 2,
                  color: Colors.black,
                  //padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
                  child: Column(
                    children: [
                      Image.asset(
                        AllImages().hotelImage,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Kadapa',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        '100KM',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}

/*

Container(
                color: Colors.black,
                padding: const EdgeInsets.all(12.0),
                child: const Text(
                  'Home',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              );
*/