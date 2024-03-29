// ignore: file_names
import 'dart:convert';

// ignore: unused_import
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();

  showAlertMethod() {}
  showLoadertMethod() {}

  Future<Map<String, dynamic>> postData() async {
    const apiUrl = 'https://jsonplaceholder.typicode.com/albums';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },

//  Map<String, String> headers = {
//       'Content-Type': 'application/json',
//       'authType': 'Zeemart'
//     };

        body: jsonEncode(<String, dynamic>{
          "title": "I Love Happy",
          //"body": "I Love Happy",
          "userId": 10,
          // Add any other data you want to send in the body
        }),
      );

      if (response.statusCode == 201) {
        // Successful POST request, handle the response here
        final responseData = jsonDecode(response.body);
        // String result = '';

        return responseData;
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to post data');
      }
    } catch (e) {
      rethrow;
    }
  }
}

/*
class getSpecificUser {
  Future<ApiResponse> retriveSpecificUser(
      String supplierId, String mudra, String userID) async {
    Map<String, String> queryParams = {'userId': userID};
    var userModel = null;
    String queryString = Uri(queryParameters: queryParams).query;

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authType': 'Zeemart',
      'mudra': mudra,
      'supplierId': supplierId
    };

    print(headers);
    var requestUrl =
        URLEndPoints.get_specific_user_login_url + '?' + queryString;
    print(requestUrl);
    try {
      var response = await http.get(requestUrl, headers: headers);
      // await http.get(requestUrl, headers: headers).then((response) {
      if (response.statusCode == 200) {
        print(response.body);
        var jsonString = response.body;
        var jsonMap = json.decode(response.body);
        userModel = ApiResponse.fromJson(jsonMap);
        // return userModel;
      } else {
        throw Exception('Failed to login');
      }
      //  });
    } catch (Exception) {
      // return userModel;
    }
    return userModel;
  }
}


 Future<statusSuccessResponse> validateVerificationCode(String email, String otp) async {
    var resetPasswordModel = null;

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'authType': 'Zeemart',
    };
    print(headers);

    print(URLEndPoints.validate_verification_code);
    final msg = jsonEncode({
      'ZeemartId': email,
      'verificationCode': otp,
    });

    print(msg);
    try {
      await http
          .post(URLEndPoints.validate_verification_code, headers: headers, body: msg)
          .then((response) {
        if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202) {
          print(response.body);
          print('Success response');
          resetPasswordModel =
              statusSuccessResponse.fromJson(json.decode(response.body));
        } else {
          //throw Exception('Failed to login');
          print('failed to send otp');
        }
      });
    } catch (Exception) {
      print('returned to cache');
    }
    return resetPasswordModel;
  }

*/