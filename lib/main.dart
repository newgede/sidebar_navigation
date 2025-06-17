import 'package:flutter/material.dart';
import 'package:flutter_bahasa_inggris_1/halaman_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Aplikasi Belajar Bahasa',
      debugShowCheckedModeBanner: false,
      home: HalamanLogin(),
    );
  }
}
