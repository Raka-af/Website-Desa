import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/desktop/home_screen.dart';
import 'package:website_desa/dashboard/desktop/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class VillaResto extends StatelessWidget {
  const VillaResto({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      // showBackButton: false,
      body: Column(
        children: [
          Villa(),
          Footer(),
        ],
      ),
      selectedIndex: 4,
    );
  }
}

//Villa
class Villa extends StatelessWidget {
  const Villa({super.key});

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
            '95 Farm Villa Resto',
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
                        image: AssetImage("assets/Villa/Home.jpg"),
                        fit: BoxFit.cover,
                        width: 700,
                        height: 313,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      ' 95 Farm Villa Resto adalah destinasi kuliner yang menawarkan'
                      'pengalaman makan unik di tengah-tengah keindahan alam pedesaan.'
                      'Terletak di kawasan yang tenang dan asri, restoran ini mengusung'
                      ' konsep villa dengan sentuhan pertanian, menciptakan suasana yang'
                      'hangat dan menyegarkan bagi setiap pengunjung. Interior restoran'
                      'dirancang dengan nuansa pedesaan yang elegan, menggunakan elemen'
                      'kayu dan tanaman hijau yang melimpah. Di sini, para tamu dapat'
                      'menikmati makanan mereka di ruang makan yang luas dan nyaman,'
                      'dengan pemandangan indah ladang dan taman yang menenangkan.'
                      'Selain itu, tersedia juga area outdoor yang memungkinkan pengunjung'
                      'untuk menikmati udara segar sambil menikmati hidangan mereka.',
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
                              Uri.parse('https://wa.me/628112279595'),
                            ),
                          },
                          child: Text(
                            '08112279595',
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
                                  'https://maps.app.goo.gl/1H9jD21QZyvkqneU7'),
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
                            image: AssetImage("assets/Villa/Taman.jpg"),
                            fit: BoxFit.cover,
                            width: 200,
                            height: 141,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(
                            image: AssetImage("assets/Villa/Liwet.jpeg"),
                            fit: BoxFit.cover,
                            width: 200,
                            height: 141,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image(
                            image: AssetImage("assets/Villa/Tenda.jpg"),
                            fit: BoxFit.cover,
                            width: 200,
                            height: 141,
                          ),
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
