import 'package:flutter/material.dart';
import 'package:flutter_bahasa_inggris_1/custom_button_navbar.dart';

class HalamanKuis extends StatefulWidget {
  @override
  _HalamanKuisState createState() => _HalamanKuisState();
}

class _HalamanKuisState extends State<HalamanKuis> {
  final List<Map<String, dynamic>> _questions = [
   {
      'questionText': 'Apa arti dari kata "BANANA"?',
      'answers': ['PISANG', 'SINGA', 'APEL', 'HARIMAU'],
      'correctAnswer': 'PISANG'
    },
     {
      'questionText': 'Apa arti dari kata "SLEEP"?',
      'answers': ['Hutang', 'Tidur', 'Kandung', 'Rumput'],
      'correctAnswer': 'Tidur' 
    },
    {
      'questionText': 'Apa arti dari kata "TIGER"?',
      'answers': ['Batu', 'Sapi', 'Bandung', 'Harimau'],
      'correctAnswer': 'Harimau'
    },
    {
      'questionText': 'Apa arti dari kata "APPLE"?',
      'answers': ['Babi', 'Ayam', 'Anggur', 'Apel'],
      'correctAnswer': 'Apel'
    },
    {
      'questionText': 'Apa arti dari kata "TABLE"?',
      'answers': ['Pintar', 'Muliadi', 'Meja', 'Baju'],
      'correctAnswer': 'Meja'
    },
    {
      'questionText': 'Apa arti dari kata "YELLOW"',
      'answers': ['Biru', 'Merah', 'Kuning', 'Pisau'],
      'correctAnswer': 'Kuning'
    },
    {
      'questionText': 'Apa arti dari kata "CAR"',
      'answers': ['Lampu', 'Mobil', 'Motor', 'Pisau'],
      'correctAnswer': 'Mobil'
    },
    {
      'questionText': 'Apa arti dari kata "DOG"',
      'answers': ['Tupai', 'Singa', 'Anjing', 'Pisau'],
      'correctAnswer': 'Anjing'
    },
    {
      'questionText': 'Apa arti dari kata "KNIFE"',
      'answers': ['Jambu', 'Lampu', 'Uang', 'Pisau'],
      'correctAnswer': 'Pisau'
    },
    {
      'questionText': 'Apa arti dari kata "WATER"',
      'answers': ['Api', 'Air', 'Uang', 'Pisau'],
      'correctAnswer': 'Air '
    },
  ];

  int _questionIndex = 0;
  int _score = 0;
  bool _quizFinished = false;

  String? _selectedAnswer;
  bool _hasAnswered = false;

  void _answerQuestion(String selectedAnswer) {
    if (!_hasAnswered) {
      setState(() {
        _selectedAnswer = selectedAnswer;
        _hasAnswered = true;
        if (selectedAnswer == _questions[_questionIndex]['correctAnswer']) {
          _score++;
        }
      });
    }
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
      // Opsi 1: Background image untuk seluruh body
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpeg'), // Ganti dengan path gambar Anda
            fit: BoxFit.cover, // Untuk menutupi seluruh area
            // Alternatif fit options:
            // fit: BoxFit.fill,     // Stretch gambar
            // fit: BoxFit.contain,  // Fit dengan aspect ratio
            // fit: BoxFit.fitWidth, // Fit sesuai lebar
            // fit: BoxFit.fitHeight,// Fit sesuai tinggi
          ),
        ),
        child: Column(
          children: [
            // App Bar (tanpa tombol back)
            Container(
              // Opsi 2: Background semi-transparan untuk app bar
              color: const Color(0xFF2052BD).withOpacity(0.9),
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: SafeArea(
                child: Row(
                  children: const [
                    SizedBox(width: 48), // Placeholder
                    Expanded(
                      child: Text(
                        'Quiz',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          ),
                      ),
                    ),
                    SizedBox(width: 48), // Placeholder
                  ],
                ),
              ),
            ),

            // Konten Kuis
            Expanded(
              child: _quizFinished
                  ? _buildResultsScreen()
                  : _buildQuestionScreen(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildQuestionScreen() {
    final currentQuestion = _questions[_questionIndex];

    return Container(
      // Opsi 3: Background dengan overlay untuk content area
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8), // Semi-transparan overlay
        // Atau gunakan gradient overlay:
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [
        //     Colors.white.withOpacity(0.9),
        //     Colors.white.withOpacity(0.7),
        //   ],
        // ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            // Opsi 4: Container dengan background untuk pertanyaan
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
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
            const SizedBox(height: 30),
            ...currentQuestion['answers'].map<Widget>((answer) { 
              final isSelected = answer == _selectedAnswer;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    // Background untuk button dengan shadow
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
                      side: const BorderSide(color: Colors.black),
                      backgroundColor: isSelected 
                          ? Colors.blue[100]!.withOpacity(0.8)
                          : Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      answer,
                      style: const TextStyle(
                        color: Colors.black,
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
                      backgroundColor: const Color(0xFF2052BD),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text(
                      _questionIndex == _questions.length - 1
                          ? 'Finish'
                          : 'Next Question',
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
    return Container(
      // Background dengan overlay untuk hasil
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.95),
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'HASIL AKHIR',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '$_score',
                    style: const TextStyle(
                      fontSize: 72,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
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
                ],
              ),
            ),
            const SizedBox(height: 40),
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
              child: ElevatedButton(
                onPressed: _resetQuiz,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2052BD),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  'Ulangi Quiz',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
