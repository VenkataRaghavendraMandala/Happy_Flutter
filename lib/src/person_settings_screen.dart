import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:happy/constanta/colors.dart';
// ignore: unused_import
import 'package:happy/constanta/constants_images.dart';

class PersonSettingsScreen extends StatefulWidget {
  const PersonSettingsScreen({super.key});

  @override
  State<PersonSettingsScreen> createState() => _PersonSettingsScreenState();
}

class _PersonSettingsScreenState extends State<PersonSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.darkScaffoldBackgroundColor,
        title: const Text(
          'Person Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: const Icon(
          Icons.favorite,
          color: Colors.blueAccent,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return loadCategory(context, index);
                },
                childCount: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  loadCategory(BuildContext context, int index) {
    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
          height: 300,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.white,
              // borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 0.4),
                    blurRadius: 10.0),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$index . I Love India',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
              // SizedBox(
              //   height: 60,
              //   child: Container(
              //     padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              //     height: 60,
              //     child:
              loadOptions(context, index),
              // ListView.builder(
              //     itemCount: 2,
              //     itemBuilder: (context, index) {
              //       return loadOptions(context, index);
              //     }),
              //   ),
              // )
              //loadOptions(context, index),
            ],
          ),
        ),
      ),
    );
  }

  // buildRecommended(BuildContext context, int index) {
  //   return SliverList(
  //     delegate: SliverChildBuilderDelegate(
  //       (BuildContext context, int index) {
  //         return loadOptions(context, index);
  //       },
  //       childCount: 4,
  //     ),
  //   );
  // }

  loadOptions(BuildContext context, int index) {
    return SizedBox(
      height: 240,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: 4,
            itemBuilder: (context, index) {
              return Container(
                height: 50,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.blueGrey,
                    // borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.yellowAccent,
                          offset: Offset(0.0, 0.4),
                          blurRadius: 10.0),
                    ]),
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
                child: Row(
                  children: [
                    Text(
                      "$index. ",
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    const Text(
                      'India',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ],
                ),
              );
            }),

        // Container(
        //   height: 60,
        //   width: double.infinity,
        //   decoration: const BoxDecoration(
        //       color: Colors.black,
        //       // borderRadius: BorderRadius.circular(100),
        //       boxShadow: [
        //         BoxShadow(
        //             color: Colors.yellowAccent,
        //             offset: Offset(0.0, 0.4),
        //             blurRadius: 10.0),
        //       ]),
        //   padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
        //   child: const Row(
        //     children: [
        //       Text(
        //         'A.',
        //         style: TextStyle(
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 20.0),
        //       ),
        //       Text(
        //         'India',
        //         style: TextStyle(
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold,
        //             fontSize: 20.0),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
