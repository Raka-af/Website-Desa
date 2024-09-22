import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:website_desa/dashboard/desktop/home_screen.dart';
import 'package:website_desa/dashboard/desktop/layout_screen.dart'; // Import Firestore

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key, required int selectedIndex});

  @override
  Widget build(BuildContext context) {
    return LayoutScreen(
      body: Column(
        children: [
          Gallery(),
          Footer(),
        ],
      ),
      selectedIndex: 6,
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
          minHeight: 480,
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
                      crossAxisCount: 4,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
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
                                    fontSize: 16, fontWeight: FontWeight.w500),
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
