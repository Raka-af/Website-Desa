import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/mobile/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      body: Column(
        children: <Widget>[
          News(),
          Footer(),
        ],
      ),
    );
  }
}

//News
class News extends StatelessWidget {
  const News({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      color: Colors.white,
      width: screenWidth * 1,
      height: screenHeight * 0.71,
      child: Column(
        children: [
          Text(
            'Berita',
            style: TextStyle(
                fontSize: screenWidth * 0.015 + screenHeight * 0.015,
                color: Colors.black),
          ),
          Container(
            height: screenWidth * 0.002,
            width: screenHeight * 0.2,
            color: Colors.black,
            margin: EdgeInsets.only(top: 8),
          ),

          SizedBox(
            height: 10,
          ),

          //
          Row(
            children: [
              Image(
                image: AssetImage("assets/Desa/Berita.png"),
                width: screenWidth * 0.3,
                height: screenHeight * 0.1,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    'Desa Margalaksana meraih \n'
                    'gelar juara tingkat kabupaten\n Sumedang',
                    style: TextStyle(
                        fontSize: screenWidth * 0.012 + screenHeight * 0.012,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month_rounded),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '25 Juli 2024',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),

          SizedBox(
            height: 10,
          ),

          //
          Row(
            children: [
              Image(
                image: AssetImage("assets/Desa/Berita.png"),
                width: screenWidth * 0.3,
                height: screenHeight * 0.1,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    'Desa Margalaksana meraih \ngelar juara '
                    'tingkat kabupaten \nSumedang',
                    style: TextStyle(
                        fontSize: screenWidth * 0.012 + screenHeight * 0.012,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month_rounded),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '25 Juli 2024',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),

          SizedBox(
            height: 10,
          ),

          //
          Row(
            children: [
              Image(
                image: AssetImage("assets/Desa/Berita.png"),
                width: screenWidth * 0.3,
                height: screenHeight * 0.1,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    'Desa Margalaksana meraih \ngelar juara '
                    'tingkat kabupaten \nSumedang',
                    style: TextStyle(
                        fontSize: screenWidth * 0.012 + screenHeight * 0.012,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month_rounded),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '25 Juli 2024',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),

          SizedBox(
            height: 10,
          ),

          //
          Row(
            children: [
              Image(
                image: AssetImage("assets/Desa/Berita.png"),
                width: screenWidth * 0.3,
                height: screenHeight * 0.1,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    'Desa Margalaksana meraih \ngelar juara '
                    'tingkat kabupaten\n Sumedang',
                    style: TextStyle(
                        fontSize: screenWidth * 0.012 + screenHeight * 0.012,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        size: 20,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '25 Juli 2024',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),

          SizedBox(
            height: 10,
          ),
          //
          Row(
            children: [
              Image(
                image: AssetImage("assets/Desa/Berita.png"),
                width: screenWidth * 0.3,
                height: screenHeight * 0.1,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    'Desa Margalaksana meraih \ngelar juara '
                    'tingkat kabupaten \nSumedang',
                    style: TextStyle(
                        fontSize: screenWidth * 0.012 + screenHeight * 0.012,
                        color: Colors.black),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_rounded,
                        size: 20,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '25 Juli 2024',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
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
            'Desa Margalaksana \n Jl. Kareumbi Desa Margalaksana Kec. Sumedang Selatan \n Kabuaten Sumedang Provinsi Jawa Barat \n Kode Pos 45311 \n Email:',
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
                    Image(
                      image: AssetImage("assets/Desa/social.png"),
                      width: screenWidth * 0.045,
                      height: screenHeight * 0.045,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage("assets/Desa/facebook.png"),
                      width: screenWidth * 0.045,
                      height: screenHeight * 0.045,
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
