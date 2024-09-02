import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:website_desa/dashboard.dart';
import 'package:website_desa/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: "AIzaSyAIhWOBOregq9l7CPddUDiuao20zB-Hzso",
      projectId: "flutter-web-connection-5b8e3",
      messagingSenderId: "790943371145",
      appId: "1:790943371145:web:6d4370a08ab84cd8c55b58",
    ));
  } else {
    await Firebase.initializeApp();
  }

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Dashboard(),
    );
  }
}
