// Notes App

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      // use StreamBuilder for Firebase Authentication purpose (login/sign up Page Switching)
      // [ use Firebase Pre-Built userChanges() Method inside StreamBuilder ]
      home: const Placeholder(),
    );
  }
}
