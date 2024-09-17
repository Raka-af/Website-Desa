import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/desktop/layout_screen.dart';
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
class DataJenisKelamin extends StatefulWidget {
  const DataJenisKelamin({super.key});

  @override
  State<DataJenisKelamin> createState() => _DataJenisKelaminState();
}

class _DataJenisKelaminState extends State<DataJenisKelamin> {
  final userCollection =
      FirebaseFirestore.instance.collection('data_jenis_kelamin');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(77, 77, 77, 77),
            borderRadius: BorderRadius.circular(20),
          ),
          width: 1214,
          height: 316,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 2,
                    width: 250,
                    color: Colors.black,
                    margin: EdgeInsets.only(top: 8),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(217, 217, 217, 217),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 202,
                        height: 210,

                        //Laki Laki
                        child: Column(
                          children: <Widget>[
                            Text(
                              data['nama'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            ),
                            Image(
                              image: AssetImage("Assets/Penduduk/cowo.png"),
                              width: 120,
                              height: 115,
                            ),
                            Text(
                              data['jumlah'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
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
                            var data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(217, 217, 217, 217),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 202,
                              height: 210,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    data['nama'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Image(
                                    image:
                                        AssetImage("Assets/Penduduk/cewe.png"),
                                    width: 120,
                                    height: 115,
                                  ),
                                  Text(
                                    data['jumlah'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
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

                      //Jumlah Penduduk
                      StreamBuilder(
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
                            width: 202,
                            height: 210,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  data['nama'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                                Image(
                                  image:
                                      AssetImage("Assets/Penduduk/Jumlah.png"),
                                  width: 120,
                                  height: 115,
                                ),
                                Text(
                                  data['jumlah'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 120,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
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

//Data Agama
class DataAgama extends StatefulWidget {
  const DataAgama({super.key});

  @override
  State<DataAgama> createState() => _DataAgamaState();
}

class _DataAgamaState extends State<DataAgama> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(77, 77, 77, 77),
            borderRadius: BorderRadius.circular(20),
          ),
          width: 1214,
          height: 316,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 2,
                      width: 250,
                      color: Colors.black,
                      margin: EdgeInsets.only(top: 8),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(217, 217, 217, 217),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 202,
                          height: 210,

                          //Agama Islam
                          child: Column(
                            children: <Widget>[
                              Text(
                                data['nama'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image(
                                image: AssetImage("Assets/Agama/Islam.png"),
                                width: 120,
                                height: 115,
                              ),
                              Text(
                                data['jumlah'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
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
                              return Center(child: CircularProgressIndicator());
                            }
                            var data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            return Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(217, 217, 217, 217),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 202,
                              height: 210,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    data['nama'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Image(
                                    image:
                                        AssetImage("Assets/Agama/Kristen.png"),
                                    width: 120,
                                    height: 115,
                                  ),
                                  Text(
                                    data['jumlah'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
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
                              width: 202,
                              height: 210,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    data['nama'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Image(
                                    image:
                                        AssetImage("Assets/Agama/Buddha.png"),
                                    width: 120,
                                    height: 115,
                                  ),
                                  Text(
                                    data['jumlah'],
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                                mainAxisAlignment: MainAxisAlignment.center,
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          width: 120,
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.end,
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
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(77, 77, 77, 77),
            borderRadius: BorderRadius.circular(20),
          ),
          width: 1214,
          height: 560,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
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
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  Container(
                    height: 2,
                    width: 250,
                    color: Colors.black,
                    margin: EdgeInsets.only(top: 8),
                  ),
                  //
                  Row(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(217, 217, 217, 217),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 202,
                        height: 210,

                        //TK/Paud
                        child: Column(
                          children: <Widget>[
                            Text(
                              data['nama'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            ),
                            Image(
                              image: AssetImage("Assets/Pendidikan/TK.png"),
                              width: 120,
                              height: 115,
                            ),
                            Text(
                              data['jumlah'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
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
                            width: 202,
                            height: 210,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  data['nama'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                                Image(
                                  image: AssetImage("Assets/Pendidikan/SD.png"),
                                  width: 120,
                                  height: 115,
                                ),
                                Text(
                                  data['jumlah'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
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
                            width: 202,
                            height: 210,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  data['nama'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                                Image(
                                  image:
                                      AssetImage("Assets/Pendidikan/SMP.png"),
                                  width: 120,
                                  height: 115,
                                ),
                                Text(
                                  data['jumlah'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        width: 120,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.end,
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  //SMA
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
                                width: 202,
                                height: 210,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      data['nama'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Image(
                                      image: AssetImage(
                                          "Assets/Pendidikan/SMA.png"),
                                      width: 120,
                                      height: 115,
                                    ),
                                    Text(
                                      data['jumlah'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
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
                              var data =
                                  snapshot.data!.data() as Map<String, dynamic>;
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(217, 217, 217, 217),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: 202,
                                height: 210,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      data['nama'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Image(
                                      image: AssetImage(
                                          "Assets/Pendidikan/S1.png"),
                                      width: 120,
                                      height: 115,
                                    ),
                                    Text(
                                      data['jumlah'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
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
                              var data =
                                  snapshot.data!.data() as Map<String, dynamic>;
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(217, 217, 217, 217),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                width: 202,
                                height: 210,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      data['nama'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Image(
                                      image: AssetImage(
                                          "Assets/Pendidikan/S2.png"),
                                      width: 120,
                                      height: 115,
                                    ),
                                    Text(
                                      data['jumlah'],
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 120,
                          ),
                        ],
                        mainAxisAlignment: MainAxisAlignment.end,
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
      color: Colors.black54,
      width: screenWidth * 1,
      height: screenHeight * 0.2,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: media.width * 0.02,
          ),
          Text(
            'Desa Margalaksana \n Jl. Kareumbi Desa Margalaksana Kec. Sumedang Selatan \n Kabuaten Sumedang Provinsi Jawa Barat \n Kode Pos 45311 \n Email:pemdesmargalaksana2013@gmail.com'
            '',
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
