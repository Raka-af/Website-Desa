import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/mobile/data_screen.dart';
import 'package:website_desa/dashboard/mobile/destination_screen.dart';
import 'package:website_desa/dashboard/mobile/gallery_screen.dart';
import 'package:website_desa/dashboard/mobile/home_screen.dart';
import 'package:website_desa/dashboard/mobile/layout_screen.dart';
import 'package:website_desa/dashboard/mobile/umkm_screen.dart';
import 'package:website_desa/dashboard/mobile/profile_screen.dart';
import 'package:website_desa/dashboard/mobile/struktur_screen.dart';
import 'package:website_desa/dashboard/mobile/home_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({
    super.key,
    required this.body,
    this.showBackButton = true,
  });

  final Widget body;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: showBackButton,
        title: Row(
          children: [
            Image(
              image: AssetImage(
                "assets/Desa/Logo-remove.png",
              ),
              width: screenWidth * 0.07,
              height: screenHeight * 0.07,
            ),
            Text(
              'Margalaksana',
              style: TextStyle(
                  fontSize: screenHeight * 0.01 + screenWidth * 0.01,
                  color: Colors.black,
                  fontFamily: 'SFUI'),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        width: screenWidth * 0.4,
        child: ListView(
          children: [
            ListTile(
              title: InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen2()),
                      ),
                  child: Text(
                    'Home',
                    style: TextStyle(fontFamily: 'SFUI'),
                  )),
            ),
            ListTile(
              title: InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                      ),
                  child: Text(
                    'Profil',
                    style: TextStyle(fontFamily: 'SFUI'),
                  )),
            ),
            ListTile(
              title: InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DataScreen()),
                      ),
                  child: Text(
                    'Data',
                    style: TextStyle(fontFamily: 'SFUI'),
                  )),
            ),
            ListTile(
              title: InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StructureScreen(),
                        ),
                      ),
                  child: Text(
                    'Struktur',
                    style: TextStyle(fontFamily: 'SFUI'),
                  )),
            ),
            ListTile(
              title: InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DestinationScreen(),
                        ),
                      ),
                  child: Text(
                    'Destinasi',
                    style: TextStyle(fontFamily: 'SFUI'),
                  )),
            ),
            ListTile(
              title: InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UmkmScreen(),
                        ),
                      ),
                  child: Text(
                    'UMKM',
                    style: TextStyle(fontFamily: 'SFUI'),
                  )),
            ),
            ListTile(
              title: InkWell(
                  onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GalleryScreen(),
                        ),
                      ),
                  child: Text(
                    'Galeri',
                    style: TextStyle(fontFamily: 'SFUI'),
                  )),
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
