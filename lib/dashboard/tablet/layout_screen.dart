import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/tablet/data_screen.dart';
import 'package:website_desa/dashboard/tablet/destination_screen.dart';
import 'package:website_desa/dashboard/tablet/gallery_screen.dart';
import 'package:website_desa/dashboard/tablet/home_screen1.dart';
import 'package:website_desa/dashboard/tablet/layout_screen.dart';
import 'package:website_desa/dashboard/tablet/news_screen.dart';
import 'package:website_desa/dashboard/tablet/profile_screen.dart';
import 'package:website_desa/dashboard/tablet/struktur_screen.dart';

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
              width: MediaQuery.of(context).size.width * 0.05,
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'Margalaksana',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.023,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: media.width * 0.1,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen1()),
              ),
              child: Text(
                'Home',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.023,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: media.width * 0.03,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen())),
              child: Text(
                'Profil',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.023,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: media.width * 0.03,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => DataScreen()),
              ),
              child: Text(
                'Data',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.023,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: media.width * 0.03,
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
                    fontSize: MediaQuery.of(context).size.width * 0.023,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: media.width * 0.03,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => DestinationScreen())),
              child: Text(
                'Destinasi',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.023,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: media.width * 0.03,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NewsScreen()),
              ),
              child: Text(
                'Berita',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.023,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: media.width * 0.03,
            ),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => GalleryScreen()),
              ),
              child: Text(
                'Galeri',
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.023,
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
