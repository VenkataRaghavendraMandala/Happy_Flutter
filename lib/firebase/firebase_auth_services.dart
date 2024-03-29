// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart';

// class FireBaseAuthService {
//   FirebaseAuth auth = FirebaseAuth.instance;

// // Create New User/ SignUp With Email And Password
//   Future<User?> signUpWithEmailandPassword(
//       String email, String password) async {
//     try {
//       UserCredential credential = await auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       return credential.user;
//     } catch (e) {
//       if (kDebugMode) {
//         print("Some Error Occured");
//       }
//     }
//     return null;
//   }

//   // SignIn with Email And Password
//   Future<User?> signInWithEmailandPassword(
//       String email, String password) async {
//     try {
//       UserCredential credential = await auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       return credential.user;
//     } catch (e) {
//       if (kDebugMode) {
//         print("Some Error Occured");
//       }
//     }
//     return null;
//   }

//   //
// }
