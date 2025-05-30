import 'package:flutter/material.dart';
import 'package:flutter_bahasa_inggris_1/custom_button_navbar.dart';

class HalamanKuis extends StatefulWidget {
  const HalamanKuis({super.key});

  @override
  _HalamanKuisState createState() => _HalamanKuisState();
}

class _HalamanKuisState extends State<HalamanKuis> {
  // Data quiz berdasarkan kategori
  final Map<String, List<Map<String, dynamic>>> _allQuestions = {
    'Easy': [
      {
        'questionText': 'What is the name of the fruit in the picture?',
        'answers': ['Banana', 'Grape', 'Apple', 'Lychee'],
        'correctAnswer': 'Banana',
        'image': 'assets/images/banana.jpg' // Ditambahkan: Path gambar untuk soal ini
      },
      {
        'questionText': 'What is the name of the fruit in the picture?',
        'answers': ['Kiwi', 'Melon', 'Apple', 'Banana'],
        'correctAnswer': 'Apple',
        'image': 'assets/images/apple.jpg' // Ditambahkan: Path gambar untuk soal ini
      },
       {
        'questionText': 'What is the name of the Animal in the picture?',
        'answers': ['Cat', 'Dog', 'Tiger', 'Lion'],
        'correctAnswer': 'Tiger',
        'image': 'assets/images/tiger.jpg' // Ditambahkan: Path gambar untuk soal ini
      },
      {
        'questionText': 'What is the name of the Animal in the picture?',
        'answers': ['Crocodile', 'Squirrel', 'Deer', 'Bear'],
        'correctAnswer': 'Deer',
        'image': 'assets/images/deer.jpg' // Ditambahkan: Path gambar untuk soal ini
      },
      {
        'questionText': 'What is the name of the Animal in the picture?',
        'answers': ['Pig', 'Cow', 'Chicken', 'Duck'],
        'correctAnswer': 'Chicken',
        'image': 'assets/images/chicken.jpg' // Ditambahkan: Path gambar untuk soal ini
      },
    ],
    'Medium': [
      {
        'questionText': 'Susunlah kata "M-L-O-N-E-E-R-A-W-T" ini agar menjadi sebuah kata!',
        'answers': ['Metermalon', 'Melonwater', 'Watermelon', 'Lomanmeter'],
        'correctAnswer': 'Watermelon'
      },
      {
        'questionText': 'Susunlah kata "A-R-G-C-I-L" ini agar menjadi sebuah kata!',
        'answers': ['Garlic', 'Cirgal', 'Cragil', ''],
        'correctAnswer': 'Garlic'
      },
      {
        'questionText': 'Susunlah kata "S-W-R-R-A-T-Y-E-B-R" ini agar menjadi sebuah kata!',
        'answers': ['Apple', 'Grape', 'Cherry', 'Strawberry'],
        'correctAnswer': 'Strawberry'
      },
      {
        'questionText': 'Susunlah kata "  C-O-O-C-E-I-L-D-R" ini agar menjadi sebuah kata!',
        'answers': ['Lizard', 'Crocodile', 'Lion', 'Crocodeli'],
        'correctAnswer': 'Crocodile'
      },
      {
        'questionText': 'Apa arti dari kata "I-G-R-T-E"?',
        'answers': ['Girte', 'Grite', 'Tiger', 'Trige'],
        'correctAnswer': 'Tiger'
      },
    ],
    'Hard': [
      {
        'questionText': 'Susunlah kata "M-L-O-N-E-E-R-A-W-T" ini agar menjadi sebuah kata!',
        'answers': ['Cucumber', 'Onion', 'Watermelon', 'Lychee'],
        'correctAnswer': 'Watermelon'
      },
      {
        'questionText': 'Susunlah kata "A-R-G-C-I-L" ini agar menjadi sebuah kata!',
        'answers': ['Garlic', 'Eggplant', 'Carrot', 'Broccoli'],
        'correctAnswer': 'Garlic'
      },
      {
        'questionText': 'Susunlah kata "S-W-R-R-A-T-Y-E-B-R" ini agar menjadi sebuah kata!',
        'answers': ['Apple', 'Grape', 'Cherry', 'Strawberry'],
        'correctAnswer': 'Strawberry'
      },
      {
        'questionText': 'Susunlah kata "  C-O-O-C-E-I-L-D-R" ini agar menjadi sebuah kata!',
        'answers': ['Lizard', 'Crocodile', 'Lion', 'Crocodeli'],
        'correctAnswer': 'Crocodile'
      },
      {
        'questionText': 'Apa arti dari kata "I-G-R-T-E"?',
        'answers': ['Girte', 'Grite', 'Tiger', 'Trige'],
        'correctAnswer': 'Tiger'
      },
    ],
  };

