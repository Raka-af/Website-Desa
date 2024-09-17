import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:website_desa/admin/login.dart';
import 'package:website_desa/widget/custom/button.dart';
import 'package:website_desa/widget/custom/input.dart';

class RegistAdmin extends StatefulWidget {
  const RegistAdmin({super.key});

  @override
  State<RegistAdmin> createState() => _RegistAdminState();
}

class _RegistAdminState extends State<RegistAdmin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference _users = FirebaseFirestore.instance.collection('admin');

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isCheck = false;
  final _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            width: 400,
            height: 500,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: const Color.fromARGB(255, 79, 125, 163),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage('assets/Desa/Logo.jpg'),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Admin Desa Margalaksana',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InputText(
                    textEditingController: _firstNameController,
                    hintText: 'First Name',
                    textInputType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputText(
                    textEditingController: _lastNameController,
                    hintText: "Last Name",
                    textInputType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your last name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputText(
                    textEditingController: _emailController,
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InputText(
                    textEditingController: _passwordController,
                    hintText: "Password",
                    textInputType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  CustomButton(
                      title: "Regist",
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          if (!_isCheck) {
                            try {
                              UserCredential userCredential =
                                  await _auth.createUserWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text,
                              );
                              String uid = userCredential.user!.uid;
                              await _users.doc(uid).set({
                                'email': _emailController.text,
                                'firstName': _firstNameController.text,
                                'lastName': _lastNameController.text,
                              });

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginAdmin(),
                                ),
                              );
                            } catch (e) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(e.toString()),
                                ),
                              );
                            }
                          }
                        }
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
