import 'package:flutter/material.dart';
import 'package:flutter_bahasa_inggris_1/custom_button_navbar.dart';


class HalamanKosaKata extends StatefulWidget {
  @override
  _HalamanKosaKataState createState() => _HalamanKosaKataState();
}

class _HalamanKosaKataState extends State<HalamanKosaKata> {
  final List<Map<String, String>> kosaKata = [
    {'kata': 'Dog', 'arti': 'Anjing'},
    {'kata': 'Cat', 'arti': 'Kucing'},
    {'kata': 'Pig', 'arti': 'Babi'},
    {'kata': 'Bird', 'arti': 'Burung'},
    {'kata': 'Thank you', 'arti': 'Terima kasih'},
  ];

  void _bukaFormTambahKata() {
    String kataBaru = '';
    String artiBaru = '';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Tambah Kosa Kata'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Kata'),
              onChanged: (value) => kataBaru = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Arti'),
              onChanged: (value) => artiBaru = value,
            ),
          ],
        ),
        actions: [
          TextButton(
            child: Text('Batal'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            child: Text('Simpan'),
            onPressed: () {
              if (kataBaru.isNotEmpty && artiBaru.isNotEmpty) {
                setState(() {
                  kosaKata.add({'kata': kataBaru, 'arti': artiBaru});
                });
                Navigator.of(context).pop();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Kata "$kataBaru" berhasil ditambahkan!')),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kosa Kata', style : TextStyle(color:Colors.white)),
        backgroundColor: Colors.indigo[800],
      ),
      body: ListView.builder(
        itemCount: kosaKata.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              title: Text(
                kosaKata[index]['kata'] ?? '',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                kosaKata[index]['arti'] ?? '',
                style: TextStyle(fontSize: 16),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _bukaFormTambahKata,
        child: Icon(Icons.add, color:Colors.white),
        backgroundColor: Colors.indigo[800],
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }
}

