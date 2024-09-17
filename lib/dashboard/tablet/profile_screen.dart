import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/tablet/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      body: Column(
        children: <Widget>[
          VisiMisi(),
          Sejarah(),
          Maps(),
          Footer(),
        ],
      ),
    );
  }
}

//Visi Misi
class VisiMisi extends StatelessWidget {
  const VisiMisi({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      width: screenWidth / 1,
      height: screenHeight / 1.1,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        children: <Widget>[
          Image(
            image: AssetImage("assets/Desa/Logo.jpg"),
            width: screenWidth * 0.17,
            height: screenHeight * 0.17,
          ),
          Text(
            'Desa Margalaksana',
            style: TextStyle(
                fontSize: screenHeight * 0.015 + screenWidth * 0.015,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Visi',
            style: TextStyle(
                fontSize: screenHeight * 0.015 + screenWidth * 0.015,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'GEULIS'
            '\n (Gandang, Efektif dan Efisien, Unggul, Linuhung, Inovatif, Sejahtera)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenHeight * 0.013 + screenWidth * 0.013,
              fontWeight: FontWeight.w100,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Misi',
            style: TextStyle(
                fontSize: screenHeight * 0.015 + screenWidth * 0.015,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '1. Mewujudkan kehidupan beragama dan berbudaya yang bertoleransi dan saling menghormati'
            '\n 2. Terwujudnya Masyarakat yang sejahtera dengan perekonomian mandiri dengan meningkatkan ekonomi kerakyatan dan pariwisata berbasis ekonomi kreatif'
            '\n 3. Mewujudkan tata kelola desa yang transparan, demokratis dan cepat tanggap dalam menampung aspirasi masyarakat'
            '\n 4. Meningkatkan kesehatan, kebersihan Desa serta Mengusahakan Jaminan Kesehatan Masyarakat Melalui Program Pemerintah'
            '\n 5. Mewujudkan masyarakat yang taat hukum berdasar pada UUD 1945 dan Pansasila',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenHeight * 0.012 + screenWidth * 0.012,
              fontWeight: FontWeight.w100,
            ),
          ),
        ],
      ),
    );
  }
}

//Sejarah
class Sejarah extends StatelessWidget {
  const Sejarah({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var media = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(30),
      color: Colors.white,
      width: screenWidth / 1,
      height: screenHeight / 1.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Sejarah Desa Margalaksana',
            style: TextStyle(
                fontSize: screenHeight * 0.015 + screenWidth * 0.015,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: media.height * 0.02,
          ),
          Center(
            child: Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  image: AssetImage("assets/Desa/Margalaksana.jpg"),
                  width: screenWidth * 0.35,
                  height: screenHeight * 0.20,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: media.height * 0.02,
          ),
          Text(
            'Berdasarkan sejarahnya, Desa Margalaksana merupakan'
            'sebuah desa pemekaran. Sebelum menjadi desa yang mandiri,'
            'Desa Margalaksana merupakan bagian wilayah Kelurahan'
            'Pasanggrahan bersama dengan Desa Mekar Rahayu dan'
            'Kelurahan Pasanggrahan Baru. Pemekaran wilayah Kelurahan'
            'Pasanggrahan ini berdasarkan pada Peraturan Daerah Kabupaten'
            'Sumedang No. 10 Tahun 2018 tentang Penghapusan Kelurahan'
            'Pasanggrahan, Pembentukan Kelurahan Pasanggrahan Baru,'
            'Desa Margalaksana dan Desa Mekar Rahayu. Perda ini ditetapkan'
            'pada 14 Agustus 2008 dan ditandatangani langsung oleh Bupati'
            'Kabupaten Sumedang yang menjabat saat itu.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: screenHeight * 0.01 + screenWidth * 0.01,
                fontWeight: FontWeight.w300),
          ),
          (MediaQuery.of(context).size.width > 800)
              ? SizedBox(width: screenWidth * 0.1)
              : SizedBox(width: screenWidth * 0.02),
        ],
      ),
    );
  }
}

//Maps
class Maps extends StatelessWidget {
  const Maps({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var media = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: 1500,
      height: 600,
      child: Column(
        children: <Widget>[
          Text(
            'Peta Desa Margalaksana',
            style: TextStyle(
                fontSize: screenHeight * 0.015 + screenWidth * 0.015,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: media.height * 0.02,
          ),
          InkWell(
            onTap: () => {
              launchUrl(Uri.parse('https://maps.app.goo.gl/2kgwu2MBpEym6sY56'))
            },
            child: Image(
              image: AssetImage("assets/Desa/maps.png"),
              width: screenWidth * 0.5,
              height: screenHeight * 0.6,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: media.height * 0.02,
          ),
          Text(
            'Secara geografis  Desa Margalaksana  mempunyai '
            'batas batas willayah:\n'
            'a. Sebelah Utara berbatasan dengan Kelurahan Pasanggrahan Baru\n'
            'b. Sebelah Timur berbatasan dengan Desa Sukajaya\n'
            'c. Sebelah Selatan berbatasan dengan Tanah Kehutanan\n'
            'd. Sebelah Barat berbatasan dengan Desa Mekar Rahayu\n'
            'Luas wilayah: 508,17 hektar',
            style: TextStyle(
                fontSize: screenHeight * 0.01 + screenWidth * 0.01,
                fontWeight: FontWeight.w500),
          )
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
