import 'package:flutter/material.dart';
import 'package:flutter_bahasa_inggris_1/custom_button_navbar.dart'; // Import the CustomBottomNavBar

class HalamanProfil extends StatefulWidget {
  const HalamanProfil({Key? key}) : super(key: key);

  @override
  State<HalamanProfil> createState() => _HalamanProfilState();
}

class _HalamanProfilState extends State<HalamanProfil> {
  String nama = 'Ade Putra';
  String email = 'ade.putra@example.com';
  int jumlahKosakata = 120;
  int latihanSelesai = 15;
  String level = 'Intermediate';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Saya'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Bagian Profil
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/avatar.png'),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    nama,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Tombol Edit Profil
            ElevatedButton.icon(
              onPressed: () {
                // Aksi edit profil
              },
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profil'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

            const SizedBox(height: 30),
            const Divider(),

            // Statistik Belajar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatistikBox('Kosakata', jumlahKosakata.toString()),
                _buildStatistikBox('Latihan', latihanSelesai.toString()),
                _buildStatistikBox('Level', level),
              ],
            ),

            const SizedBox(height: 30),
            const Divider(),

            // Menu Akun
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.deepPurple),
              title: const Text('Pengaturan Akun'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Aksi pengaturan akun
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text('Keluar'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Keluar'),
                    content: const Text('Yakin ingin keluar dari aplikasi?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Batal'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Logika logout
                          Navigator.pop(context);
                        },
                        child: const Text('Keluar'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2), // Add this line
    );
  }

  Widget _buildStatistikBox(String title, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.deepPurple.shade100),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(color: Colors.deepPurple),
          ),
        ],
      ),
    );
  }
}