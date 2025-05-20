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
      'correctAnswer': 'Harimau'
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
      'questionText': 'Apa arti dari kata "KNIFE"',
      'answers': ['Jambu', 'Lampu', 'Uang', 'Pisau'],
      'correctAnswer': 'Pisau'
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
      body: Column(
        children: [
          // App Bar (tanpa tombol back)
          Container(
            color: const Color(0xFF2052BD),
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


      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildQuestionScreen() {
    final currentQuestion = _questions[_questionIndex]; //fungsi untuk membangun layar pertanyaan

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Text(
            currentQuestion['questionText'],
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...currentQuestion['answers'].map<Widget>((answer) { 
            final isSelected = answer == _selectedAnswer;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: OutlinedButton(
                onPressed: () => _answerQuestion(answer),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  side: const BorderSide(color: Colors.black),
                  backgroundColor:
                      isSelected ? Colors.grey[300] : Colors.white,
                ),
                child: Text(
                  answer,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
          const Spacer(),
          if (_hasAnswered)
            Align(
              alignment: Alignment.centerRight,
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
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildResultsScreen() {
    final scorePercentage = (_score / _questions.length) * 100; // fungsi untuk menampilkan hasil akhir 

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
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
                const SizedBox(height: 10),
                Text(
                  '${scorePercentage.toInt()}',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightBlue,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Jumlah Benar: $_score',
                  style: const TextStyle(fontSize: 16),
                  
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
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
              'Finish Quiz',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

