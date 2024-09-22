import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/desktop/home_screen.dart';
import 'package:website_desa/dashboard/desktop/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key, required int selectedIndex});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      // showBackButton: false,
      body: Column(
        children: <Widget>[
          DataJenisKelamin(),
          DataAgama(),
          DataPendidikan(),
          Footer(),
        ],
      ),
      selectedIndex: 2,
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
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 30),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(77, 77, 77, 77),
            borderRadius: BorderRadius.circular(20),
          ),
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
                              image: AssetImage("assets/Penduduk/cowo.jpg"),
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
                                        AssetImage("assets/Penduduk/cewe.jpg"),
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
                                      AssetImage("assets/Penduduk/Jumlah.jpg"),
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
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 30),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(77, 77, 77, 77),
            borderRadius: BorderRadius.circular(20),
          ),
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
                                image: AssetImage("assets/Agama/Islam.jpg"),
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
                                        AssetImage("assets/Agama/Kristen.jpg"),
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
                                        AssetImage("assets/Agama/Buddha.jpg"),
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
      padding: EdgeInsets.symmetric(horizontal: 70, vertical: 30),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(77, 77, 77, 77),
            borderRadius: BorderRadius.circular(20),
          ),
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
                              image: AssetImage("assets/Pendidikan/Tk.jpg"),
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
                                  image: AssetImage("assets/Pendidikan/Sd.jpg"),
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
                                      AssetImage("assets/Pendidikan/Smp.jpg"),
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
                                          "assets/Pendidikan/Sma.jpg"),
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
                                          "assets/Pendidikan/S1.jpg"),
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
                                          "assets/Pendidikan/S2.jpg"),
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