  List<Map<String, dynamic>> _questions = [];
  String? _selectedCategory;
  int _questionIndex = 0;
  int _score = 0;
  bool _quizFinished = false;
  bool _categorySelected = false;
  bool _showWelcome = true;

  String? _selectedAnswer;
  bool _hasAnswered = false;

  void _startQuiz() {
    setState(() {
      _showWelcome = false;
    });
  }

  void _selectCategory(String category) {
    setState(() {
      _selectedCategory = category;
      _questions = _allQuestions[category]!;
      _categorySelected = true;
      _questionIndex = 0;
      _score = 0;
      _quizFinished = false;
      _selectedAnswer = null;
      _hasAnswered = false;
    });
  }

  void _answerQuestion(String selectedAnswer) {
    setState(() {
      // Jika user mengganti jawaban, kurangi score jika jawaban sebelumnya benar
      if (_selectedAnswer != null && _selectedAnswer == _questions[_questionIndex]['correctAnswer']) {
        _score--;
      }

      _selectedAnswer = selectedAnswer;
      _hasAnswered = true;

      // Tambah score jika jawaban baru benar
      if (selectedAnswer == _questions[_questionIndex]['correctAnswer']) {
        _score++;
      }
    });
  }

  void _goToNextQuestion() {
    setState(() {
      if (_questionIndex < _questions.length - 1) {
        _questionIndex++;
        _selectedAnswer = null;
        _hasAnswered = false;
      } else {
        _quizFinished = true;
      }
    });
  }

  void _resetQuiz() {
    setState(() {
      _showWelcome = true;
      _categorySelected = false;
      _selectedCategory = null;
      _questionIndex = 0;
      _score = 0;
      _quizFinished = false;
      _selectedAnswer = null;
      _hasAnswered = false;
      _questions = [];
    });
  }

