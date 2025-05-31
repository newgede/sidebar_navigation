import 'package:flutter/material.dart';

class HalamanKosaKata extends StatefulWidget {
  final String kategori;
  HalamanKosaKata({required this.kategori});

  @override
  _HalamanKosaKataState createState() => _HalamanKosaKataState();
}

class _HalamanKosaKataState extends State<HalamanKosaKata> {
  List<Map<String, String>> semuaKosaKata = [
    {
      'kata': 'Dog',
      'arti': 'Anjing',
      'ejaan': 'dôg',
      'kategori': 'KosaKata Hewan',
      'gambar': 'assets/images/dog.jpg',
    },
    {
      'kata': 'Cat',
      'arti': 'Kucing',
      'ejaan': 'kat',
      'kategori': 'KosaKata Hewan',
      'gambar': 'assets/images/cat.jpg',
    },
    {
      'kata': 'Chicken',
      'arti': 'Ayam',
      'ejaan': 'chi-ken',
      'kategori': 'KosaKata Hewan',
      'gambar': 'assets/images/chicken.jpg',
    },
    {
      'kata': 'Tiger',
      'arti': 'Harimau',
      'ejaan': 'tai-ger',
      'kategori': 'KosaKata Hewan',
      'gambar': 'assets/images/tiger.jpg',
    },
    {
      'kata': 'Durian',
      'arti': 'Durian',
      'ejaan': 'du-ri-an',
      'kategori': 'KosaKata Buah',
      'gambar': 'assets/images/Durian.jpg',
    },
    {
      'kata': 'Mangosteen',
      'arti': 'Manggis',
      'ejaan': 'mang-ge-stin',
      'kategori': 'KosaKata Buah',
      'gambar': 'assets/images/mangosteen.jpg',
    },
    {
      'kata': 'Soursop',
      'arti': 'Sirsak',
      'ejaan': 'sau-er-sop',
      'kategori': 'KosaKata Buah',
      'gambar': 'assets/images/soursop.jpg',
    },
    {
      'kata': 'Sapodilla',
      'arti': 'Sawo',
      'ejaan': 'sa-po-di-la',
      'kategori': 'KosaKata Buah',
      'gambar': 'assets/images/sapodilla.jpg',
    },
    {
      'kata': 'Jasmine',
      'arti': 'Melati',
      'ejaan': 'jaz-min',
      'kategori': 'KosaKata Bunga',
      'gambar': 'assets/images/jasmine.jpg',
    },
    {
      'kata': 'Lavender',
      'arti': 'Lavender',
      'ejaan': 'la-ven-der',
      'kategori': 'KosaKata Bunga',
      'gambar': 'assets/images/lavender.jpg',
    },
    {
      'kata': 'Lily',
      'arti': 'lili',
      'ejaan': 'li-li',
      'kategori': 'KosaKata Bunga',
      'gambar': 'assets/images/lily.jpg',
    },
    {
      'kata': 'Tulip',
      'arti': 'Tulip',
      'ejaan': 'tu-lip',
      'kategori': 'KosaKata Bunga',
      'gambar': 'assets/images/tulip.jpg',
    },
    {
      'kata': 'Lotus',
      'arti': 'Teratai',
      'ejaan': 'lo-tes',
      'kategori': 'KosaKata Bunga',
      'gambar': 'assets/images/lotus.jpg',
    },
    {
      'kata': 'Heart',
      'arti': 'Jantung',
      'ejaan': 'härt',
      'kategori': 'KosaKata Organ Tubuh',
      'gambar': 'assets/images/heart.jpg',
    },
    {
      'kata': 'Kidney',
      'arti': 'Ginjal',
      'ejaan': 'kid-ni',
      'kategori': 'KosaKata Organ Tubuh',
      'gambar': 'assets/images/kidney.jpg',
    },
    {
      'kata': 'Lung',
      'arti': 'Paru-Paru',
      'ejaan': 'lang',
      'kategori': 'KosaKata Organ Tubuh',
      'gambar': 'assets/images/lung.jpg',
    },
    {
      'kata': 'Brain',
      'arti': 'Otak',
      'ejaan': 'breyn',
      'kategori': 'KosaKata Organ Tubuh',
      'gambar': 'assets/images/brain.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final daftarTampil = semuaKosaKata
        .where((item) => item['kategori'] == widget.kategori.trim())
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.kategori}'),
        backgroundColor: Colors.blue,
      ),
      body: daftarTampil.isEmpty
          ? Center(child: Text('Tidak ada data untuk kategori ini.'))
          : ListView.builder(
              itemCount: daftarTampil.length,
              itemBuilder: (context, index) {
                final item = daftarTampil[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  child: ListTile(
                    leading: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: AssetImage(item['gambar'] ?? ''),
                          fit: BoxFit.cover, // mengisi penuh
                          onError: (_, __) {}, // untuk handle error manual
                        ),
                      ),
                    ),
                    title: Text(
                      item['kata'] ?? '',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Ejaan: ${item['ejaan']}'),
                        Text('Arti: ${item['arti']}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
