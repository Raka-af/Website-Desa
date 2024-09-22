import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:website_desa/dashboard/mobile/layout_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      showBackButton: false,
      body: Column(
        children: [
          Gallery(),
          Footer(),
        ],
      ),
    );
  }
}

// Gallery Widget
class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<Map<String, String>> images = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    List<Map<String, String>> imageData = await FirestoreDatabase().getImages();
    setState(() {
      images = imageData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: BoxConstraints(
          minHeight: 600,
        ),
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: images.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ),
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return SingleChildScrollView(
                        child: Container(
                          color: Color.fromARGB(77, 77, 77, 77),
                          padding: EdgeInsets.all(8),
                          child: Column(
                            children: [
                              Image.network(
                                images[index]['url']!,
                                fit: BoxFit.cover,
                              ),
                              SizedBox(
                                  height: 8), // Space between image and text
                              Text(
                                images[index]['name']!,
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}

// Firestore Database class
class FirestoreDatabase {
  Future<List<Map<String, String>>> getImages() async {
    List<Map<String, String>> imageUrls = [];

    try {
      // Fetch the collection from Firestore
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('images') // Your Firestore collection name
          .get();

      // Loop through each document
      for (var doc in snapshot.docs) {
        String url = doc['url'];
        String name = doc['name'];

        // Add both url and name to the list
        imageUrls.add({'url': url, 'name': name});
      }
    } catch (e) {
      print("Error fetching images: $e");
    }

    return imageUrls;
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
