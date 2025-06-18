import 'package:flutter/material.dart';
import 'package:flutter_bahasa_inggris_1/halaman_profil.dart';
import 'package:flutter_bahasa_inggris_1/halaman_progres.dart';
import 'package:flutter_bahasa_inggris_1/halaman_utama.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    

   switch (index) {
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (_) => const HalamanUtama())); // Ganti pushReplacement
        break;
      case 1:
         Navigator.push( // Ganti pushReplacement
          context,
          MaterialPageRoute(builder: (_) => const HalamanProgres()),
        );
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (_) => const HalamanProfil())); // Ganti pushReplacement
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blue,
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
          icon: Icon(Icons.track_changes), // Menggunakan track_changes untuk Statistik/Progres
          label: 'Statistik',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person), // Mengganti ikon ke person untuk Profil
          label: 'Profil',
        ),
        ],
    );
  }
}