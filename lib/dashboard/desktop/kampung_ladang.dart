import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:website_desa/dashboard/desktop/home_screen.dart';
import 'package:website_desa/dashboard/desktop/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class KampungLadang extends StatelessWidget {
  const KampungLadang({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      // showBackButton: false,
      body: Column(
        children: [
          Ladang(),
          Footer(),
        ],
      ),
      selectedIndex: 4,
    );
  }
}

//Kampung Ladang
class Ladang extends StatelessWidget {
  const Ladang({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        width: 1500,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: [
            Text(
              'Kampung Ladang',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
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
              child: SingleChildScrollView(
                child: Container(
                  width: 750,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(77, 77, 77, 77),
                  ),
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
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(Icons.call),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () => {
                              launchUrl(
                                Uri.parse('https://wa.me/6281234567890'),
                              ),
                            },
                            child: Text(
                              '08129994135',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined),
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () => {
                              launchUrl(
                                Uri.parse(
                                    'https://maps.app.goo.gl/YXBFV6ZprvP2Q2xZ6'),
                              ),
                            },
                            child: Text(
                              'Lokasi',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image(
                              image:
                                  AssetImage("assets/KampungLadang/Pohon2.jpg"),
                              fit: BoxFit.cover,
                              width: 250,
                              height: 187,
                            ),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image: AssetImage(
                                      "assets/KampungLadang/Liwet.jpg"),
                                  fit: BoxFit.cover,
                                  width: 150,
                                  height: 84,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(
                                  image: AssetImage(
                                      "assets/KampungLadang/Taman.jpg"),
                                  fit: BoxFit.cover,
                                  width: 200,
                                  height: 90,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image(
                              image:
                                  AssetImage("assets/KampungLadang/Pohon.jpg"),
                              fit: BoxFit.cover,
                              width: 150,
                              height: 200,
                            ),
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.start,
                      ),
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
