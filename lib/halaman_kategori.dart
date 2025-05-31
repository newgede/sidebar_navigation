import 'package:flutter/material.dart';
import 'halaman_kosa_kata.dart';

class HalamanKategori extends StatelessWidget {
  HalamanKategori({super.key});

  final List<Map<String, String>> kategoriList = [
    {
      'nama': ' KosaKata Hewan',
      'gambar': 'assets/images/hewan.jpg',
    },
    {
      'nama': 'KosaKata Buah',
      'gambar': 'assets/images/buah.jpg',
    },
    {
      'nama': 'KosaKata Bunga',
      'gambar': 'assets/images/bunga.jpg',
    },
    {
      'nama': 'KosaKata Organ Tubuh',
      'gambar': 'assets/images/organ_tubuh.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori Kosa Kata'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: kategoriList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final kategori = kategoriList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => HalamanKosaKata(
                      kategori: kategori['nama']!,
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.asset(
                          kategori['gambar']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        kategori['nama']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
