// ignore: unused_import
import 'dart:ffi';

import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitched = false;
  String textChanged = "Switch is OFF";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10, top: 15, right: 10),
        child: ListView(
          children: [
            const Text(
              'Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Divider(
            //   height: 16,
            //   thickness: 2,
            // ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              children: [
                Icon(
                  Icons.volume_up_rounded,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'Notifications',
                  style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontSize: 18,
                      color: Colors.blueAccent),
                ),
              ],
            ),
            const Divider(
              height: 16,
              thickness: 2,
            ),
            buildSwitchInRow("Notifications", isSwitched),
            buildSwitchInRow("New Update", isSwitched),
            const Divider(
              height: 16,
              thickness: 2,
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.blueAccent,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'Account',
                  style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                )
              ],
            ),
            const Divider(
              height: 16,
              thickness: 2,
            ),
            buildGestureDetectorInRow(context, "Change Password"),
            buildGestureDetectorInRow(context, "Content Settings"),
            buildGestureDetectorInRow(context, "Social Media"),
            buildGestureDetectorInRow(context, "Language"),
            buildGestureDetectorInRow(context, "Privacy Policy"),
            const SizedBox(
              height: 24,
            ),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'LogOut',
                  style: TextStyle(color: Colors.red),
                )),
          ],
        ),
      ),
    );
  }

  Row buildSwitchInRow(String title, bool isSwitched) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        Text(textChanged, style: const TextStyle(fontSize: 16)),
        Switch(
            value: isSwitched,
            onChanged: swicthChanged,
            activeColor: Colors.black,
            activeTrackColor: Colors.blue,
            inactiveThumbColor: Colors.green,
            inactiveTrackColor: Colors.red),
        // Text(textChanged, style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  void swicthChanged(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textChanged = "Switch is ON";
      });
    } else {
      setState(() {
        isSwitched = false;
        textChanged = "Switch if OFF";
      });
    }
  }

  GestureDetector buildGestureDetectorInRow(
      BuildContext context, String title) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                //color: Colors.blueAccent,
                fontSize: 18,
                // fontWeight: FontWeight.normal
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
