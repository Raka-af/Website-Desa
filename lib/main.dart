import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:website_desa/admin/admin_screen.dart';
import 'package:website_desa/admin/data_penduduk.dart';
import 'package:website_desa/admin/data_penduduk.dart';
import 'package:website_desa/admin/galeri.dart';
import 'package:website_desa/admin/umkm.dart';
import 'package:website_desa/dashboard.dart';
import 'package:website_desa/firebase_options.dart';
import 'package:website_desa/home.dart';
import 'package:website_desa/admin/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: Dashboard(),
    );
  }
}
