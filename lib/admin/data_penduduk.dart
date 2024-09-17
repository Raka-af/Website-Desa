import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataPenduduk extends StatefulWidget {
  const DataPenduduk({super.key});

  @override
  State<DataPenduduk> createState() => _DataPendudukState();
}

class _DataPendudukState extends State<DataPenduduk> {
  late String nama, jumlah, id;

  getId(id) {
    this.id = id;
  }

  getNama(name) {
    this.nama = name;
  }

  getJumlah(id) {
    this.jumlah = id;
  }

  updateJenisKelamin() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("data_jenis_kelamin").doc(id);

    Map<String, dynamic> data = {"jumlah": jumlah, "nama": nama, "id": id};
    documentReference.set(data).whenComplete(() {});
  }

  updateAgama() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("data_agama").doc(id);

    Map<String, dynamic> data = {"jumlah": jumlah, "nama": nama, "id": id};
    documentReference.set(data).whenComplete(() {});
  }

  updatePendidikan() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("data_pendidikan").doc(id);

    Map<String, dynamic> data = {"jumlah": jumlah, "nama": nama, "id": id};
    documentReference.set(data).whenComplete(() {});
  }

  createJenisKelamin() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("data_jenis_kelamin").doc(id);

    Map<String, dynamic> data = {"jumlah": jumlah, "nama": nama, "id": id};
    documentReference.set(data).whenComplete(() {});
  }

  createAgama() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("data_agama").doc(id);

    Map<String, dynamic> data = {"jumlah": jumlah, "nama": nama, "id": id};
    documentReference.set(data).whenComplete(() {});
  }

  createPendidikan() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection("data_pendidikan").doc(id);

    Map<String, dynamic> data = {"jumlah": jumlah, "nama": nama, "id": id};
    documentReference.set(data).whenComplete(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Penduduk'),
      ),

      //Data Jenis Kelamin
      body: Container(
        padding: EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Color.fromARGB(255, 172, 208, 238),
                width: 300,
                height: 500,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Data Jenis Kelamin',
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
                            labelText: "Jenis Kelamin",
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
                            labelText: "Jumlah",
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          onChanged: (String id) {
                            getJumlah(id);
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
                              updateJenisKelamin();
                            },
                            child: Text('Update'),
                          ),
                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: Colors.orange,
                          //   ),
                          //   onPressed: () {
                          //     createJenisKelamin();
                          //   },
                          //   child: Text('Created'),
                          // ),
                        ],
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("data_jenis_kelamin")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Text("Loading");
                          } else {
                            return Expanded(
                              child: ListView(
                                children: snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                                  Map<String, dynamic> data =
                                      document.data()! as Map<String, dynamic>;
                                  return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(data['id']),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Text(data['nama']),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Text(data['jumlah']),
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
            ),

            //Data Agama
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Color.fromARGB(255, 172, 208, 238),
                width: 300,
                height: 500,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Data Agama',
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
                            labelText: " Agama",
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
                            labelText: "Jumlah",
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          onChanged: (String id) {
                            getJumlah(id);
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
                              updateAgama();
                            },
                            child: Text('Update'),
                          ),
                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: Colors.orange,
                          //   ),
                          //   onPressed: () {
                          //     createAgama();
                          //   },
                          //   child: Text('Created'),
                          // ),
                        ],
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("data_agama")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Text("Loading");
                          } else {
                            return Expanded(
                              child: ListView(
                                children: snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                                  Map<String, dynamic> data =
                                      document.data()! as Map<String, dynamic>;
                                  return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(data['id']),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Text(data['nama']),
                                        SizedBox(
                                          height: 50,
                                        ),
                                        Text(data['jumlah']),
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
            ),

            //Data Pendidikan
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: EdgeInsets.all(16.0),
                color: Color.fromARGB(255, 172, 208, 238),
                width: 300,
                height: 500,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Data Pendidikan',
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
                            labelText: "Pendidikan",
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
                            labelText: "Jumlah",
                            fillColor: Colors.white,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                            ),
                          ),
                          onChanged: (String id) {
                            getJumlah(id);
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
                              updatePendidikan();
                            },
                            child: Text('Update'),
                          ),
                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor: Colors.orange,
                          //   ),
                          //   onPressed: () {
                          //     createPendidikan();
                          //   },
                          //   child: Text('Created'),
                          // ),
                        ],
                      ),
                      StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("data_pendidikan")
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return Text("Loading");
                          } else {
                            return Expanded(
                              child: ListView(
                                children: snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                                  Map<String, dynamic> data =
                                      document.data()! as Map<String, dynamic>;
                                  return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(data['id']),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Text(data['nama']),
                                        SizedBox(
                                          height: 25,
                                        ),
                                        Text(data['jumlah']),
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
            ),
          ],
        ),
      ),
    );
  }
}
