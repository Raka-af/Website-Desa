import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/mobile/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class StructureScreen extends StatelessWidget {
  const StructureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      showBackButton: false,
      body: Column(
        children: [
          OrganizationChart(),
          Footer(),
        ],
      ),
    );
  }
}

// Struktur Organisasi
class OrganizationChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Struktur Organisasi\nPeriode 2022 - 2028',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            Container(
              height: 2,
              width: 150,
              color: Colors.black,
              margin: EdgeInsets.only(top: 8),
            ),
            SizedBox(height: 30),
            Center(
              child: OrganizationBox(
                title: 'Euis Mulyati',
                title2: 'Kepala Desa',
                imagePath: 'assets/Struktur/Kepala Desa.jpg',
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OrganizationBox(
                  title: 'Jujun Junaedi',
                  title2: 'Sekretaris Desa',
                  imagePath: 'assets/Struktur/Sekertaris.jpg',
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    // Padding(padding: EdgeInsets.all(15)),
                    OrganizationBox(
                      title: 'Kusnadi',
                      title2: 'Kasi Pemerintahan',
                      imagePath: 'assets/Struktur/Kasi Pemerintahan.jpg',
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    OrganizationBox(
                      title: 'Silvi Desiyanti',
                      title2: 'Kasi Pelayanan',
                      imagePath: 'assets/Struktur/Kasi Pelayanan.jpg',
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    OrganizationBox(
                      title: 'Neng Neli Helmiawati',
                      title2: 'Kasi Kesejahteraan',
                      imagePath: 'assets/Struktur/Kasi Kesejahteraan.jpg',
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    // Padding(padding: EdgeInsets.all(15)),
                    OrganizationBox(
                      title: 'Mulyana',
                      title2: 'Kasi Perencanaan',
                      imagePath: 'assets/Struktur/Kaur Perencanaan.jpg',
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    OrganizationBox(
                      title: 'Sinta Puspitasari',
                      title2: 'Kaur Keuangan',
                      imagePath: 'assets/Struktur/Kaur Keuangan.jpg',
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    OrganizationBox(
                      title: 'Enang Mulyana',
                      title2: 'Kaur TU dan Umum',
                      imagePath: 'assets/Struktur/Kaur TU dan Umum.jpg',
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OrganizationBox(
                  title: 'Chotibul Fajar',
                  title2: 'Kadus 1',
                  imagePath: 'assets/Struktur/Kadus 1.jpg',
                ),
                OrganizationBox(
                  title: 'Sugirman',
                  title2: 'Kadus 2',
                  imagePath: 'assets/Struktur/Kadus 2.jpg',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Organization Box
class OrganizationBox extends StatelessWidget {
  final String title;
  final String title2;
  final String imagePath;

  OrganizationBox(
      {required this.title, required this.title2, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath), // Menggunakan gambar dari aset
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 2),
          ),
        ),
        SizedBox(height: 4), // Jarak antara gambar dan teks
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Text(
          title2,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 10,
          ),
        ),
      ],
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
