import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/desktop/home_screen.dart';
import 'package:website_desa/dashboard/desktop/tapal_kuda.dart';
import 'package:website_desa/dashboard/desktop/kampung_ladang.dart';
import 'package:website_desa/dashboard/desktop/layout_screen.dart';
import 'package:website_desa/dashboard/desktop/vilaa_resto.dart';
import 'package:url_launcher/url_launcher.dart';

class DestinationScreen extends StatelessWidget {
  const DestinationScreen({super.key, required int selectedIndex});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      // showBackButton: false,
      body: Column(
        children: <Widget>[
          Destinasi(),
          Footer(),
        ],
      ),
      selectedIndex: 4,
    );
  }
}

//Kampung Ladang
class Destinasi extends StatelessWidget {
  const Destinasi({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Column(
          children: [
            Text(
              'Destinasi Wisata',
              style: TextStyle(fontSize: 24, color: Colors.black),
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
            Row(
              children: <Widget>[
                SizedBox(width: 20),
                SingleChildScrollView(
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image(
                            image: AssetImage("assets/KampungLadang/Taman.jpg"),
                            width: 378,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            'Kampoeng Ladang',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'Kampoeng Ladang adalah sebuah rumah makan khas Sunda yang diolah dari'
                          ' bahan bahan segar hasil dari bumi lokal. Di Kampoeng Ladang,'
                          ' Anda bisa menikmati berbagai sajian khas seperti nasi liwet, ikan bakar,'
                          ' pepes, karedok, hingga sambal terasi',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month_rounded),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Senin-Minggu')
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time),
                            SizedBox(
                              width: 10,
                            ),
                            Text('08.00-17.00'),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () => {
                                      launchUrl(
                                        Uri.parse(
                                            'https://maps.app.goo.gl/YXBFV6ZprvP2Q2xZ6'),
                                      ),
                                    },
                                child: Text('Lokasi'))
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        KampungLadang(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      return FadeTransition(
                                        opacity:
                                            animation, // Menggunakan fade transition
                                        child: child,
                                      );
                                    },
                                    transitionDuration: Duration(
                                        milliseconds: 250), // Durasi transisi
                                  ),
                                );
                              },
                              child: Icon(Icons.arrow_forward_sharp),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                ),
                SizedBox(width: 20),

                // Tapal Kuda
                SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey),
                    width: 400,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image(
                            image: AssetImage("assets/TapalKuda/Home1.jpg"),
                            width: 378,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            'Cafe Tapal Kuda',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'Kopi Tapal Kuda adalah sebuah kafe yang menawarkan pengalaman'
                          ' menikmati kopi yang tak terlupakan dengan suasana yang unik dan hangat.'
                          ' Terletak di lokasi strategis dengan pemandangan yang memikat, menciptakan'
                          ' atmosfer yang berbeda dari kafe-kafe lainnya.',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month_rounded),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Senin-Minggu'),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time),
                            SizedBox(
                              width: 10,
                            ),
                            Text('14.00-21.00'),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () => {
                                      launchUrl(
                                        Uri.parse(
                                            'https://maps.app.goo.gl/ue1eBB1frMBwZBjd6'),
                                      ),
                                    },
                                child: Text('Lokasi')),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: () => {
                                      Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              TapalKuda(),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            return FadeTransition(
                                              opacity:
                                                  animation, // Menggunakan fade transition
                                              child: child,
                                            );
                                          },
                                          transitionDuration: Duration(
                                              milliseconds:
                                                  250), // Durasi transisi
                                        ),
                                      )
                                    },
                                child: Icon(Icons.arrow_forward_sharp)),
                          ],
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),

                //   Villa Resto
                SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey,
                    ),
                    width: 400,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image(
                            image: AssetImage("assets/Villa/Home1.jpg"),
                            width: 378,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            '95 Farm Villa Resto',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '95 Farm Villa Resto adalah destinasi kuliner yang'
                          ' menawarkan pengalaman makan unik di tengah-tengah keindahan'
                          ' alam pedesaan. Restoran ini mengusung konsep villa dengan sentuhan pertanian,'
                          ' menciptakan suasana yang hangat dan menyegarkan bagi setiap pengunjung',
                          style: TextStyle(fontSize: 18, color: Colors.black),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Icon(Icons.calendar_month_rounded),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Senin-Minggu'),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time),
                            SizedBox(
                              width: 10,
                            ),
                            Text('08.00-21.00'),
                          ],
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () => {
                                      launchUrl(
                                        Uri.parse(
                                            'https://maps.app.goo.gl/1H9jD21QZyvkqneU7'),
                                      ),
                                    },
                                child: Text('Lokasi'))
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: () => {
                                      Navigator.pushReplacement(
                                        context,
                                        PageRouteBuilder(
                                          pageBuilder: (context, animation,
                                                  secondaryAnimation) =>
                                              VillaResto(),
                                          transitionsBuilder: (context,
                                              animation,
                                              secondaryAnimation,
                                              child) {
                                            return FadeTransition(
                                              opacity:
                                                  animation, // Menggunakan fade transition
                                              child: child,
                                            );
                                          },
                                          transitionDuration: Duration(
                                              milliseconds:
                                                  250), // Durasi transisi
                                        ),
                                      )
                                    },
                                child: Icon(Icons.arrow_forward_sharp)),
                          ],
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
      ),
    );
  }
}
