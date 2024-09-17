import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/tablet/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      body: Column(
        children: <Widget>[
          DataJenisKelamin(),
          DataAgama(),
          DataPendidikan(),
          Footer(),
        ],
      ),
    );
  }
}

//Data Jenis Kelamin
class DataJenisKelamin extends StatelessWidget {
  const DataJenisKelamin({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(77, 77, 77, 77),
            borderRadius: BorderRadius.circular(20),
          ),
          width: screenWidth * 0.8,
          height: screenHeight * 0.5,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('data_jenis_kelamin')
                  .doc('2')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data == null) {
                  return Center(child: Text('Tidak ada data'));
                }

                var data = snapshot.data!.data() as Map<String, dynamic>;
                return Column(
                  children: <Widget>[
                    Text(
                      "Data Jenis Kelamin",
                      style: TextStyle(
                          fontSize: screenHeight * 0.015 + screenWidth * 0.015,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: screenHeight * 0.003,
                      width: screenWidth * 0.25,
                      color: Colors.black,
                      margin: EdgeInsets.only(top: 8),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(217, 217, 217, 217),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.3,

                          //Laki Laki
                          child: Column(
                            children: <Widget>[
                              Text(
                                data['nama'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenHeight * 0.015 +
                                        screenWidth * 0.015,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image(
                                image: AssetImage("Assets/Penduduk/cowo.png"),
                                width: screenWidth * 0.15,
                                height: screenHeight * 0.15,
                              ),
                              Text(
                                data['jumlah'].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenHeight * 0.015 +
                                        screenWidth * 0.015,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),

                        //Perempuan
                        StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('data_jenis_kelamin')
                              .doc('1')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }

                            if (!snapshot.hasData || snapshot.data == null) {
                              return Center(child: Text('Tidak ada data'));
                            }

                            var data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(217, 217, 217, 217),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: screenWidth * 0.2,
                              height: screenHeight * 0.3,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    data['nama'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenHeight * 0.015 +
                                            screenWidth * 0.015,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Image(
                                    image:
                                        AssetImage("Assets/Penduduk/cewe.png"),
                                    width: screenWidth * 0.15,
                                    height: screenHeight * 0.15,
                                  ),
                                  Text(
                                    data['jumlah'].toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenHeight * 0.015 +
                                            screenWidth * 0.015,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 30,
                        ),

                        //Jumlah Penduduk
                        StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('data_jenis_kelamin')
                              .doc('3')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }

                            if (!snapshot.hasData || snapshot.data == null) {
                              return Center(child: Text('Tidak ada data'));
                            }

                            var data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(217, 217, 217, 217),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: screenWidth * 0.2,
                              height: screenHeight * 0.3,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    data['nama'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenHeight * 0.015 +
                                            screenWidth * 0.015,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Image(
                                    image: AssetImage(
                                        "Assets/Penduduk/Jumlah.png"),
                                    width: screenWidth * 0.15,
                                    height: screenHeight * 0.15,
                                  ),
                                  Text(
                                    data['jumlah'].toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenHeight * 0.015 +
                                            screenWidth * 0.015,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            );
                          },
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                );
              }),
        ),
      ),
    );
  }
}

