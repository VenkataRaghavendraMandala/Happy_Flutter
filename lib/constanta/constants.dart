import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';

const emailValidation = 'Please Enter Email Address';
const namevalidation = 'Please Enter Name';
const passwordvalidation = 'Please Enter Password';

class Constants {
  static const emailValidation = 'Please Enter Email Address';
  static const namevalidation = 'Please Enter Name';
  static const passwordvalidation = 'Please Enter Password';
}

showtoast(String string) {
  Fluttertoast.showToast(
      msg: string,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey[800],
      textColor: Colors.white,
      fontSize: 16.0);
}

// showProgress() {
//   return ProgressHUD(
//     backgroundColor: Colors.black12,
//     color: Colors.white,
//     containerColor: Colors.black38,
//     borderRadius: 5.0,
//     text: 'Loading...',
//   );
// }

class CommonMethods {
  static Future showAlertMethod(
      String title, String message, BuildContext context) async {
    // Create button
    Widget okButton = MaterialButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
