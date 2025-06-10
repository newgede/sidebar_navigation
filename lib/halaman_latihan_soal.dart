import 'package:flutter_bahasa_inggris_1/custom_button_navbar.dart';
import 'package:flutter_bahasa_inggris_1/halaman_utama.dart';
import 'package:flutter/material.dart';

class HalamanLatihanSoal extends StatefulWidget {
  const HalamanLatihanSoal({super.key});

  @override
  State<HalamanLatihanSoal> createState() => _HalamanLatihanSoalState();
}

class _HalamanLatihanSoalState extends State<HalamanLatihanSoal> {
  int currentQuestionIndex = -1;
  int? selectedOptionIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'What is this?',
      'options': ['Elephant', 'Banana', 'Grape', 'Yellow'],
      'answerIndex': 1,
      'image': 'assets/images/banana.jpg',
    },
     {
      'question': 'What is this?',
      'options': ['Nose', 'Mouth', 'Eyebrow', 'Goat'],
      'answerIndex': 1,
      'image': 'assets/images/mouth.jpg',
    },
     {
      'question': 'What is this?',
      'options': ['Lung', 'Mouth', 'Eyebrow', 'Soursop'],
      'answerIndex': 0,
      'image': 'assets/images/lung.jpg',
    },
     {
      'question': 'What is this?',
      'options': ['Nose', 'Mouth', 'Eyebrow', 'Lily'],
      'answerIndex': 3,
      'image': 'assets/images/lily.jpg',
    },
     {
      'question': 'What is this?',
      'options': ['Lotus', 'Mouse', 'Grape', 'Lily'],
      'answerIndex': 0,
      'image': 'assets/images/lotus.jpg',
    },
     {
      'question': 'What is this?',
      'options': ['Kidney', 'Mouth', 'Lung', 'Nose'],
      'answerIndex': 0,
      'image': 'assets/images/kidney.jpg',
    },
     {
      'question': 'What is this?',
      'options': ['Door', 'Goat', 'Mouse', 'Dog'],
      'answerIndex': 3,
      'image': 'assets/images/dog.jpg',
    },
     {
      'question': 'What is this?',
      'options': ['Durian', 'Mouth', 'Dog', 'Goat'],
      'answerIndex': 0,
      'image': 'assets/images/Durian.jpg',
    },
     {
      'question': 'What is this?',
      'options': ['Heart', 'Mouth', 'Kidney', 'Goat'],
      'answerIndex': 0,
      'image': 'assets/images/heart.jpg',
    },
      {
      'question': 'What is this?',
      'options': ['Tiger', 'Goat', 'Mouse', 'Cow'],
      'answerIndex': 3,
      'image': 'assets/images/cow.jpg',
     } 

  ];

  void handleOptionTap(int index) {
    if (answerChecked) return;
    setState(() {
      selectedOptionIndex = index;
      answerChecked = true;
    });
  }

  void handleNext() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOptionIndex = null;
        answerChecked = false;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Selesai!'),
          content: const Text('Kamu telah menyelesaikan semua soal.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HalamanUtama()),
                );
              },
              child: const Text('Tutup'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'LATIHAN SOAL',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: currentQuestionIndex == -1
            ? _buildIntroSlide()
            : _buildQuestionContent(questions[currentQuestionIndex]),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
    );
  }

  Widget _buildIntroSlide() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Belajar bahasa, membuka jendela dunia',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: handleNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[800],
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Mulai',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionContent(Map<String, dynamic> question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (question['image'] != null) ...[
          Center(
            child: Image.asset(
              question['image'],
              height: 150,
            ),
          ),
          const SizedBox(height: 20),
        ],
        Text(
          question['question'],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(
          question['options'].length,
          (index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: _buildOption(
              index,
              question['options'][index],
              question['answerIndex'],
            ),
          ),
        ),
        const Spacer(),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            onPressed: handleNext,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[800],
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: const Text(
              'Next',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOption(int index, String text, int correctAnswerIndex) {
    Color? buttonColor;

    if (answerChecked) {
      if (index == selectedOptionIndex) {
        buttonColor = (index == correctAnswerIndex) ? Colors.green : Colors.red;
      } else if (index == correctAnswerIndex) {
        buttonColor = Colors.green;
      }
    }

    return OutlinedButton(
      onPressed: () => handleOptionTap(index),
      style: OutlinedButton.styleFrom(
        backgroundColor: buttonColor,
        side: const BorderSide(color: Colors.black),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '${String.fromCharCode(65 + index)}. $text', 
          style: TextStyle(
            color: buttonColor != null ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}