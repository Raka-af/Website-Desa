import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/desktop/home_screen.dart';
import 'package:website_desa/dashboard/desktop/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class UMKMScreen extends StatelessWidget {
  final int selectedIndex;

  const UMKMScreen({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      // showBackButton: false,
      body: Column(
        children: <Widget>[
          Umkm(),
          Footer(),
        ],
      ),
      selectedIndex: selectedIndex,
    );
  }
}

//Umkm
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
              minHeight: 480, // Tinggi awal minimum
            ),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Wrap(
              spacing: 50,
              runSpacing:
                  50, // Jarak antar item secara vertikal saat membungkus
              children: List.generate(
                itemCount,
                (index) {
                  Map<String, dynamic> data =
                      documents[index].data()! as Map<String, dynamic>;

                  return Container(
                    color: Color.fromARGB(77, 77, 77, 77),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: 400, // Lebar item termasuk gambar dan teks
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          imageUrls[index],
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          width: 10, // Jarak antara gambar dan teks
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['jenis'] ?? 'Jenis tidak tersedia',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                            Row(
                              children: [
                                Icon(Icons.person),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  data['nama'] ?? 'Nama tidak tersedia',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  data['alamat'] ?? 'Alamat tidak tersedia',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
