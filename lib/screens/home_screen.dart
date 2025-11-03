import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../widgets/language_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _startQuiz(BuildContext context, String language) {
    // Ambil data kuis berdasarkan bahasa yang dipilih
    final questions = quizData[language] ?? [];

    // Tampilkan notifikasi sederhana
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Memulai Kuis $language dengan ${questions.length} soal!')),
    );

    // *** Di sini Anda akan menambahkan navigasi ke QuizScreen ***
    // Contoh: Navigator.push(context, MaterialPageRoute(builder: (ctx) => QuizScreen(language: language, questions: questions)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Bagian Header Ungu
            const HeaderSection(),

            // Bagian Pilihan Bahasa
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  // Pilihan C++
                  LanguageCard(
                    title: 'C++',
                    logo: const Icon(Icons.code, size: 40, color: Color(0xFF0077B6)), // Icon C++
                    onTap: () => _startQuiz(context, 'C++'),
                  ),
                  const SizedBox(height: 15),

                  // Pilihan Java
                  LanguageCard(
                    title: 'Java',
                    logo: const Icon(Icons.coffee, size: 40, color: Color(0xFFD32F2F)), // Icon Java (atau pakai Image.asset)
                    onTap: () => _startQuiz(context, 'Java'),
                  ),
                  const SizedBox(height: 15),

                  // Pilihan Python
                  LanguageCard(
                    title: 'Python',
                    logo: const Icon(Icons.api, size: 40, color: Color(0xFFFFC107)), // Icon Python (atau pakai Image.asset)
                    onTap: () => _startQuiz(context, 'Python'),
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