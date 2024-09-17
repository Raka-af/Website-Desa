import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: FirestoreDatabase().getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text(
              'Gagal',
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: Image.network(
                snapshot.data.toString(),
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class FirestoreDatabase {
  String? downloadURL;

  Future<void> getDownloadURL() async {
    downloadURL =
        await FirebaseStorage.instance.ref().child("1.jpg").getDownloadURL();
  }

  Future getData() async {
    try {
      await downloadURLExample();
      return downloadURL;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  Future<void> downloadURLExample() async {
    downloadURL =
        await FirebaseStorage.instance.ref().child("1.jpg").getDownloadURL();
    debugPrint(downloadURL.toString());
  }

  getImages() {}
}
