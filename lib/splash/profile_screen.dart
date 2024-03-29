import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:happy/constanta/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final emailTextController = TextEditingController();
  final nameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    fetchUserDetails();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 24,
            ),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(100),
                child: Image.network(
                  'https://randomuser.me/api/portraits/thumb/men/81.jpg',
                  width: 150,
                  height: 150,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Venkata Raghavendra Mandala',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'D/No: 9/140-8, Saipeta, Kadapa, Andhra Pradesh, 516001',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Enter Email',
                        border: UnderlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == "") {
                          return "Please Enter Email Address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const TextField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          hintText: 'Enter Name',
                          border: UnderlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const TextField(
                      keyboardType: TextInputType.none,
                      decoration: InputDecoration(
                          hintText: 'Enter Password',
                          border: UnderlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const TextField(
                      keyboardType: TextInputType.none,
                      decoration: InputDecoration(
                          hintText: 'Enter Confirm Password',
                          border: UnderlineInputBorder()),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    //   child: TextButton(
                    //       style: ButtonStyle(
                    //           padding: MaterialStateProperty.all<EdgeInsets>(
                    //               const EdgeInsets.all(15)),
                    //           foregroundColor:
                    //               MaterialStateProperty.all<Color>(Colors.red),
                    //           shape: MaterialStateProperty.all<
                    //                   RoundedRectangleBorder>(
                    //               RoundedRectangleBorder(
                    //                   borderRadius: BorderRadius.circular(18.0),
                    //                   side: const BorderSide(
                    //                       color: Colors.red)))),
                    //       onPressed: () {},
                    //       child: const Text("Submit",
                    //           style: TextStyle(fontSize: 14))),
                    // ),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          validationMethod(context);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        child: const Text("Submit"),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void validationMethod(BuildContext context) {
    if (emailTextController.text != "" &&
        nameTextController.text != "" &&
        passwordTextController.text != "") {
    } else {
      CommonMethods.showAlertMethod(
          'Error', 'Please fill the required fields', context);
    }
  }

  fetchUserDetails() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String email = sharedPreferences.getString('email') ?? "Email";
    String name = sharedPreferences.getString('name') ?? "Name";
    String password = sharedPreferences.getString('password') ?? "Password";
    emailTextController.text = email;
    nameTextController.text = name;
    passwordTextController.text = password;
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
}
