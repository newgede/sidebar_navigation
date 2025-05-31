import 'package:flutter/material.dart';
import 'package:flutter_bahasa_inggris_1/custom_button_navbar.dart';
import 'package:flutter_bahasa_inggris_1/halaman_kategori.dart';
import 'halaman_latihan_soal.dart';
import 'halaman_kuis.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lang Go", style: TextStyle(color:Colors.white)),
        backgroundColor: Colors.blue,
        actions: const [
          Icon(Icons.person_outline, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.settings, color: Colors.white),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hai,\nSelamat Datang!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => HalamanKategori(),
                        ),
                      );
                    },
                    child: const MenuBox(
                      icon: Icons.menu_book,
                      label: 'Daftar\nKosa Kata',
                      iconColor: Colors.purple,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const HalamanLatihanSoal()));
                    },
                    child: const MenuBox(
                      icon: Icons.assignment,
                      label: 'Latihan\nSoal',
                      iconColor: Colors.blue,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => HalamanKuis()));
                    },
                    child: const MenuBox(
                      icon: Icons.quiz,
                      label: 'Kuis',
                      iconColor: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
    );
  }
}

class MenuBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  const MenuBox({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: iconColor),
            const SizedBox(height: 8),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
