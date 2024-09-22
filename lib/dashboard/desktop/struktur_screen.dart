import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/desktop/home_screen.dart';
import 'package:website_desa/dashboard/desktop/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class StructureScreen extends StatelessWidget {
  const StructureScreen({super.key, required int selectedIndex});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      body: Column(
        children: [
          OrganizationChart(),
          Footer(),
        ],
      ),
      selectedIndex: 3,
    );
  }
}

class OrganizationChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Struktur Organisasi Periode 2022 - 2028',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          Container(
            height: 2,
            width: 450,
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
          Center(
            child: CustomPaint(
              size: Size(2, 50), // Panjang garis dari Kepala Desa ke Sekretaris
              painter: LinePainter(),
            ),
          ),
          Center(
            child: OrganizationBox(
              title: 'Jujun Junaedi',
              title2: 'Sekretaris Desa',
              imagePath: 'assets/Struktur/Sekertaris.jpg',
            ),
          ),
          Center(
            child: CustomPaint(
              size: Size(2, 50), // Panjang garis dari Sekretaris ke Kadus
              painter: LinePainter(),
            ),
          ),
          Stack(
            children: [
              Center(
                child: CustomPaint(
                  size: Size(2, 300), // Panjang garis dari Sekretaris ke kadus
                  painter: LinePainter(),
                ),
              ),
              Center(
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width * 0.75,
                      2), // Garis horizontal dari Sekretaris ke Kasi
                  painter: HorizontalLinePainter(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Center(
                        child: CustomPaint(
                          size: Size(2, 50),
                          painter: LinePainter(),
                        ),
                      ),
                      OrganizationBox(
                        title: 'Kusnadi',
                        title2: 'Kasi Pemerintahan',
                        imagePath: 'assets/Struktur/Kasi Pemerintahan.jpg',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: CustomPaint(
                          size: Size(2, 50),
                          painter: LinePainter(),
                        ),
                      ),
                      OrganizationBox(
                        title: 'Silvi Desiyanti',
                        title2: 'Kasi Pelayanan',
                        imagePath: 'assets/Struktur/Kasi Pelayanan.jpg',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: CustomPaint(
                          size: Size(2, 50),
                          painter: LinePainter(),
                        ),
                      ),
                      OrganizationBox(
                        title: 'Neng Neli Helmiawati',
                        title2: 'Kasi Kesejahteraan',
                        imagePath: 'assets/Struktur/Kasi Kesejahteraan.jpg',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: CustomPaint(
                          size: Size(2, 50),
                          painter: LinePainter(),
                        ),
                      ),
                      OrganizationBox(
                        title: 'Mulyana',
                        title2: 'Kaur Perencanaan',
                        imagePath: 'assets/Struktur/Kaur Perencanaan.jpg',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: CustomPaint(
                          size: Size(2, 50),
                          painter: LinePainter(),
                        ),
                      ),
                      OrganizationBox(
                        title: 'Sinta Puspitasari',
                        title2: 'Kaur Keuangan',
                        imagePath: 'assets/Struktur/Kaur Keuangan.jpg',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Center(
                        child: CustomPaint(
                          size: Size(2, 50),
                          painter: LinePainter(),
                        ),
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
            ],
          ),
          Center(
            child: CustomPaint(
              size: Size(MediaQuery.of(context).size.width * 0.35,
                  2), // Garis horizontal dari Sekretaris ke Kasi
              painter: HorizontalLinePainter(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Center(
                    child: CustomPaint(
                      size: Size(2, 50),
                      painter: LinePainter(),
                    ),
                  ),
                  OrganizationBox(
                    title: 'Chotibul Fajar',
                    title2: 'Kadus 1',
                    imagePath: 'assets/Struktur/Kadus 1.jpg',
                  ),
                ],
              ),
              Column(
                children: [
                  Center(
                    child: CustomPaint(
                      size: Size(2, 50),
                      painter: LinePainter(),
                    ),
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
        ],
      ),
    );
  }
}

// Painter untuk menggambar garis vertikal
class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    canvas.drawLine(
        Offset(0, 0), Offset(0, size.height), paint); // Garis vertikal
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Painter untuk menggambar garis horizontal
class HorizontalLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    canvas.drawLine(
        Offset(0, 0), Offset(size.width, 0), paint); // Garis horizontal
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

// Organization Box
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
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 2),
          ),
        ),
        SizedBox(height: 4),
        Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        Text(
          title2,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
