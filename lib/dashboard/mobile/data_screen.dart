import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/mobile/layout_screen.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(77, 77, 77, 77),
            borderRadius: BorderRadius.circular(20),
          ),
          width: screenWidth * 0.9,
          height: screenHeight * 0.3,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: StreamBuilder<DocumentSnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('data_jenis_kelamin')
                  .doc('2')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var data = snapshot.data!.data() as Map<String, dynamic>;
                return Column(
                  children: <Widget>[
                    Text(
                      "Data Jenis Kelamin",
                      style: TextStyle(
                          fontSize: screenHeight * 0.013 + screenWidth * 0.013,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: screenHeight * 0.003,
                      width: screenWidth * 0.25,
                      color: Colors.black,
                      margin: EdgeInsets.only(top: 8),
                    ),
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(217, 217, 217, 217),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.2,

                          //Laki Laki
                          child: Column(
                            children: <Widget>[
                              Text(
                                data['nama'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenHeight * 0.010 +
                                        screenWidth * 0.010,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image(
                                image: AssetImage("assets/Penduduk/cowo.png"),
                                width: screenWidth * 0.2,
                                height: screenHeight * 0.1,
                              ),
                              Text(
                                data['jumlah'].toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenHeight * 0.010 +
                                        screenWidth * 0.010,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                        SizedBox(
                          width: 10,
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
                            var data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(217, 217, 217, 217),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: screenWidth * 0.25,
                              height: screenHeight * 0.2,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    data['nama'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenHeight * 0.010 +
                                            screenWidth * 0.010,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Image(
                                    image:
                                        AssetImage("assets/Penduduk/cewe.png"),
                                    width: screenWidth * 0.2,
                                    height: screenHeight * 0.1,
                                  ),
                                  Text(
                                    data['jumlah'].toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenHeight * 0.010 +
                                            screenWidth * 0.010,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 10,
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
                            var data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(217, 217, 217, 217),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: screenWidth * 0.25,
                              height: screenHeight * 0.2,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    data['nama'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenHeight * 0.010 +
                                            screenWidth * 0.010,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Image(
                                    image: AssetImage(
                                        "assets/Penduduk/Jumlah.png"),
                                    width: screenWidth * 0.2,
                                    height: screenHeight * 0.1,
                                  ),
                                  Text(
                                    data['jumlah'].toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenHeight * 0.010 +
                                            screenWidth * 0.010,
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
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(77, 77, 77, 77),
            borderRadius: BorderRadius.circular(20),
          ),
          width: screenWidth * 0.9,
          height: screenHeight * 0.3,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                        fontSize: screenHeight * 0.013 + screenWidth * 0.013,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: screenHeight * 0.003,
                    width: screenWidth * 0.25,
                    color: Colors.black,
                    margin: EdgeInsets.only(top: 8),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(217, 217, 217, 217),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.2,

                        //Agama Islam
                        child: Column(
                          children: <Widget>[
                            Text(
                              data['nama'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenHeight * 0.013 +
                                      screenWidth * 0.013,
                                  fontWeight: FontWeight.w500),
                            ),
                            Image(
                              image: AssetImage("assets/Agama/Islam.png"),
                              width: screenWidth * 0.2,
                              height: screenHeight * 0.1,
                            ),
                            Text(
                              data['jumlah'].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenHeight * 0.013 +
                                      screenWidth * 0.013,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                      SizedBox(
                        width: 10,
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
                            return Center(child: CircularProgressIndicator());
                          }
                          var data =
                              snapshot.data!.data() as Map<String, dynamic>;
                          return Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(217, 217, 217, 217),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.2,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  data['nama'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenHeight * 0.013 +
                                          screenWidth * 0.013,
                                      fontWeight: FontWeight.w500),
                                ),
                                Image(
                                  image: AssetImage("assets/Agama/Kristen.png"),
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.1,
                                ),
                                Text(
                                  data['jumlah'].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenHeight * 0.013 +
                                          screenWidth * 0.013,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 10,
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
                            return Center(child: CircularProgressIndicator());
                          }
                          var data =
                              snapshot.data!.data() as Map<String, dynamic>;
                          return Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(217, 217, 217, 217),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.2,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  data['nama'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenHeight * 0.013 +
                                          screenWidth * 0.013,
                                      fontWeight: FontWeight.w500),
                                ),
                                Image(
                                  image: AssetImage("assets/Agama/Buddha.png"),
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.1,
                                ),
                                Text(
                                  data['jumlah'].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenHeight * 0.013 +
                                          screenWidth * 0.013,
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
            },
          ),
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
      height: screenHeight * 0.60,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(77, 77, 77, 77),
            borderRadius: BorderRadius.circular(20),
          ),
          width: screenWidth * 0.9,
          height: screenHeight * 0.55,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                        fontSize: screenHeight * 0.013 + screenWidth * 0.013,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: screenHeight * 0.003,
                    width: screenWidth * 0.25,
                    color: Colors.black,
                    margin: EdgeInsets.only(top: 8),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(217, 217, 217, 217),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.2,

                        //TK/Paud
                        child: Column(
                          children: <Widget>[
                            Text(
                              data['nama'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenHeight * 0.013 +
                                      screenWidth * 0.013,
                                  fontWeight: FontWeight.w500),
                            ),
                            Image(
                              image: AssetImage("assets/Pendidikan/Tk.png"),
                              width: screenWidth * 0.2,
                              height: screenHeight * 0.1,
                            ),
                            Text(
                              data['jumlah'].toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenHeight * 0.013 +
                                      screenWidth * 0.013,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                      SizedBox(
                        width: 10,
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
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.2,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  data['nama'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenHeight * 0.013 +
                                          screenWidth * 0.013,
                                      fontWeight: FontWeight.w500),
                                ),
                                Image(
                                  image: AssetImage("assets/Pendidikan/Sd.png"),
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.1,
                                ),
                                Text(
                                  data['jumlah'].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenHeight * 0.013 +
                                          screenWidth * 0.013,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 10,
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
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.2,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  data['nama'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenHeight * 0.013 +
                                          screenWidth * 0.013,
                                      fontWeight: FontWeight.w500),
                                ),
                                Image(
                                    image:
                                        AssetImage("assets/Pendidikan/Smp.png"),
                                    width: screenWidth * 0.2,
                                    height: screenHeight * 0.1),
                                Text(
                                  data['jumlah'].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenHeight * 0.013 +
                                          screenWidth * 0.013,
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
                              var data =
                                  snapshot.data!.data() as Map<String, dynamic>;
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(217, 217, 217, 217),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: screenWidth * 0.25,
                                height: screenHeight * 0.2,

                                //SMA
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      data['nama'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenHeight * 0.013 +
                                              screenWidth * 0.013,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Image(
                                        image: AssetImage(
                                            "assets/Pendidikan/Sma.png"),
                                        width: screenWidth * 0.2,
                                        height: screenHeight * 0.1),
                                    Text(
                                      data['jumlah'].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenHeight * 0.013 +
                                              screenWidth * 0.013,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),

                          //Sarjana
                          StreamBuilder(
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
                              var data =
                                  snapshot.data!.data() as Map<String, dynamic>;
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(217, 217, 217, 217),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: screenWidth * 0.25,
                                height: screenHeight * 0.2,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      data['nama'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenHeight * 0.013 +
                                              screenWidth * 0.013,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Image(
                                        image: AssetImage(
                                            "assets/Pendidikan/S1.png"),
                                        width: screenWidth * 0.2,
                                        height: screenHeight * 0.1),
                                    Text(
                                      data['jumlah'].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenHeight * 0.013 +
                                              screenWidth * 0.013,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),

                          //Magister
                          StreamBuilder<DocumentSnapshot>(
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
                              var data =
                                  snapshot.data!.data() as Map<String, dynamic>;
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(217, 217, 217, 217),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: screenWidth * 0.25,
                                height: screenHeight * 0.2,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      data['nama'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenHeight * 0.013 +
                                              screenWidth * 0.013,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Image(
                                      image: AssetImage(
                                          "assets/Pendidikan/S2.png"),
                                      width: screenWidth * 0.2,
                                      height: screenHeight * 0.1,
                                    ),
                                    Text(
                                      data['jumlah'].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenHeight * 0.013 +
                                              screenWidth * 0.013,
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
            },
          ),
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
