import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:website_desa/dashboard/mobile/layout_screen.dart';

class HomeScreen2 extends StatelessWidget {
  const HomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      showBackButton: false,
      body: Column(
        children: <Widget>[
          HeroSection(),
          FacilitySection(),
          Footer(),
          // Tambahkan lebih banyak halaman di sini jika diperlukan
        ],
      ),
    );
  }
}

//Hero Section
class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Center(
        child: Stack(
          children: <Widget>[
            Image(
              image: AssetImage("assets/Desa/Margalaksana.jpg"),
              width: screenWidth * 1,
              height: screenHeight * 0.5,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: screenHeight * 0.2,
              left: screenWidth * 0.2,
              right: screenWidth * 0.2,
              child: Text(
                'Selamat Datang\n'
                ' Website Desa Margalaksana',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenHeight * 0.02 + screenWidth * 0.02,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Facility Section
class FacilitySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      color: Colors.white,
      width: screenWidth * 1,
      height: screenHeight * 0.9,
      child: Column(
        children: <Widget>[
          Text(
            'Fasilitas Desa',
            style: TextStyle(
              fontSize: screenWidth * 0.01 + screenHeight * 0.03,
              color: Colors.black,
              fontFamily: 'SFUi',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 30),
          Column(
            children: <Widget>[
              SizedBox(width: 20),
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image: AssetImage("assets/Desa/Margalaksana.jpg"),
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.15,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Gedung Desa Margalaksana',
                    style: TextStyle(
                        fontSize: screenHeight * 0.01 + screenWidth * 0.01,
                        color: Colors.black,
                        fontFamily: 'SFUi'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        size: 15,
                        color: Colors.black87,
                      ),
                      Text(
                        'Senin - Jumat',
                        style: TextStyle(fontSize: 10, color: Colors.black87),
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.access_time,
                        size: 15,
                        color: Colors.black87,
                      ),
                      Text(
                        '08.00 - 16.00',
                        style: TextStyle(fontSize: 10, color: Colors.black87),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),

              //
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image: AssetImage("assets/Desa/Sentra Kuliner.jpg"),
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.15,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Sentra Kuliner Margalaksana',
                    style: TextStyle(
                        fontSize: screenHeight * 0.01 + screenWidth * 0.01,
                        color: Colors.black,
                        fontFamily: 'SFUi'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        size: 15,
                        color: Colors.black87,
                      ),
                      Text(
                        'Senin - Jumat',
                        style: TextStyle(fontSize: 10, color: Colors.black87),
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.access_time,
                        size: 15,
                        color: Colors.black87,
                      ),
                      Text(
                        '08.00 - 16.00',
                        style: TextStyle(fontSize: 10, color: Colors.black87),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              //
              Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      image: AssetImage("assets/Desa/Polindes.jpg"),
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.15,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Polindes Desa Margalaksana',
                    style: TextStyle(
                        fontSize: screenHeight * 0.01 + screenWidth * 0.01,
                        fontFamily: 'SFUi',
                        color: Colors.black),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        size: 15,
                        color: Colors.black87,
                      ),
                      Text(
                        'Senin - Jumat',
                        style: TextStyle(fontSize: 10, color: Colors.black87),
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.access_time,
                        size: 15,
                        color: Colors.black87,
                      ),
                      Text(
                        '08.00 - 16.00',
                        style: TextStyle(fontSize: 10, color: Colors.black87),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
    );
  }
}

//Footer
class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var media = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.black54,
      width: screenWidth * 1,
      height: screenHeight * 0.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: media.width * 0.02,
          ),
          Text(
            'Desa Margalaksana \n Jl. Kareumbi Desa Margalaksana Kec. Sumedang Selatan \n Kabuaten Sumedang Provinsi Jawa Barat \n Kode Pos 45311 \n Email:pemdesmargalaksana2013@gmail.com',
            style: TextStyle(
                fontSize: screenWidth * 0.007 + screenHeight * 0.01,
                color: Colors.white,
                fontFamily: 'SFUi',
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Media Sosial',
                style: TextStyle(
                    fontSize: screenWidth * 0.007 + screenHeight * 0.01,
                    color: Colors.white,
                    fontFamily: 'SFUi',
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () => launchUrl(
                        Uri.parse(
                            'https://www.instagram.com/desamargalaksana_/'),
                      ),
                      child: Image(
                        image: AssetImage("assets/Desa/social.png"),
                        width: screenWidth * 0.045,
                        height: screenHeight * 0.045,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () => launchUrl(
                        Uri.parse(
                            'https://web.facebook.com/profile.php?id=61557585922362'),
                      ),
                      child: Image(
                        image: AssetImage("assets/Desa/facebook.png"),
                        width: screenWidth * 0.045,
                        height: screenHeight * 0.045,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ],
      ),
    );
  }
}