  void _backToWelcome() {
    setState(() {
      _showWelcome = true;
      _categorySelected = false;
      _selectedCategory = null;
      _questionIndex = 0;
      _score = 0;
      _quizFinished = false;
      _selectedAnswer = null;
      _hasAnswered = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          Container(
              color: const Color(0xFF2052BD).withOpacity(0.9),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SafeArea(
                child: Row(
                  children: [
                    // Back button - hanya tampil jika tidak sedang dalam kuis
                    if (!_categorySelected && !_showWelcome)
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: _backToWelcome,
                      )
                    else
                      const SizedBox(width: 48),
                    Expanded(
                      child: Text(
                        _showWelcome
                            ? 'Quiz Bahasa Inggris'
                            : _categorySelected
                                ? 'Quiz - $_selectedCategory'
                                : 'Pilih Tingkat Kesulitan',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          ),
                      ),
                    ),
                    const SizedBox(width: 48), // Placeholder
                  ],
                ),
              ),
            ),
            // Konten Kuis
            Expanded(
              child: _showWelcome
                  ? _buildWelcomeScreen()
                  : !_categorySelected
                      ? _buildCategorySelectionScreen()
                      : _quizFinished
                          ? _buildResultsScreen()
                          : _buildQuestionScreen(),
            ),
            ],
        ),

      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
      );
     }

  Widget _buildWelcomeScreen() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFF2052BD).withOpacity(0.1),
            Colors.white.withOpacity(0.8),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated welcome container
            Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Gambar lingkaran tanpa background biru muda
                  const SizedBox(
                    width: 150,
                    height: 150,
                    child: ClipOval(
                      child: Image(
                        image: AssetImage('assets/images/orang tua.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Welcome text
                  const Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Quiz Bahasa Inggris',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2052BD),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  // Main question
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2052BD).withOpacity(0.05),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: const Color(0xFF2052BD).withOpacity(0.2),
                        width: 1,
                      ),
                    ),
                    child: const Text(
                      'Apakah Anda Sudah Siap?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2052BD),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Tes kemampuan Bahasa Inggris anda bersama Bapak Muliadi\ndengan berbagai tingkat kesulitan',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Start button
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2052BD).withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ElevatedButton(
                onPressed: _startQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2052BD),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    Text(
                      'MULAI QUIZ',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategorySelectionScreen() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Column(
                children: [
                  Icon(
                    Icons.quiz,
                    size: 60,
                    color: Color(0xFF2052BD),
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Pilih Tingkat Kesulitan',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Pilih level yang sesuai dengan kemampuan Anda',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            _buildCategoryButton(
              'Easy',
              'Mudah (5 soal)',
              Colors.green,
              Icons.sentiment_satisfied,
            ),
            const SizedBox(height: 20),
            _buildCategoryButton(
              'Medium',
              'Sedang (5 soal)',
              Colors.orange,
              Icons.sentiment_neutral,
            ),
            const SizedBox(height: 20),
            _buildCategoryButton(
              'Hard',
              'Sulit (5 soal)',
              Colors.red,
              Icons.sentiment_very_dissatisfied,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String category, String description, Color color, IconData icon) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => _selectCategory(category),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: color,
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: color, width: 2),
          ),
          elevation: 0,
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 30,
                color: color,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: color,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuestionScreen() {
    final currentQuestion = _questions[_questionIndex];
    final String? imageUrl = currentQuestion['image']; // Ambil path gambar dari data soal

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            // Progress indicator
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Soal ${_questionIndex + 1} dari ${_questions.length}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: _getCategoryColor(),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      _selectedCategory!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Progress bar
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: LinearProgressIndicator(
                value: (_questionIndex + 1) / _questions.length,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(_getCategoryColor()),
                minHeight: 6,
              ),
            ),

            // **BAGIAN INI YANG DIUBAH UNTUK LAYOUT GAMBAR DAN PERTANYAAN**
            // Gambar (di tengah)
            if (imageUrl != null)
              Center( // Memastikan gambar di tengah
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0), // Mengurangi jarak bawah gambar menjadi 10.0
                  child: ClipRRect( // Menggunakan ClipRRect untuk sudut membulat
                    borderRadius: BorderRadius.circular(12), // Sudut membulat
                    child: Image.asset(
                      imageUrl,
                      height: 180, // Sesuaikan tinggi gambar agar terlihat jelas
                      fit: BoxFit.cover, // Memastikan gambar mengisi area tanpa distorsi
                    ),
                  ),
                ),
              ),

            // Teks pertanyaan (tanpa boxShadow untuk menghilangkan "border")
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
                // boxShadow telah dihapus/dihilangkan di sini
              ),
              child: Text(
                currentQuestion['questionText'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30), // Spasi di bawah pertanyaan

            // ... (bagian jawaban tetap sama)
            ...currentQuestion['answers'].map<Widget>((answer) {
              final isSelected = answer == _selectedAnswer;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: OutlinedButton(
                    onPressed: () => _answerQuestion(answer),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      side: BorderSide(
                        color: isSelected ? _getCategoryColor() : Colors.black,
                        width: isSelected ? 2 : 1,
                      ),
                      backgroundColor: isSelected
                          ? _getCategoryColor().withOpacity(0.1)
                          : Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      answer,
                      style: TextStyle(
                        color: isSelected ? _getCategoryColor() : Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
            const Spacer(),
            if (_hasAnswered)
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: _questionIndex == _questions.length - 1
                        ? () {
                            setState(() {
                              _quizFinished = true;
                            });
                          }
                        : _goToNextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _getCategoryColor(),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text(
                      _questionIndex == _questions.length - 1
                          ? 'Selesai'
                          : 'Soal Berikutnya',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsScreen() {
    double percentage = (_score / _questions.length) * 100;
    String grade = _getGrade(percentage);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                border: Border.all(color: _getCategoryColor(), width: 2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      color: _getCategoryColor(),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      _selectedCategory!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'HASIL AKHIR',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '$_score',
                    style: TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                      color: _getCategoryColor(),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'dari ${_questions.length}',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Jawaban Benar',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: _getCategoryColor().withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '${percentage.toStringAsFixed(1)}%',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: _getCategoryColor(),
                          ),
                        ),
                        Text(
                          'Grade: $grade',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: _getCategoryColor(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ElevatedButton.icon(
                    onPressed: () => _selectCategory(_selectedCategory!),
                    icon: const Icon(Icons.refresh),
                    label: const Text('Ulangi Quiz'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _getCategoryColor(),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ElevatedButton.icon(
                    onPressed: _resetQuiz,
                    icon: const Icon(Icons.home),
                    label: const Text('Pilih Level'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getCategoryColor() {
    switch (_selectedCategory) {
      case 'Easy':
        return Colors.green;
      case 'Medium':
        return Colors.orange;
      case 'Hard':
        return Colors.red;
      default:
        return const Color(0xFF2052BD);
    }
  }

  String _getGrade(double percentage) {
    if (percentage >= 90) return 'A+';
    if (percentage >= 80) return 'A';
    if (percentage >= 70) return 'B';
    if (percentage >= 60) return 'C';
    if (percentage >= 50) return 'D';
    return 'E';
  }
}