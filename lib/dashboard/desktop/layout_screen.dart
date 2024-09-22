import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/desktop/data_screen.dart';
import 'package:website_desa/dashboard/desktop/destination_screen.dart';
import 'package:website_desa/dashboard/desktop/gallery_screen.dart';
import 'package:website_desa/dashboard/desktop/home_screen.dart';
import 'package:website_desa/dashboard/desktop/umkm_screen.dart';
import 'package:website_desa/dashboard/desktop/profile_screen.dart';
import 'package:website_desa/dashboard/desktop/struktur_screen.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen(
      {super.key, required this.body, required this.selectedIndex});

  final Widget body;
  final int selectedIndex;

  @override
  _LayoutScreenState createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex; // Set initial selected index
  }

  void _navigateToPage(Widget destination, int index) {
    setState(() {
      selectedIndex = index;
    });

    // Menggunakan PageRouteBuilder untuk animasi fade-only
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destination,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation, // Fade transition
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 250), // Durasi transisi fade
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var media = MediaQuery.of(context).size;

    Widget buildNavItem(String title, int index, Widget destination) {
      return InkWell(
        onTap: () {
          _navigateToPage(
              destination, index); // Panggil fungsi dengan transisi fade
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: selectedIndex == index
                    ? Colors.black
                    : Colors.transparent, // Add bottom border if selected
                width: 2.0,
              ),
            ),
          ),
          padding: EdgeInsets.only(bottom: 5), // Optional padding for the text
          child: Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.010 + screenHeight * 0.010,
              color: selectedIndex == index
                  ? Colors.black
                  : Colors.black, // Change color if selected
              fontFamily: 'SFUI',
              fontWeight: selectedIndex == index
                  ? FontWeight.bold
                  : FontWeight.normal, // Optional: Bold selected text
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image(
              image: AssetImage(
                "assets/Desa/Logo-remove.png",
              ),
              width: screenWidth * 0.05,
              height: screenHeight * 0.05,
            ),
            Text(
              'Margalaksana',
              style: TextStyle(
                fontSize: screenWidth * 0.010 + screenHeight * 0.010,
                color: Colors.black,
                fontFamily: 'SFUI',
              ),
            ),
            SizedBox(
              width: media.width * 0.37,
            ),
            buildNavItem('Home', 0, HomeScreen(selectedIndex: 0)),
            SizedBox(width: media.width * 0.02),
            buildNavItem('Profil', 1, ProfileScreen(selectedIndex: 1)),
            SizedBox(width: media.width * 0.02),
            buildNavItem('Data', 2, DataScreen(selectedIndex: 2)),
            SizedBox(width: media.width * 0.02),
            buildNavItem('Struktur', 3, StructureScreen(selectedIndex: 3)),
            SizedBox(width: media.width * 0.02),
            buildNavItem('Destinasi', 4, DestinationScreen(selectedIndex: 4)),
            SizedBox(width: media.width * 0.02),
            buildNavItem('UMKM', 5, UMKMScreen(selectedIndex: 5)),
            SizedBox(width: media.width * 0.02),
            buildNavItem('Galeri', 6, GalleryScreen(selectedIndex: 6)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: widget.body,
      ),
    );
  }
}
