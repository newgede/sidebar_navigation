
import 'package:flutter/material.dart';
import 'package:flutter_bahasa_inggris_1/custom_button_navbar.dart';
import 'package:flutter_bahasa_inggris_1/halaman_utama.dart';

class HalamanLatihanSoal extends StatefulWidget {
  const HalamanLatihanSoal({super.key});

  @override
  State<HalamanLatihanSoal> createState() => _HalamanLatihanSoalState();
}

class _HalamanLatihanSoalState extends State<HalamanLatihanSoal> {
  int currentQuestionIndex = 0;
  int? selectedOptionIndex;
  bool answerChecked = false;

  final List<Map<String, dynamic>> questions = [
    {
      'question': 'Apa arti dari kata “Banana”?',
      'options': ['Gajah', 'Pisang', 'Anggur', 'Meja'],
      'answerIndex': 1,
    },
    {
      'question': 'Apa arti dari kata “Table”?',
      'options': ['Kursi', 'Lemari', 'Meja', 'Pintu'],
      'answerIndex': 2,
    },
    {
      'question': 'Apa arti dari kata “Cat”?',
      'options': ['Kucing', 'Anjing', 'Ayam', 'Kambing'],
      'answerIndex': 0,
    },
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
    final currentQuestion = questions[currentQuestionIndex];

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentQuestion['question'],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            ...List.generate(
              currentQuestion['options'].length,
              (index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: _buildOption(
                  index,
                  currentQuestion['options'][index],
                  currentQuestion['answerIndex'],
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
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 2),
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
          text,
          style: TextStyle(
            color: buttonColor != null ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
