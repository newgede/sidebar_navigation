// halaman_notifikasi.dart
import 'package:flutter/material.dart';
import 'package:flutter_bahasa_inggris_1/custom_button_navbar.dart'; // Import CustomBottomNavBar

class HalamanNotifikasi extends StatelessWidget {
  const HalamanNotifikasi({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data untuk notifikasi
    final List<Map<String, String>> notifications = [
      {
        'title': 'Kuis Tersedia!',
        'message': 'Kuis "Kosakata Buah" telah ditambahkan. Ayo coba sekarang!',
        'time': '2 jam yang lalu',
      },
      {
        'title': 'Progress Anda Luar Biasa!',
        'message': 'Anda telah menyelesaikan 10 latihan berturut-turut. Pertahankan!',
        'time': 'Kemarin',
      },
      {
        'title': 'Pemeliharaan Sistem',
        'message': 'Aplikasi akan menjalani pemeliharaan singkat malam ini.',
        'time': '3 hari yang lalu',
      },
      {
        'title': 'Level Up!',
        'message': 'Selamat! Anda telah mencapai level "Beginner".',
        'time': '1 minggu yang lalu',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notifikasi',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue, // Sesuaikan warna dengan tema aplikasi Anda
        iconTheme: const IconThemeData(color: Colors.white), // Warna ikon di AppBar (misal: tombol kembali)
        centerTitle: true,
      ),
      body: notifications.isEmpty
          ? const Center(
              child: Text(
                'Tidak ada notifikasi saat ini.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 2.0),
                  elevation: 2,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    leading: const Icon(
                      Icons.notifications,
                      color: Colors.blue, // Warna ikon notifikasi
                    ),
                    title: Text(
                      notification['title']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(notification['message']!),
                        const SizedBox(height: 4),
                        Text(
                          notification['time']!,
                          style: const TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    onTap: () {
                      // Opsional: tambahkan logika ketika notifikasi diklik
                      // Misalnya, navigasi ke halaman detail kuis, dll.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Notifikasi "${notification['title']}" diklik!')),
                      );
                    },
                  ),
                );
              },
            ),
      // Jika Anda ingin menempatkan BottomNavBar di halaman ini juga
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2), 
    );
  }
}