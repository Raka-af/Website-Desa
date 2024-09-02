import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/mobile/data_screen.dart';
import 'package:website_desa/dashboard/mobile/destination_screen.dart';
import 'package:website_desa/dashboard/mobile/gallery_screen.dart';
import 'package:website_desa/dashboard/mobile/home_screen.dart';
import 'package:website_desa/dashboard/mobile/layout_screen.dart';
import 'package:website_desa/dashboard/mobile/news_screen.dart';
import 'package:website_desa/dashboard/mobile/profile_screen.dart';
import 'package:website_desa/dashboard/mobile/struktur_screen.dart';
import 'package:website_desa/dashboard/mobile/home_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image(
              image: AssetImage(
                "assets/Desa/Logo.jpg",
              ),
              width: screenWidth * 0.07,
              height: screenHeight * 0.07,
            ),
            Text(
              'Margalaksana',
              style: TextStyle(
                  fontSize: screenHeight * 0.01 + screenWidth * 0.01,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        width: screenWidth * 0.3,
        child: ListView(
          children: [
            ListTile(
              title: InkWell(
                  onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen2()),
                      ),
                  child: Text('Home')),
            ),
            ListTile(
              title: InkWell(
                  onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                      ),
                  child: Text('Profil')),
            ),
            ListTile(
              title: InkWell(
                  onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => DataScreen()),
                      ),
                  child: Text('Data')),
            ),
            ListTile(
              title: InkWell(
                  onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StructureScreen(),
                        ),
                      ),
                  child: Text('Struktur')),
            ),
            ListTile(
              title: InkWell(
                  onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DestinationScreen(),
                        ),
                      ),
                  child: Text('Destinasi')),
            ),
            ListTile(
              title: InkWell(
                  onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsScreen(),
                        ),
                      ),
                  child: Text('Berita')),
            ),
            ListTile(
              title: InkWell(
                  onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GalleryScreen(),
                        ),
                      ),
                  child: Text('Galeri')),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: body,
      ),
    );
  }
}
