import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/desktop/data_screen.dart';
import 'package:website_desa/dashboard/desktop/destination_screen.dart';
import 'package:website_desa/dashboard/desktop/gallery_screen.dart';
import 'package:website_desa/dashboard/desktop/home_screen.dart';
import 'package:website_desa/dashboard/desktop/layout_screen.dart';
import 'package:website_desa/dashboard/desktop/news_screen.dart';
import 'package:website_desa/dashboard/desktop/profile_screen.dart';
import 'package:website_desa/dashboard/desktop/struktur_screen.dart';

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
                  fontSize: screenWidth * 0.012 + screenHeight * 0.012,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: media.width * 0.275,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              ),
              child: Text(
                'Home',
                style: TextStyle(
                    fontSize: screenWidth * 0.012 + screenHeight * 0.012,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: media.width * 0.02,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen())),
              child: Text(
                'Profil',
                style: TextStyle(
                    fontSize: screenWidth * 0.012 + screenHeight * 0.012,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: media.width * 0.02,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DataScreen()),
              ),
              child: Text(
                'Data',
                style: TextStyle(
                    fontSize: screenWidth * 0.012 + screenHeight * 0.012,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: media.width * 0.02,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StructureScreen(),
                  )),
              child: Text(
                'Struktur',
                style: TextStyle(
                    fontSize: screenWidth * 0.012 + screenHeight * 0.012,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: media.width * 0.02,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DestinationScreen())),
              child: Text(
                'Destinasi',
                style: TextStyle(
                    fontSize: screenWidth * 0.012 + screenHeight * 0.012,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: media.width * 0.02,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NewsScreen()),
              ),
              child: Text(
                'Berita',
                style: TextStyle(
                    fontSize: screenWidth * 0.012 + screenHeight * 0.012,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: media.width * 0.02,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => GalleryScreen()),
              ),
              child: Text(
                'Galeri',
                style: TextStyle(
                    fontSize: screenWidth * 0.012 + screenHeight * 0.012,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
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
