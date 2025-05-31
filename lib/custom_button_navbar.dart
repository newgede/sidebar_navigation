import 'package:flutter/material.dart';
import 'package:flutter_bahasa_inggris_1/halaman_kategori.dart';
import 'package:flutter_bahasa_inggris_1/halaman_kosa_kata.dart';
import 'package:flutter_bahasa_inggris_1/halaman_kuis.dart';
import 'package:flutter_bahasa_inggris_1/halaman_latihan_soal.dart';
import 'package:flutter_bahasa_inggris_1/halaman_utama.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  HalamanUtama()));
        break;
      case 1:
         Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => HalamanKategori()),
        );
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HalamanLatihanSoal()));
        break;
      case 3:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HalamanKuis()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromARGB(255, 60, 117, 239),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      currentIndex: currentIndex,
      onTap: (index) => _onItemTapped(context, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'Daftar Kosa Kata',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Latihan Soal',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.quiz),
          label: 'Kuis',
        ),
      ],
    );
  }
}
