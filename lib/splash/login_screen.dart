// ignore: depend_on_referenced_packages
//import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';

// ignore: depend_on_referenced_packages
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happy/Services/services.dart';
import 'package:happy/apihelper/rest_api_handler_data.dart';
// ignore: unused_import
import 'package:happy/constanta/NetworkManager.dart';
import 'package:happy/constanta/constants.dart';
// ignore: unused_import
import 'package:happy/firebase/firebase_auth_services.dart';
//import 'package:happy/splash/home_screen.dart';
// ignore: unused_import
import 'package:happy/splash/notification_screen.dart';
// ignore: unused_import
import 'package:happy/splash/tabbar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final emailTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';
  String result = '';
  //final FireBaseAuthService fireBaseAuthService = FireBaseAuthService();

  Singleton singletion = Singleton();
  @override
  void initState() {
    super.initState();
    singletion.showLoadertMethod();
  }

  @override
  void dispose() {
    super.dispose();
    emailTextController.dispose();
    nameTextController.dispose();
    passwordTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    fetchUserDetails();
    return Scaffold(
        //backgroundColor: Colors.black,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.blue,
          // title: const Text("Happy",
          //     style: TextStyle(color: Colors.white, fontSize: 32)),
          // centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 24),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                      child: Column(
                    children: [
                      Text("Login".tr(),
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 32),
                      TextFormField(
                        controller: emailTextController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: emailValidation,
                          prefix: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: nameTextController,
                        keyboardType: TextInputType.name,
                        decoration: const InputDecoration(
                          hintText: namevalidation,
                          prefix: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        controller: passwordTextController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          hintText: passwordvalidation,
                          prefix: Icon(Icons.password),
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.all(20),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () {
                            const locale = Locale("te");
                            context.setLocale(locale);
                          },
                          child: const Text("Forgot Password",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent)),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () {
                            validateUserDetails(
                                emailTextController.text,
                                nameTextController.text,
                                passwordTextController.text);
                          },
                          color: Colors.blueAccent,
                          child: const Text("LOGIN",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          onPressed: () {
                            validateUserDetails(
                                emailTextController.text,
                                nameTextController.text,
                                passwordTextController.text);
                          },
                          child: const Text("Create New User Account!!!",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueAccent)),
                        ),
                      ),
                    ],
                  )),
                ),
              )
            ],
          ),
        ));
  }

  void navigateToRegister() {
    // ignore: avoid_print
    print("Navigate to Register Screen!!!!");
    // Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => const TabBarScreen()),
    //     (route) => true);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const TabBarScreen()),
        (route) => true);

    // Navigator.pushNamed(context, 'TabBar');
  }

  validateUserDetails(String email, String name, String password) {
    // if (emailTextController.text != "" &&
    //     nameTextController.text != "" &&
    //     passwordTextController.text != "") {
    const locale = Locale("en");
    context.setLocale(locale);
    if (email != "" && name != "" && password != "") {
      //signUp();
      // saveUserDetails(email, name, password);
      // postData();
      navigateToRegister();
    } else {
      CommonMethods.showAlertMethod(
          'Error', 'Please fill the required fields', context);
    }
    //}
    //sendPostData();
    // sendPostDetilsFromAPIHelper();
    // navigateToRegister();
    //  Navigator.pushNamed(context, '/splash/tabbar_screen');
  }

  sendPostData() async {
    final response = await Authentication.postData();
    setState(() {
      if (kDebugMode) {
        print(response);
      }
    });
  }

  //singleton API Calling
  callPostAPISingleton() async {
    Singleton singleton = Singleton();
    final response = await singleton.postData();
    setState(() {
      if (kDebugMode) {
        print(response);
      }
    });
  }

  static sendPostDetilsFromAPIHelper() async {
    var body = jsonEncode(<String, dynamic>{
      "title": "I Love Happy",
      //"body": "I Love Happy",
      "userId": 10,
      // Add any other data you want to send in the body
    });

    final response = await RestApiHandlerData.postData(
        'https://jsonplaceholder.typicode.com/posts', body);
    if (kDebugMode) {
      print(response);
    }

    // setState(() {
    //   if (kDebugMode) {
    //     print(response);
    //   }
    // });
  }

  Future<void> postData() async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "title": "Raghava",
          "body": "I Love Happy",
          "userId": 1,
          // Add any other data you want to send in the body
        }),
      );

      if (response.statusCode == 201) {
        // Successful POST request, handle the response here
        final responseData = jsonDecode(response.body);
        setState(() {
          result =
              'ID: ${responseData['id']}\nName: ${responseData['name']}\nEmail: ${responseData['email']}';
          if (kDebugMode) {
            print(responseData);
          }
        });
      } else {
        // If the server returns an error response, throw an exception
        throw Exception('Failed to post data');
      }
    } catch (e) {
      setState(() {
        result = 'Error: $e';
      });
    }
  }

  saveUserDetails(String email, String name, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (kDebugMode) {
      print(email);
    }
    if (kDebugMode) {
      print(name);
    }
    if (kDebugMode) {
      print(password);
    }
    sharedPreferences.setString("email", email);
    sharedPreferences.setString("name", name);
    sharedPreferences.setString("password", password);
    sharedPreferences.reload();
    navigateToRegister();
  }

  fetchUserDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String email = sharedPreferences.getString('email') ?? "Email";
    String name = sharedPreferences.getString('name') ?? "Name";
    String password = sharedPreferences.getString('password') ?? "Password";
    //emailTextController.text = email;
    if (kDebugMode) {
      print(email);
    }
    if (kDebugMode) {
      print(name);
    }
    if (kDebugMode) {
      print(password);
    }
  }

  // void signUp() async {
  //   String userName = nameTextController.text;
  //   String email = emailTextController.text;
  //   String password = passwordTextController.text;

  //   User? user =
  //       await fireBaseAuthService.signUpWithEmailandPassword(email, password);
  //   if (user != null) {
  //     if (kDebugMode) {
  //       print('User Created Sucessfully');
  //       saveUserDetails(email, userName, password);
  //     }
  //   } else {
  //     if (kDebugMode) {
  //       print('Error Occurred.....');
  //     }
  //   }
  // }
}
