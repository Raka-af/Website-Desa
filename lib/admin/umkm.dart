import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Umkm extends StatefulWidget {
  const Umkm({super.key});

  @override
  State<Umkm> createState() => _UmkmState();
}

class _UmkmState extends State<Umkm> {
  late String nama, jenis, alamat, id;

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

  updateUMKM() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("data_umkm").doc(id);

    Map<String, dynamic> data = {
      "id": id,
      "jenis": jenis,
      "nama": nama,
      "alamat": alamat
    };
    documentReference.set(data).whenComplete(() {});
  }

  createUMKM() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("data_umkm").doc(id);

    Map<String, dynamic> data = {
      "id": id,
      "jenis": jenis,
      "nama": nama,
      "alamat": alamat
    };
    documentReference.set(data).whenComplete(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data UMKM'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
              padding: EdgeInsets.all(50),
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
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "ID",
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                            ),
                            onChanged: (String id) {
                              getId(id);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Jenis UMKM",
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                            ),
                            onChanged: (String name) {
                              getJenis(name);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Nama Pemilik",
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                            ),
                            onChanged: (String name) {
                              getNama(name);
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Alamat",
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.blue, width: 2.0),
                              ),
                            ),
                            onChanged: (String name) {
                              getAlamat(name);
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                              ),
                              onPressed: () {
                                updateUMKM();
                              },
                              child: Text('Update'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                              ),
                              onPressed: () {
                                createUMKM();
                              },
                              child: Text('Created'),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("data_umkm")
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (!snapshot.hasData) {
                              return Text("Loading");
                            } else {
                              return Expanded(
                                child: ListView(
                                  children: snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                    Map<String, dynamic> data = document.data()!
                                        as Map<String, dynamic>;
                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(data['id']),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(data['jenis']),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(data['nama']),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(data['alamat']),
                                        ]);
                                  }).toList(),
                                ),
                              );
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
