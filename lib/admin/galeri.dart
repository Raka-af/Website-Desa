import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  bool isUploading = false;
  String? imageUrl;
  TextEditingController _nameController = TextEditingController();

  Future<void> uploadImageToFirebase() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg'],
    );

    if (result != null && _nameController.text.isNotEmpty) {
      setState(() {
        isUploading = true;
      });

      PlatformFile file = result.files.first;

      // Use the name from the input instead of timestamp
      String fileName = _nameController.text.trim() + '.' + file.extension!;

      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref().child('images/$fileName');
      UploadTask uploadTask = ref.putData(file.bytes!);

      uploadTask.then((res) async {
        String downloadUrl = await res.ref.getDownloadURL();
        setState(() {
          imageUrl = downloadUrl;
          isUploading = false;
        });

        // Simpan nama file, URL, dan timestamp ke Firestore
        await FirebaseFirestore.instance.collection('images').add({
          'name': _nameController.text,
          'url': downloadUrl,
          'timestamp': FieldValue.serverTimestamp(), // Tambahkan timestamp
        });

        // Kosongkan field nama setelah upload
        _nameController.clear();
      }).catchError((error) {
        print("Error: $error");
        setState(() {
          isUploading = false;
        });
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Masukkan nama gambar sebelum mengunggah!")),
      );
    }
  }

  Future<void> deleteImage(String imageUrl, String documentId) async {
    try {
      Reference ref = FirebaseStorage.instance.refFromURL(imageUrl);
      await ref.delete();
      await FirebaseFirestore.instance
          .collection('images')
          .doc(documentId)
          .delete();
    } catch (e) {
      print("Gagal hapus gambar: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Masukkan Nama Gambar",
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: uploadImageToFirebase,
                child: Text("Upload Gambar"),
              ),
              SizedBox(height: 20),
              isUploading
                  ? CircularProgressIndicator()
                  : Expanded(
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('images')
                            .orderBy('timestamp',
                                descending:
                                    true) // Urutkan berdasarkan timestamp
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: Text("Loading..."));
                          }
                          return ListView(
                            children: snapshot.data!.docs.map((document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              String documentId = document.id;
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Container(
                                  width: 350,
                                  height: 200,
                                  color: Colors.grey[200],
                                  child: Row(
                                    children: [
                                      Image.network(
                                        data['url'],
                                        width: 150,
                                        height: 150,
                                        fit: BoxFit.cover,
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              data['name'],
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            SizedBox(height: 10),
                                            IconButton(
                                              icon: Icon(Icons.delete,
                                                  color: Colors.red),
                                              onPressed: () {
                                                deleteImage(
                                                    data['url'], documentId);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
