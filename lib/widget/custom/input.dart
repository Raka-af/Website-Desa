import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final TextInputType textInputType;
  final String? Function(String?)? validator;
  final bool obscureText;

  InputText({
    required this.textEditingController,
    required this.hintText,
    required this.textInputType,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.black), // Warna teks hint
        filled: true, // Mengaktifkan fill color
        fillColor: Colors.white, // Warna latar belakang form
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0), // Menambahkan border radius
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.black), // Warna border saat aktif
          borderRadius: BorderRadius.circular(8.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.black), // Warna border saat fokus
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      style: TextStyle(color: Colors.black), // Warna teks input
      validator: validator,
    );
  }
}
