import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/desktop/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required int selectedIndex});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      // showBackButton: false,
      body: Column(
        children: <Widget>[
          HeroSection(),
          FacilitySection(),
          Footer(),
        ],
      ),
      selectedIndex: 0,
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
              height: screenHeight * 0.9,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: screenHeight * 0.35,
              left: screenWidth * 0.2,
              right: screenWidth * 0.2,
              child: Text(
                ' Selamat Datang\n'
                ' Website Desa Margalaksana',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenHeight * 0.02 + screenWidth * 0.025,
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
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
      padding: EdgeInsets.only(top: 30, bottom: 70, left: 10, right: 10),
      color: Colors.white,
      width: 1500,
      child: Column(
        children: <Widget>[
          Text(
            'Fasilitas Desa',
            style: TextStyle(
              fontSize: screenWidth * 0.01 + screenHeight * 0.02,
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(
                        image: AssetImage("assets/Desa/Margalaksana.jpg"),
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
                          color: Colors.black87,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Senin - Jumat',
                          style: TextStyle(color: Colors.black87),
                        ),
                        SizedBox(width: 20),
                        Icon(
                          Icons.access_time,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '08.00 - 16.00',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(width: 20),

              Expanded(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(
                        image: AssetImage("assets/Desa/Sentra Kuliner.jpg"),
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
                          color: Colors.black87,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Senin - Jumat',
                          style: TextStyle(color: Colors.black87),
                        ),
                        SizedBox(width: 20),
                        Icon(
                          Icons.access_time,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '08.00 - 16.00',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenHeight * 0.01 + screenWidth * 0.01,
              ),

              //
              Expanded(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(
                        image: AssetImage("assets/Desa/Polindes.jpg"),
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
                          color: Colors.black87,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Senin - Jumat',
                          style: TextStyle(color: Colors.black87),
                        ),
                        SizedBox(width: 20),
                        Icon(
                          Icons.access_time,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 5),
                        Text(
                          '08.00 - 16.00',
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                  ],
                ),
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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 20, bottom: 10, left: 10),
        color: Colors.black54,
        width: screenWidth * 1,
        child: Row(
          children: <Widget>[
            Text(
              'Desa Margalaksana \n Jl. Kareumbi Desa Margalaksana Kec. Sumedang Selatan \n Kabuaten Sumedang Provinsi Jawa Barat \n Kode Pos 45311 \n Email:pemdesmargalaksana2013@gmail.com',
              style: TextStyle(
                fontSize: screenWidth * 0.007 + screenHeight * 0.01,
                color: Colors.white,
              ),
            ),
            (MediaQuery.of(context).size.width > 750)
                ? SizedBox(width: screenWidth * 0.45)
                : SizedBox(width: screenWidth * 0.25),
            Column(
              children: <Widget>[
                Text(
                  'Media Sosial',
                  style: TextStyle(
                    fontSize: screenWidth * 0.007 + screenHeight * 0.01,
                    color: Colors.white,
                  ),
                ),
                Row(
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
              ],
              mainAxisAlignment: MainAxisAlignment.start,
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
