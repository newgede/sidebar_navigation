import 'package:flutter/material.dart';

class HalamanKosaKata extends StatefulWidget {
  final String kategori;
  HalamanKosaKata({required this.kategori});

  @override
  _HalamanKosaKataState createState() => _HalamanKosaKataState();
}

class _HalamanKosaKataState extends State<HalamanKosaKata> {
  int currentIndex = 0;

  List<Map<String, String>> semuaKosaKata = [
    {
      'kata': 'Dog',
      'arti': 'Anjing',
      'ejaan': 'dog',
      'kategori': 'KosaKata Hewan',
      'gambar': 'assets/images/dog.jpg',
    },
    {
      'kata': 'Rabbit',
      'arti': 'Kelinci',
      'ejaan': 're-bit',
      'kategori': 'KosaKata Hewan',
      'gambar': 'assets/images/rabbit.jpg',
    },
    {
      'kata': 'Zebra',
      'arti': 'Zebra',
      'ejaan': 'ze-bra',
      'kategori': 'KosaKata Hewan',
      'gambar': 'assets/images/zebra.jpg',
    },
    {
      'kata': 'Cat',
      'arti': 'Kucing',
      'ejaan': 'kat',
      'kategori': 'KosaKata Hewan',
      'gambar': 'assets/images/cat.jpg',
    },
    {
      'kata': 'Cow',
      'arti': 'Sapi',
      'ejaan': 'kau',
      'kategori': 'KosaKata Hewan',
      'gambar': 'assets/images/cow.jpg',
    },
    {
      'kata': 'Crocodile',
      'arti': 'Buaya',
      'ejaan': 'kro-ko-dail',
      'kategori': 'KosaKata Hewan',
      'gambar': 'assets/images/crocodile.jpg',
    },
    {
      'kata': 'Bird',
      'arti': 'Burung',
      'ejaan': 'bi-rd',
      'kategori': 'KosaKata Hewan',
      'gambar': 'assets/images/bird.jpg',
    },
    {
      'kata': 'Deer',
      'arti': 'Rusa',
      'ejaan': 'dir',
      'kategori': 'KosaKata Hewan',
      'gambar': 'assets/images/deer.jpg',
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
      'kata': 'Kiwi',
      'arti': 'Kiwi',
      'ejaan': 'ki-wi',
      'kategori': 'KosaKata Buah',
      'gambar': 'assets/images/kiwi.jpg',
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
      'kata': 'Apple',
      'arti': 'Apel',
      'ejaan': 'ap-pel',
      'kategori': 'KosaKata Buah',
      'gambar': 'assets/images/apple.jpg',
    },
    {
      'kata': 'Melon',
      'arti': 'Melon',
      'ejaan': 'me-lon',
      'kategori': 'KosaKata Buah',
      'gambar': 'assets/images/melon.jpg',
    },
    {
      'kata': 'Strawberry',
      'arti': 'Stroberi',
      'ejaan': 'stro-ber-ri',
      'kategori': 'KosaKata Buah',
      'gambar': 'assets/images/strawberry.jpg',
    },
    {
      'kata': 'Rambutan',
      'arti': 'Rambutan',
      'ejaan': 'ram-bu-tan',
      'kategori': 'KosaKata Buah',
      'gambar': 'assets/images/rambutan.jpg',
    },
    {
      'kata': 'Banana',
      'arti': 'Pisang',
      'ejaan': 'ba-na-na',
      'kategori': 'KosaKata Buah',
      'gambar': 'assets/images/banana.jpg',
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
      'kata': 'Rose',
      'arti': 'Mawar',
      'ejaan': 'rous',
      'kategori': 'KosaKata Bunga',
      'gambar': 'assets/images/rose.jpg',
    },
    {
      'kata': 'Bougainvillea',
      'arti': 'Bougenville',
      'ejaan': 'bou-gen-vil-lea',
      'kategori': 'KosaKata Bunga',
      'gambar': 'assets/images/bougainvillea.jpg',
    },
    {
      'kata': 'Sunflower',
      'arti': 'Bunga Matahari',
      'ejaan': 'san-flau-er',
      'kategori': 'KosaKata Bunga',
      'gambar': 'assets/images/sun.jpg',
    },
    {
      'kata': 'Lavender',
      'arti': 'Lavender',
      'ejaan': 'la-ven-der',
      'kategori': 'KosaKata Bunga',
      'gambar': 'assets/images/lavender.jpg',
    },
    {
      'kata': 'Orchid',
      'arti': 'Anggrek',
      'ejaan': 'or-kid',
      'kategori': 'KosaKata Bunga',
      'gambar': 'assets/images/orchid.jpg',
    },
    {
      'kata': 'Lily',
      'arti': 'lili',
      'ejaan': 'li-li',
      'kategori': 'KosaKata Bunga',
      'gambar': 'assets/images/lily.jpg',
    },
    {
      'kata': 'Frangipani',
      'arti': 'Kamboja',
      'ejaan': 'fran-ji-pa-ni',
      'kategori': 'KosaKata Bunga',
      'gambar': 'assets/images/frangipani.jpg',
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
      'kata': 'Liver',
      'arti': 'Hati',
      'ejaan': 'li-ver',
      'kategori': 'KosaKata Organ Tubuh',
      'gambar': 'assets/images/liver.jpg',
    },
    {
      'kata': 'Ears',
      'arti': 'Telinga',
      'ejaan': 'iers',
      'kategori': 'KosaKata Organ Tubuh',
      'gambar': 'assets/images/ears.jpg',
    },
    {
      'kata': 'Eyes',
      'arti': 'Mata',
      'ejaan': 'ais',
      'kategori': 'KosaKata Organ Tubuh',
      'gambar': 'assets/images/eyes.jpg',
    },
    {
      'kata': 'Stomach',
      'arti': 'Lambung',
      'ejaan': 'sta-mek',
      'kategori': 'KosaKata Organ Tubuh',
      'gambar': 'assets/images/stomach.jpg',
    },
    {
      'kata': 'Intestines',
      'arti': 'Usus',
      'ejaan': 'in-tes-tins',
      'kategori': 'KosaKata Organ Tubuh',
      'gambar': 'assets/images/intestines.jpg',
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
    {
      'kata': 'Nose',
      'arti': 'Hidung',
      'ejaan': 'nous',
      'kategori': 'KosaKata Organ Tubuh',
      'gambar': 'assets/images/nose.jpg',
    },
  ];

  void nextWord() {
    final daftarTampil = semuaKosaKata
        .where((item) => item['kategori'] == widget.kategori.trim())
        .toList();

    setState(() {
      if (currentIndex < daftarTampil.length - 1) {
        currentIndex++;
      } else {
        currentIndex = 0; // Kembali ke awal
      }
    });
  }

  void previousWord() {
    final daftarTampil = semuaKosaKata
        .where((item) => item['kategori'] == widget.kategori.trim())
        .toList();

    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = daftarTampil.length - 1; // Ke akhir
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final daftarTampil = semuaKosaKata
        .where((item) => item['kategori'] == widget.kategori.trim())
        .toList();

    // Mendapatkan ukuran layar
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    final isTablet = screenWidth > 600;

    // Responsive sizes untuk memastikan semua konten terlihat
    final imageSize = isTablet ? screenWidth * 0.25 : screenWidth * 0.35;
    final titleFontSize = isTablet ? 32.0 : 24.0;
    final pronunciationFontSize = isTablet ? 18.0 : 16.0;
    final meaningFontSize = isTablet ? 32.0 : 28.0;
    final cardMargin = isTablet ? 16.0 : 12.0;
    final cardPadding = isTablet ? 20.0 : 16.0;

    if (daftarTampil.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: Text('${widget.kategori}'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.black,
        ),
        body: Center(child: Text('Tidak ada data untuk kategori ini.')),
      );
    }

    final currentWord = daftarTampil[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text('${widget.kategori}'),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        foregroundColor: Colors.black,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  '${currentIndex + 1}/${daftarTampil.length}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Kartu Kosakata - Fixed layout tanpa scroll
            Expanded(
              flex: 8,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(cardMargin),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(cardPadding),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Arti (Bahasa Indonesia) ukuran font diperbesar
                        Flexible(
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              currentWord['arti'] ?? '',
                              style: TextStyle(
                                fontSize: meaningFontSize,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        SizedBox(height: isTablet ? 16 : 12),

                        // Ukuran gambar dikurangi
                        Flexible(
                          flex: 4,
                          child: Container(
                            width: imageSize,
                            height: imageSize,
                            constraints: BoxConstraints(
                              maxWidth: 200,
                              maxHeight: 200,
                              minWidth: 120,
                              minHeight: 120,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                currentWord['gambar'] ?? '',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[300],
                                    child: Icon(
                                      Icons.image_not_supported,
                                      size: imageSize * 0.25,
                                      color: Colors.grey,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: isTablet ? 20 : 16),

                        // Kata dalam bahasa Inggris
                        Flexible(
                          flex: 1,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              currentWord['kata'] ?? '',
                              style: TextStyle(
                                fontSize: titleFontSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[800],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),

                        SizedBox(height: isTablet ? 12 : 8),

                        // Ejaan
                        Flexible(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: isTablet ? 16 : 12,
                                vertical: isTablet ? 8 : 6),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Text(
                                '/${currentWord['ejaan']}/',
                                style: TextStyle(
                                  fontSize: pronunciationFontSize,
                                  color: Colors.blue[800],
                                  fontStyle: FontStyle.italic,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Indikator titik-titik
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(daftarTampil.length, (index) {
                    return Container(
                      width: isTablet ? 10 : 8,
                      height: isTablet ? 10 : 8,
                      margin: EdgeInsets.symmetric(horizontal: 3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == index
                            ? Colors.blue[600]
                            : Colors.grey,
                      ),
                    );
                  }),
                ),
              ),
            ),

            // Tombol navigasi
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Tombol Previous
                  Flexible(
                    child: ElevatedButton.icon(
                      onPressed: previousWord,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: isTablet ? 20 : 18,
                      ),
                      label: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('Previous'),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[100],
                        foregroundColor: Colors.grey,
                        padding: EdgeInsets.symmetric(
                            horizontal: isTablet ? 24 : 20,
                            vertical: isTablet ? 16 : 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 16),

                  // Tombol Next
                  Flexible(
                    child: ElevatedButton.icon(
                      onPressed: nextWord,
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        size: isTablet ? 20 : 18,
                      ),
                      label: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text('Next'),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: isTablet ? 28 : 24,
                            vertical: isTablet ? 16 : 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
