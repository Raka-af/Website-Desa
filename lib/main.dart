import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:website_desa/admin/admin_screen.dart';
import 'package:website_desa/admin/data_penduduk.dart';
import 'package:website_desa/admin/galeri.dart';
import 'package:website_desa/admin/umkm.dart';
import 'package:website_desa/dashboard.dart';
import 'package:website_desa/firebase_options.dart';
import 'package:website_desa/home.dart';
import 'package:website_desa/admin/login.dart';

void main() async {
  int selectedIndex = 0;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp(
    selectedIndex: selectedIndex,
  ));
}

class MyApp extends StatelessWidget {
  final int selectedIndex;
  const MyApp({super.key, required this.selectedIndex});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Tentukan halaman pertama yang akan dibuka (LoginAdmin di sini)
      initialRoute: '/',

      // Daftar rute yang digunakan
      routes: {
        '/': (context) => Dashboard(
              selectedIndex: selectedIndex,
            ), // Ha // Halaman admin
        '/login_admin': (context) => LoginAdmin(), // Halaman UMKM
      },
    );
  }
}
