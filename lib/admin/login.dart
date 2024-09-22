import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:website_desa/admin/admin_screen.dart';
import 'package:website_desa/admin/regist.dart';
import 'package:website_desa/widget/custom/button.dart';
import 'package:website_desa/widget/custom/input.dart';

class LoginAdmin extends StatefulWidget {
  @override
  State<LoginAdmin> createState() => _LoginAdminState();
}

class _LoginAdminState extends State<LoginAdmin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  Future<User?> _sigIn(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = userCredential.user;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdminScreen()),
      );
      return user;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Gagal, silahkan cek lagi email dan password'),
        ),
      );
    }
  }

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
            height: 470,
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Color.fromARGB(255, 104, 153, 193),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image(
                    image: AssetImage('assets/Desa/Logo-remove.png'),
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Admin Desa Margalaksana',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 40),
                  InputText(
                    textEditingController: _emailController,
                    hintText: "Email",
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukkan email Anda";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  InputText(
                    textEditingController: _passwordController,
                    hintText: "Password",
                    textInputType: TextInputType.text,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Masukkan password Anda";
                      } else if (value.length < 6) {
                        return "Password harus lebih dari 6 karakter";
                      }
                      return null;
                    },
                    obscureText: true, // Sembunyikan teks password
                  ),
                  SizedBox(height: 10),
                  CustomButton(
                    title: ('Login'),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        _sigIn(context, _emailController.text,
                            _passwordController.text);
                      }
                    },
                  ),
                  // CustomButton(
                  //   title: ('Register'),
                  //   onPressed: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => RegistAdmin()),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
