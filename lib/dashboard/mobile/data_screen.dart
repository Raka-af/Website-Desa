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
                  .collection('data_penduduk')
                  .doc('Atw91p58rLoqyy0mes74')
                  .collection('data')
                  .doc('G2C9tQEBj2u4GXm7P9Iz')
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
                    StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('data_penduduk')
                          .doc('Atw91p58rLoqyy0mes74')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        if (!snapshot.hasData || snapshot.data == null) {
                          return Center(child: Text('Tidak ada data'));
                        }

                        var cat = snapshot.data!.data() as Map<String, dynamic>;
                        return Text(
                          cat['name_kategori'],
                          style: TextStyle(
                              fontSize:
                                  screenHeight * 0.013 + screenWidth * 0.013,
                              fontWeight: FontWeight.w500),
                        );
                      },
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
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(217, 217, 217, 217),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.2,
                          child: Column(
                            children: <Widget>[
                              Text(
                                data['nama2'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenHeight * 0.010 +
                                        screenWidth * 0.010,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image(
                                image: AssetImage("assets/Penduduk/cewe.png"),
                                width: screenWidth * 0.2,
                                height: screenHeight * 0.1,
                              ),
                              Text(
                                data['jumlah2'].toString(),
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

                        //Jumlah Penduduk
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(217, 217, 217, 217),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: screenWidth * 0.25,
                          height: screenHeight * 0.2,
                          child: Column(
                            children: <Widget>[
                              Text(
                                data['nama3'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: screenHeight * 0.010 +
                                        screenWidth * 0.010,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image(
                                image: AssetImage("assets/Penduduk/Jumlah.png"),
                                width: screenWidth * 0.2,
                                height: screenHeight * 0.1,
                              ),
                              Text(
                                data['jumlah3'].toString(),
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
                .collection('data_penduduk')
                .doc('k5SU05RILjaoAEOhfTcK')
                .collection('data')
                .doc('rOHL20U53f6Q81IWgfFh')
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
                  StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('data_penduduk')
                        .doc('k5SU05RILjaoAEOhfTcK')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data == null) {
                        return Center(child: Text('Tidak ada data'));
                      }

                      var cat = snapshot.data!.data() as Map<String, dynamic>;
                      return Text(
                        cat['name_kategori'],
                        style: TextStyle(
                            fontSize:
                                screenHeight * 0.013 + screenWidth * 0.013,
                            fontWeight: FontWeight.w500),
                      );
                    },
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
                              data['agama'],
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
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(217, 217, 217, 217),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.2,
                        child: Column(
                          children: <Widget>[
                            Text(
                              data['agama2'],
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
                              data['jumlah2'].toString(),
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

                      //Agama Buddha
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(217, 217, 217, 217),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.2,
                        child: Column(
                          children: <Widget>[
                            Text(
                              data['agama3'],
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
                              data['jumlah3'].toString(),
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
                .collection('data_penduduk')
                .doc('Qa8kQjKyRvQBwJXi8P7J')
                .collection('data')
                .doc('K7uyXP2cFjqHG2p7Lyls')
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
                  StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('data_penduduk')
                        .doc('Qa8kQjKyRvQBwJXi8P7J')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      if (!snapshot.hasData || snapshot.data == null) {
                        return Center(child: Text('Tidak ada data'));
                      }

                      var cat = snapshot.data!.data() as Map<String, dynamic>;
                      return Text(
                        cat['name_kategori'],
                        style: TextStyle(
                            fontSize:
                                screenHeight * 0.013 + screenWidth * 0.013,
                            fontWeight: FontWeight.w500),
                      );
                    },
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
                              data['pendidikan'],
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
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(217, 217, 217, 217),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.2,
                        child: Column(
                          children: <Widget>[
                            Text(
                              data['pendidikan2'],
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
                              data['jumlah2'].toString(),
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

                      //SMP
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(217, 217, 217, 217),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: screenWidth * 0.25,
                        height: screenHeight * 0.2,
                        child: Column(
                          children: <Widget>[
                            Text(
                              data['pendidikan3'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenHeight * 0.013 +
                                      screenWidth * 0.013,
                                  fontWeight: FontWeight.w500),
                            ),
                            Image(
                                image: AssetImage("assets/Pendidikan/Smp.png"),
                                width: screenWidth * 0.2,
                                height: screenHeight * 0.1),
                            Text(
                              data['jumlah3'].toString(),
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
                          Container(
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
                                  data['pendidikan4'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenHeight * 0.013 +
                                          screenWidth * 0.013,
                                      fontWeight: FontWeight.w500),
                                ),
                                Image(
                                    image:
                                        AssetImage("assets/Pendidikan/Sma.png"),
                                    width: screenWidth * 0.2,
                                    height: screenHeight * 0.1),
                                Text(
                                  data['jumlah4'].toString(),
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

                          //Sarjana
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(217, 217, 217, 217),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.2,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  data['pendidikan5'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenHeight * 0.013 +
                                          screenWidth * 0.013,
                                      fontWeight: FontWeight.w500),
                                ),
                                Image(
                                    image:
                                        AssetImage("assets/Pendidikan/S1.png"),
                                    width: screenWidth * 0.2,
                                    height: screenHeight * 0.1),
                                Text(
                                  data['jumlah5'].toString(),
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

                          //Magister
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(217, 217, 217, 217),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.2,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  data['pendidikan6'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: screenHeight * 0.013 +
                                          screenWidth * 0.013,
                                      fontWeight: FontWeight.w500),
                                ),
                                Image(
                                  image: AssetImage("assets/Pendidikan/S2.png"),
                                  width: screenWidth * 0.2,
                                  height: screenHeight * 0.1,
                                ),
                                Text(
                                  data['jumlah6'].toString(),
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
            'Desa Margalaksana \n Jl. Kareumbi Desa Margalaksana Kec. Sumedang Selatan \n Kabuaten Sumedang Provinsi Jawa Barat \n Kode Pos 45311 \n Email:',
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
                    Image(
                      image: AssetImage("assets/Desa/social.png"),
                      width: screenWidth * 0.045,
                      height: screenHeight * 0.045,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Image(
                      image: AssetImage("assets/Desa/facebook.png"),
                      width: screenWidth * 0.045,
                      height: screenHeight * 0.045,
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
