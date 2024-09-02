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
  final userCollection = FirebaseFirestore.instance.collection('data_penduduk');
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
                              fontSize: 24, fontWeight: FontWeight.w500),
                        );
                      },
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
                                data['jumlah'].toString(),
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
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(217, 217, 217, 217),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 202,
                          height: 210,
                          child: Column(
                            children: <Widget>[
                              Text(
                                data['nama2'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image(
                                image: AssetImage("Assets/Penduduk/cewe.png"),
                                width: 120,
                                height: 115,
                              ),
                              Text(
                                data['jumlah2'].toString(),
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

                        //Jumlah Penduduk
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(217, 217, 217, 217),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 202,
                          height: 210,
                          child: Column(
                            children: <Widget>[
                              Text(
                                data['nama3'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image(
                                image: AssetImage("Assets/Penduduk/Jumlah.png"),
                                width: 120,
                                height: 115,
                              ),
                              Text(
                                data['jumlah3'].toString(),
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

//Data Agama
class DataAgama extends StatelessWidget {
  const DataAgama({super.key});

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
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }

                          if (!snapshot.hasData || snapshot.data == null) {
                            return Center(child: Text('Tidak ada data'));
                          }

                          var cat =
                              snapshot.data!.data() as Map<String, dynamic>;
                          return Text(
                            cat['name_kategori'],
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500),
                          );
                        }),
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
                                data['agama'],
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
                                data['jumlah'].toString(),
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
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(217, 217, 217, 217),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 202,
                          height: 210,
                          child: Column(
                            children: <Widget>[
                              Text(
                                data['agama2'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image(
                                image: AssetImage("Assets/Agama/Kristen.png"),
                                width: 120,
                                height: 115,
                              ),
                              Text(
                                data['jumlah2'].toString(),
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

                        //Agama Buddha
                        Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(217, 217, 217, 217),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          width: 202,
                          height: 210,
                          child: Column(
                            children: <Widget>[
                              Text(
                                data['agama3'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w500),
                              ),
                              Image(
                                image: AssetImage("Assets/Agama/Buddha.png"),
                                width: 120,
                                height: 115,
                              ),
                              Text(
                                data['jumlah3'].toString(),
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
                              fontSize: 24, fontWeight: FontWeight.w500),
                        );
                      }),
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
                              data['pendidikan'],
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
                              data['jumlah'].toString(),
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
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(217, 217, 217, 217),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 202,
                        height: 210,
                        child: Column(
                          children: <Widget>[
                            Text(
                              data['pendidikan2'],
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
                              data['jumlah2'].toString(),
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

                      //SMP
                      Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(217, 217, 217, 217),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 202,
                        height: 210,
                        child: Column(
                          children: <Widget>[
                            Text(
                              data['pendidikan3'],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500),
                            ),
                            Image(
                              image: AssetImage("Assets/Pendidikan/SMP.png"),
                              width: 120,
                              height: 115,
                            ),
                            Text(
                              data['jumlah3'].toString(),
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
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(217, 217, 217, 217),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 202,
                            height: 210,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  data['pendidikan4'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                                Image(
                                  image:
                                      AssetImage("Assets/Pendidikan/SMA.png"),
                                  width: 120,
                                  height: 115,
                                ),
                                Text(
                                  data['jumlah4'].toString(),
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

                          //Sarjana
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(217, 217, 217, 217),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 202,
                            height: 210,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  data['pendidikan5'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                                Image(
                                  image: AssetImage("Assets/Pendidikan/S1.png"),
                                  width: 120,
                                  height: 115,
                                ),
                                Text(
                                  data['jumlah5'].toString(),
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

                          //Magister
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(217, 217, 217, 217),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 202,
                            height: 210,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  data['pendidikan6'],
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                                Image(
                                  image: AssetImage("Assets/Pendidikan/S2.png"),
                                  width: 120,
                                  height: 115,
                                ),
                                Text(
                                  data['jumlah6'].toString(),
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
            'Desa Margalaksana \n Jl. Kareumbi Desa Margalaksana Kec. Sumedang Selatan \n Kabuaten Sumedang Provinsi Jawa Barat \n Kode Pos 45311 \n Email:',
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
