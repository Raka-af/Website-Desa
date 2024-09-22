import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/desktop/home_screen.dart';
import 'package:website_desa/dashboard/desktop/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class TapalKuda extends StatelessWidget {
  const TapalKuda({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      // showBackButton: false,
      body: Column(
        children: [
          Cafe(),
          Footer(),
        ],
      ),
      selectedIndex: 4,
    );
  }
}

//Tapal Kuda
class Cafe extends StatelessWidget {
  const Cafe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: 1500,
      height: 1100,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        children: [
          Text(
            'Cafe Tapal kuda',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          Container(
            height: 2,
            width: 250,
            color: Colors.black,
            margin: EdgeInsets.only(top: 8),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                width: 770,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(77, 77, 77, 77),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image(
                        image: AssetImage("assets/TapalKuda/Home1.jpg"),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Kopi Tapal Kuda adalah sebuah kafe yang menawarkan pengalaman'
                      'menikmati kopi yang tak terlupakan dengan suasana yang unik dan hangat.'
                      'Terletak di lokasi strategis dengan pemandangan yang memikat,'
                      'menciptakan atmosfer yang berbeda dari kafe-kafe lainnya. Di Kopi Tapal Kuda,'
                      'kami menyajikan berbagai jenis kopi spesial yang dibuat dari biji kopi pilihan'
                      'terbaik. Dari espresso yang kuat hingga latte yang lembut, setiap cangkir'
                      'kopi diseduh dengan teknik yang sempurna oleh barista berpengala'
                      'man kami. Selain itu, kami juga menawarkan beragam pilihan minuman non-kopi'
                      'seperti teh, cokelat panas, dan jus segar, serta berbagai kudapan lezat yang'
                      'cocok untuk menemani waktu santai Anda',
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
                              Uri.parse('https://wa.me/6285315141920'),
                            ),
                          },
                          child: Text(
                            '085315141920',
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
                                  'https://maps.app.goo.gl/ue1eBB1frMBwZBjd6'),
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
                            image: AssetImage("assets/TapalKuda/Home.jpg"),
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(
                            image: AssetImage("assets/TapalKuda/Kopi.jpg"),
                            fit: BoxFit.cover,
                            width: 200,
                            height: 200,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(
                            image: AssetImage("assets/TapalKuda/Night.jpg"),
                            fit: BoxFit.cover,
                            width: 250,
                            height: 187,
                          ),
                        ),
                      ],
                    ),
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
