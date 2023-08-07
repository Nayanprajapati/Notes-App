// Notes App

import 'package:flutter/material.dart';

// Getx package
import 'package:get/get.dart';

// Firebase Core + firebase_options
import 'package:firebase_core/firebase_core.dart';
import 'package:note_taking_app/firebase_options.dart';

// Firebase Authentication
import 'package:firebase_auth/firebase_auth.dart';

// Project Pages import
import 'package:note_taking_app/Pages/home/home_page.dart';

// Auth_controller
import 'Authentication_Services/auth_controller.dart';

// it will initialize our Flutter Firebase app before starting the App

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  //AuthenticationController
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    // using GetMaterialApp for GetX functionality
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      // using StreamBuilder for Firebase Authentication purpose (login/signup & HomePage Switching)
      // [ using FirebaseAuth Pre-Built authStateChanges() Method inside StreamBuilder ]
      // It will fire event everytime whenever user login or logout
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // setting isLogin variable to true
            authController.isLogin.value = true;
            // if user logged in then Go to HomePage
            return const HomePage();
          } else {
            // setting isLogin variable to false
            authController.isLogin.value = false;
            // after logout user will go to LogInPage
            return const HomePage();
          }
        },
      ),
    );
  }
}
