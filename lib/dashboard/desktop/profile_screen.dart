import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/desktop/data_screen.dart';
import 'package:website_desa/dashboard/desktop/home_screen.dart';
import 'package:website_desa/dashboard/desktop/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required int selectedIndex});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    var media = MediaQuery.of(context).size;
    return LayoutScreen(
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 20),
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage("assets/Desa/Logo.jpg"),
                  width: screenWidth * 0.17,
                  height: screenHeight * 0.17,
                ),
                Text(
                  ' Desa Margalaksana',
                  style: TextStyle(
                    fontSize: screenHeight * 0.015 + screenWidth * 0.015,
                    fontFamily: 'Montserrat',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Visi',
                  style: TextStyle(
                    fontSize: screenHeight * 0.015 + screenWidth * 0.015,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  'GEULIS'
                  '\n (Gandang, Efektif dan Efisien, Unggul, Linuhung, Inovatif, Sejahtera)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: screenHeight * 0.011 + screenWidth * 0.012,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Misi',
                  style: TextStyle(
                    fontSize: screenHeight * 0.015 + screenWidth * 0.015,
                    fontFamily: 'Montserrat',
                  ),
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
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          'Sejarah Desa Margalaksana',
                          style: TextStyle(
                              fontSize:
                                  screenHeight * 0.015 + screenWidth * 0.015,
                              fontFamily: 'Montserrat'),
                        ),
                        Text(
                          'Berdasarkan sejarahnya, Desa Margalaksana merupakan'
                          '\nsebuah desa pemekaran. Sebelum menjadi desa yang mandiri,'
                          '\nDesa Margalaksana merupakan bagian wilayah Kelurahan'
                          '\nPasanggrahan bersama dengan Desa Mekar Rahayu dan'
                          '\nKelurahan Pasanggrahan Baru. Pemekaran wilayah Kelurahan'
                          '\nPasanggrahan ini berdasarkan pada Peraturan Daerah Kabupaten'
                          '\nSumedang No. 10 Tahun 2018 tentang Penghapusan Kelurahan'
                          '\nPasanggrahan, Pembentukan Kelurahan Pasanggrahan Baru,'
                          '\nDesa Margalaksana dan Desa Mekar Rahayu. Perda ini ditetapkan'
                          '\npada 14 Agustus 2008 dan ditandatangani langsung oleh Bupati'
                          '\nKabupaten Sumedang yang menjabat saat itu.\n',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize:
                                  screenHeight * 0.01 + screenWidth * 0.01,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    (MediaQuery.of(context).size.width > 800)
                        ? SizedBox(width: screenWidth * 0.1)
                        : SizedBox(width: screenWidth * 0.02),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image(
                        image: AssetImage("assets/Desa/Margalaksana.jpg"),
                        width: screenWidth * 0.35,
                        height: screenHeight * 0.4,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          'Peta Desa Margalaksana',
                          style:
                              TextStyle(fontSize: 32, fontFamily: 'Montserrat'),
                        ),
                        InkWell(
                          onTap: () => {
                            launchUrl(Uri.parse(
                                'https://maps.app.goo.gl/2kgwu2MBpEym6sY56'))
                          },
                          child: Image(
                            image: AssetImage("assets/Desa/Maps.jpg"),
                            width: 473,
                            height: 402,
                          ),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'Secara geografis  Desa Margalaksana  mempunyai \n'
                      'batas batas willayah:\n'
                      'a. Sebelah Utara berbatasan dengan Kelurahan Pasanggrahan Baru\n'
                      'b. Sebelah Timur berbatasan dengan Desa Sukajaya\n'
                      'c. Sebelah Selatan berbatasan dengan Tanah Kehutanan\n'
                      'd. Sebelah Barat berbatasan dengan Desa Mekar Rahayu\n'
                      'Luas wilayah: 508,17 hektar',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
          ),
          Footer(),
        ],
      ),
      selectedIndex: 1,
    );
  }
}
