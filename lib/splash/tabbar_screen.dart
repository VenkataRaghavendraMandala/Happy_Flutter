import 'package:flutter/material.dart';
import 'package:happy/splash/dashhboard_screen.dart';
import 'package:happy/splash/expansionpanel_screen.dart';
// ignore: unused_import
import 'package:happy/splash/gridview_screen.dart';
// ignore: unused_import
import 'package:happy/splash/home_screen.dart';
// ignore: unused_import
import 'package:happy/splash/notification_screen.dart';
import 'package:happy/splash/profile_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: const Text(
              'Home Screen',
              style: TextStyle(color: Colors.white),
            ),
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              )
            ]),
          ),
          body: const TabBarView(children: [
            BottomNavBarScreen(),
            DashBoardScreen(),
            ProfileScreen()
          ]),
        ));
  }
}
