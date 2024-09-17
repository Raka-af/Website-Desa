import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/mobile/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class KampungLadang extends StatelessWidget {
  const KampungLadang({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      body: Column(
        children: [
          Ladang(),
          Footer(),
        ],
      ),
    );
  }
}

//Kampung Ladang
class Ladang extends StatelessWidget {
  const Ladang({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.white,
      width: 1500,
      height: 1100,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        children: [
          Text(
            'Kampung Ladang',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          Container(
            width: 250,
            height: 2,
            color: Colors.black,
            margin: EdgeInsets.only(top: 8),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              width: 750,
              height: 890,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(77, 77, 77, 77),
              ),
              child: Expanded(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: AssetImage("assets/KampungLadang/Taman.jpg"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Kampoeng Ladang adalah sebuah rumah makan khas Sunda yang menawarkan'
                      ' pengalaman kuliner yang autentik dan memanjakan lidah. Terletak di tengah'
                      ' suasana pedesaan yang asri, Kampung Ladang menghadirkan berbagai hidangan tradisional Sunda'
                      ' yang kaya rasa dan diolah dari bahan-bahan segar hasil bumi lokal.'
                      ' Di Kampung Ladang, Anda bisa menikmati berbagai sajian khas seperti nasi liwet, ikan bakar,'
                      ' pepes, karedok, hingga sambal terasi yang pedas menggugah selera.'
                      ' Desain interior rumah makan ini mengusung konsep alam terbuka dengan penggunaan material alami'
                      ' seperti kayu dan bambu, menciptakan suasana nyaman dan menenangkan. Di sini, para tamu dapat '
                      ' menikmati makanan sambil menikmati pemandangan sawah yang hijau',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Expanded(
                            child: Image(
                              image:
                                  AssetImage("assets/KampungLadang/Pohon2.jpg"),
                              fit: BoxFit.cover,
                              width: screenWidth * 0.35,
                              height: screenHeight * 0.20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                image: AssetImage(
                                    "assets/KampungLadang/Liwet.jpg"),
                                fit: BoxFit.cover,
                                width: screenWidth * 0.3,
                                height: screenHeight * 0.1,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image(
                                image: AssetImage(
                                    "assets/KampungLadang/Taman.jpg"),
                                fit: BoxFit.cover,
                                width: screenWidth * 0.3,
                                height: screenHeight * 0.1,
                              ),
                            ),
                          ],
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    )
                  ],
                ),
              ),
            ),
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
