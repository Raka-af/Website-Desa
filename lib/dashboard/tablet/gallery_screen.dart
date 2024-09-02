import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/tablet/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      body: Column(
        children: [
          Gallery(),
          Footer(),
        ],
      ),
    );
  }
}

//Gallery
class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      height: screenHeight * 0.8,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: Container(
                  color: Color.fromARGB(77, 77, 77, 77),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image(
                    image: AssetImage("assets/Desa/1.jpg"),
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Container(
                  color: Color.fromARGB(77, 77, 77, 77),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image(
                    image: AssetImage("assets/Desa/2.jpg"),
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Container(
                  color: Color.fromARGB(77, 77, 77, 77),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image(
                    image: AssetImage("assets/Desa/3.jpg"),
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          SizedBox(
            height: 10,
          ),

          //
          Row(
            children: [
              Flexible(
                child: Container(
                  color: Color.fromARGB(77, 77, 77, 77),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image(
                    image: AssetImage("assets/Desa/1.jpg"),
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Container(
                  color: Color.fromARGB(77, 77, 77, 77),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image(
                    image: AssetImage("assets/Desa/2.jpg"),
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Flexible(
                child: Container(
                  color: Color.fromARGB(77, 77, 77, 77),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image(
                    image: AssetImage("assets/Desa/3.jpg"),
                    height: screenHeight * 0.2,
                    width: screenWidth * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
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
      color: Colors.black54,
      width: screenWidth * 1,
      height: screenHeight * 0.2,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: media.width * 0.02,
          ),
          Text(
            'Desa Margalaksana \n Jl. Kareumbi Desa Margalaksana Kec. Sumedang Selatan \n Kabuaten Sumedang Provinsi Jawa Barat \n Kode Pos 45311 \n Email:',
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
              SizedBox(
                height: media.height * 0.03,
              ),
              Text(
                'Media Sosial',
                style: TextStyle(
                    fontSize: screenWidth * 0.007 + screenHeight * 0.01,
                    color: Colors.white),
              ),
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () => launchUrl(Uri.parse(
                        'https://www.instagram.com/desamargalaksana_/')),
                    child: Image(
                      image: AssetImage("assets/Desa/social.png"),
                      width: screenWidth * 0.045,
                      height: screenHeight * 0.045,
                    ),
                  ),
                  InkWell(
                    onTap: () => launchUrl(Uri.parse(
                        'https://web.facebook.com/profile.php?id=61557585922362')),
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
    );
  }
}