//Data Agama
class DataAgama extends StatelessWidget {
  const DataAgama({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(77, 77, 77, 77),
            borderRadius: BorderRadius.circular(20),
          ),
          width: screenWidth * 0.8,
          height: screenHeight * 0.5,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('data_agama')
                  .doc('1')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var data = snapshot.data!.data() as Map<String, dynamic>;
                return Column(
                  children: <Widget>[
                    Text(
                      "Data Agama",
                      style: TextStyle(
                          fontSize: screenHeight * 0.015 + screenWidth * 0.015,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: screenHeight * 0.003,
                      width: screenWidth * 0.25,
                      color: Colors.black,
                      margin: EdgeInsets.only(top: 8),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(217, 217, 217, 217),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.3,

                          //Agama Islam
                          child: Column(
                            children: <Widget>[
                              Text(
                                data['nama'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenHeight * 0.015 +
                                        screenWidth * 0.015,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image(
                                image: AssetImage("Assets/Agama/Islam.png"),
                                width: screenWidth * 0.15,
                                height: screenHeight * 0.15,
                              ),
                              Text(
                                data['jumlah'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenHeight * 0.015 +
                                        screenWidth * 0.015,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),

                        //Agama Kristen
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('data_agama')
                                .doc('2')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }

                              var data =
                                  snapshot.data!.data() as Map<String, dynamic>;
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(217, 217, 217, 217),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: screenWidth * 0.2,
                                height: screenHeight * 0.3,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      data['nama'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenHeight * 0.015 +
                                              screenWidth * 0.015,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Image(
                                      image: AssetImage(
                                          "Assets/Agama/Kristen.png"),
                                      width: screenWidth * 0.15,
                                      height: screenHeight * 0.15,
                                    ),
                                    Text(
                                      data['jumlah'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenHeight * 0.015 +
                                              screenWidth * 0.015,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              );
                            }),
                        SizedBox(
                          width: 30,
                        ),

                        //Agama Buddha
                        StreamBuilder<DocumentSnapshot>(
                            stream: FirebaseFirestore.instance
                                .collection('data_agama')
                                .doc('3')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }

                              var data =
                                  snapshot.data!.data() as Map<String, dynamic>;
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(217, 217, 217, 217),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: screenWidth * 0.2,
                                height: screenHeight * 0.3,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      data['nama'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenHeight * 0.015 +
                                              screenWidth * 0.015,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Image(
                                      image:
                                          AssetImage("Assets/Agama/Buddha.png"),
                                      width: screenWidth * 0.15,
                                      height: screenHeight * 0.15,
                                    ),
                                    Text(
                                      data['jumlah'].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenHeight * 0.015 +
                                              screenWidth * 0.015,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              );
                            }),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                );
              }),
        ),
      ),
    );
  }
}

//Data Pendidikan
class DataPendidikan extends StatelessWidget {
  const DataPendidikan({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 1,
      height: screenHeight * 0.95,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(77, 77, 77, 77),
            borderRadius: BorderRadius.circular(20),
          ),
          width: screenWidth * 0.8,
          height: screenHeight * 0.95,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('data_pendidikan')
                  .doc('1')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var data = snapshot.data!.data() as Map<String, dynamic>;
                return Column(
                  children: <Widget>[
                    Text(
                      "Data Pendidikan",
                      style: TextStyle(
                          fontSize: screenHeight * 0.015 + screenWidth * 0.015,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: screenHeight * 0.003,
                      width: screenWidth * 0.25,
                      color: Colors.black,
                      margin: EdgeInsets.only(top: 8),
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(217, 217, 217, 217),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: screenWidth * 0.2,
                          height: screenHeight * 0.3,

                          //TK/Paud
                          child: Column(
                            children: <Widget>[
                              Text(
                                data['nama'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenHeight * 0.015 +
                                        screenWidth * 0.015,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image(
                                image: AssetImage("Assets/Pendidikan/TK.png"),
                                width: screenWidth * 0.15,
                                height: screenHeight * 0.15,
                              ),
                              Text(
                                data['jumlah'].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenHeight * 0.015 +
                                        screenWidth * 0.015,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),

                        //SD
                        StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('data_pendidikan')
                              .doc('2')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }
                            var data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(217, 217, 217, 217),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: screenWidth * 0.2,
                              height: screenHeight * 0.3,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    data['nama'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenHeight * 0.015 +
                                            screenWidth * 0.015,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Image(
                                    image:
                                        AssetImage("Assets/Pendidikan/SD.png"),
                                    width: screenWidth * 0.15,
                                    height: screenHeight * 0.15,
                                  ),
                                  Text(
                                    data['jumlah'].toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenHeight * 0.015 +
                                            screenWidth * 0.015,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 30,
                        ),

                        //SMP
                        StreamBuilder<DocumentSnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('data_pendidikan')
                              .doc('3')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }
                            var data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(217, 217, 217, 217),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: screenWidth * 0.2,
                              height: screenHeight * 0.3,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    data['nama'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenHeight * 0.015 +
                                            screenWidth * 0.015,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Image(
                                    image:
                                        AssetImage("Assets/Pendidikan/SMP.png"),
                                    width: screenWidth * 0.15,
                                    height: screenHeight * 0.15,
                                  ),
                                  Text(
                                    data['jumlah'].toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenHeight * 0.015 +
                                            screenWidth * 0.015,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            );
                          },
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('data_pendidikan')
                                  .doc('4')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                var data = snapshot.data!.data()
                                    as Map<String, dynamic>;
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(217, 217, 217, 217),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.3,

                                  //SMA
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        data['nama'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenHeight * 0.015 +
                                                screenWidth * 0.015,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Image(
                                        image: AssetImage(
                                            "Assets/Pendidikan/SMA.png"),
                                        width: screenWidth * 0.15,
                                        height: screenHeight * 0.15,
                                      ),
                                      Text(
                                        data['jumlah'].toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenHeight * 0.015 +
                                                screenWidth * 0.015,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              width: 30,
                            ),

                            //Sarjana
                            StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection('data_pendidikan')
                                  .doc('5')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                var data = snapshot.data!.data()
                                    as Map<String, dynamic>;
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(217, 217, 217, 217),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.3,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        data['nama'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenHeight * 0.015 +
                                                screenWidth * 0.015,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Image(
                                        image: AssetImage(
                                            "Assets/Pendidikan/S1.png"),
                                        width: screenWidth * 0.15,
                                        height: screenHeight * 0.15,
                                      ),
                                      Text(
                                        data['jumlah'].toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenHeight * 0.015 +
                                                screenWidth * 0.015,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              width: 30,
                            ),

                            //Magister
                            StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection('data_pendidikan')
                                  .doc('6')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                                var data = snapshot.data!.data()
                                    as Map<String, dynamic>;
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(217, 217, 217, 217),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.3,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        data['nama'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenHeight * 0.015 +
                                                screenWidth * 0.015,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Image(
                                        image: AssetImage(
                                            "Assets/Pendidikan/S2.png"),
                                        width: screenWidth * 0.15,
                                        height: screenHeight * 0.15,
                                      ),
                                      Text(
                                        data['jumlah'].toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: screenHeight * 0.015 +
                                                screenWidth * 0.015,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                );
                              },
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ],
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                );
              }),
        ),
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
