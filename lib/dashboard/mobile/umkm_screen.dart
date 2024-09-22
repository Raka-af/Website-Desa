import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/mobile/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class UmkmScreen extends StatelessWidget {
  const UmkmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      showBackButton: false,
      body: Column(
        children: <Widget>[
          Umkm(),
          Footer(),
        ],
      ),
    );
  }
}

class Umkm extends StatefulWidget {
  const Umkm({super.key});

  @override
  State<Umkm> createState() => _UmkmState();
}

class _UmkmState extends State<Umkm> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    List<String> urls = await FirestoreDatabase().getImages();
    setState(() {
      imageUrls = urls;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("data_umkm").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || imageUrls.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          final documents = snapshot.data!.docs;

          // Pastikan jumlah dokumen dan gambar sama untuk mencegah error
          final itemCount = documents.length < imageUrls.length
              ? documents.length
              : imageUrls.length;

          return Container(
            color: Colors.white,
            constraints: BoxConstraints(
              minHeight: 600, // Set tinggi awal minimum
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                itemCount,
                (index) {
                  Map<String, dynamic> data =
                      documents[index].data()! as Map<String, dynamic>;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        color: Color.fromARGB(77, 77, 77, 77),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Row(
                          children: [
                            Image.network(
                              imageUrls[index], // Ambil URL gambar sesuai index
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data['jenis'] ?? 'Jenis tidak tersedia',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.person, size: 14),
                                    SizedBox(width: 5),
                                    Text(
                                      data['nama'] ?? 'Nama tidak tersedia',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.location_on, size: 14),
                                    SizedBox(width: 5),
                                    Text(
                                      data['alamat'] ?? 'Alamat tidak tersedia',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}

class FirestoreDatabase {
  Future<List<String>> getImages() async {
    List<String> imageUrls = [];

    try {
      final ListResult result = await FirebaseStorage.instance
          .ref('umkm') // Folder di Firebase Storage tempat gambar disimpan
          .listAll();

      print('Jumlah gambar ditemukan: ${result.items.length}');

      // Mendapatkan URL untuk setiap gambar
      for (var ref in result.items) {
        String url = await ref.getDownloadURL();
        print('URL gambar: $url');
        imageUrls.add(url);
      }
    } catch (e) {
      print("Error fetching umkm: $e");
    }

    return imageUrls;
  }
}
//Umkm
// class Umkm extends StatelessWidget {
//   const Umkm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: 10,
//       ),
//       color: Colors.white,
//       width: screenWidth * 1,
//       height: screenHeight * 0.71,
//       child: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection("data_umkm").snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           } else {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Data UMKM',
//                   style: TextStyle(
//                       fontSize: screenWidth * 0.015 + screenHeight * 0.015,
//                       color: Colors.black),
//                 ),
//                 Container(
//                   height: screenWidth * 0.002,
//                   width: screenHeight * 0.2,
//                   color: Colors.black,
//                   margin: EdgeInsets.only(top: 8),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Expanded(
//                   child: ListView(
//                     children:
//                         snapshot.data!.docs.map((DocumentSnapshot document) {
//                       Map<String, dynamic> data =
//                           document.data()! as Map<String, dynamic>;
//                       return Column(
//                         children: [
//                           Row(
//                             children: [
//                               Image.network(
//                                 data['imageUrl'] ??
//                                     'https://firebasestorage.googleapis.com/v0/b/flutter-web-connection-5b8e3.appspot.com/o/images%2F2.jpg?alt=media&token=1543460b-627e-426f-a62a-2fc81c2c1a28', // Ganti dengan URL gambar dari Firestore
//                                 width: screenWidth * 0.3,
//                                 height: screenHeight * 0.1,
//                                 fit: BoxFit.cover,
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     data['jenis'] ?? 'Jenis tidak tersedia',
//                                     style: TextStyle(
//                                         fontSize: screenWidth * 0.012 +
//                                             screenHeight * 0.012,
//                                         color: Colors.black),
//                                   ),
//                                   Row(
//                                     children: [
//                                       Icon(Icons.person),
//                                       SizedBox(
//                                         width: 3,
//                                       ),
//                                       Text(
//                                         data['nama'] ?? 'Nama tidak tersedia',
//                                         style: TextStyle(fontSize: 12),
//                                       ),
//                                     ],
//                                   ),
//                                   Row(
//                                     children: [
//                                       Icon(Icons.location_on),
//                                       SizedBox(
//                                         width: 3,
//                                       ),
//                                       Text(
//                                         data['alamat'] ??
//                                             'Alamat tidak tersedia',
//                                         style: TextStyle(fontSize: 12),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                         ],
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }

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
