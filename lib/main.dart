import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:plantproject/SignInPage.dart';
import 'package:plantproject/SignUpPage.dart';
import 'package:plantproject/firebase_options.dart';
import 'package:plantproject/BackImage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Replace with your actual Firebase project configuration
  // await Firebase.initializeApp(
  //   options: const FirebaseOptions(
  //     apiKey: "AIzaSyBwU-jYf0K1_x74Pgx7H-VE37dhnka5Ue4",
  //     appId: "1:1044272843105:android:6db170549f60b3f0ef9d20",
  //     projectId: "signin-29b67",
  //     messagingSenderId: "1044272843105",
  //   ),
  // );
  runApp(MaterialApp(
    home: SignInPage(),
    debugShowCheckedModeBanner: false,
  )); // Replace with your app's widget
}
