import 'dart:typed_data'; // Untuk menangani data byte
import 'package:file_picker/file_picker.dart'; // untuk web dan platform lain
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Umkm extends StatefulWidget {
  const Umkm({super.key});

  @override
  State<Umkm> createState() => _UmkmState();
}

class _UmkmState extends State<Umkm> {
  // Variabel untuk menyimpan input form
  late String nama, jenis, alamat, id;
  Uint8List? _imageFileBytes;
  String? _imageName;

  // TextEditingController untuk mengontrol form input
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _jenisController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _alamatController = TextEditingController();

  getId(id) {
    this.id = id;
  }

  getJenis(name) {
    this.jenis = name;
  }

  getNama(name) {
    this.nama = name;
  }

  getAlamat(name) {
    this.alamat = name;
  }

  // Fungsi untuk memilih gambar
  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
    );

    if (result != null) {
      setState(() {
        _imageFileBytes = result.files.first.bytes;
        _imageName = result.files.first.name;
      });
    }
  }

  // Fungsi untuk upload gambar ke Firebase
  Future<String> _uploadImageToFirebase() async {
    if (_imageFileBytes == null || _imageName == null) return '';

    String fileName = 'umkm/$_imageName';
    final storageRef = FirebaseStorage.instance.ref().child(fileName);
    final UploadTask uploadTask = storageRef.putData(_imageFileBytes!);

    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }

  // Fungsi untuk membuat UMKM
  Future<void> createUMKM() async {
    String imageUrl = await _uploadImageToFirebase();

    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("data_umkm").doc(id);

    Map<String, dynamic> data = {
      "id": id,
      "jenis": jenis,
      "nama": nama,
      "alamat": alamat,
      "imageUrl": imageUrl,
    };

    await documentReference.set(data).whenComplete(() {
      print('UMKM created with image!');
      _clearForm(); // Mengosongkan form setelah selesai
    });
  }

  // Fungsi untuk menghapus data UMKM
  Future<void> deleteUMKM(String docId) async {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("data_umkm").doc(docId);

    documentReference.delete().whenComplete(() {
      print('UMKM deleted!');
    });
  }

  // Fungsi untuk mengosongkan form input setelah submit
  void _clearForm() {
    setState(() {
      _idController.clear();
      _jenisController.clear();
      _namaController.clear();
      _alamatController.clear();
      _imageFileBytes = null;
      _imageName = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data UMKM'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Color.fromARGB(255, 172, 208, 238),
                width: 700,
                height: 1000,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Data UMKM',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 50),
                      TextFormField(
                        controller: _idController,
                        decoration: InputDecoration(labelText: "ID"),
                        onChanged: (String id) {
                          getId(id);
                        },
                      ),
                      TextFormField(
                        controller: _jenisController,
                        decoration: InputDecoration(labelText: "Jenis UMKM"),
                        onChanged: (String name) {
                          getJenis(name);
                        },
                      ),
                      TextFormField(
                        controller: _namaController,
                        decoration: InputDecoration(labelText: "Nama Pemilik"),
                        onChanged: (String name) {
                          getNama(name);
                        },
                      ),
                      TextFormField(
                        controller: _alamatController,
                        decoration: InputDecoration(labelText: "Alamat"),
                        onChanged: (String name) {
                          getAlamat(name);
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _pickImage,
                        child: Text("Pilih Gambar"),
                      ),
                      _imageFileBytes != null
                          ? Image.memory(
                              _imageFileBytes!,
                              height: 150,
                            )
                          : Container(),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          createUMKM();
                        },
                        child: Text("Create UMKM"),
                      ),
                      SizedBox(height: 20),
                      // StreamBuilder untuk menampilkan data UMKM
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("data_umkm")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Text("Loading");
                          } else {
                            return Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  DocumentSnapshot document =
                                      snapshot.data!.docs[index];
                                  Map<String, dynamic> data =
                                      document.data()! as Map<String, dynamic>;
                                  String docId = document.id;

                                  return Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(data['id']),
                                          SizedBox(width: 10),
                                          Text(data['jenis']),
                                          SizedBox(width: 10),
                                          Text(data['nama']),
                                          SizedBox(width: 10),
                                          Text(data['alamat']),
                                          SizedBox(width: 10),
                                          Image.network(
                                            data['imageUrl'],
                                            width: 50,
                                            height: 50,
                                          ),
                                          SizedBox(width: 10),

                                          // Tombol Hapus
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {
                                              deleteUMKM(docId);
                                            },
                                          ),
                                        ],
                                      ),
                                      Divider(),
                                    ],
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
