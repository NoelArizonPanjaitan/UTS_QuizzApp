import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../widgets/language_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _startQuiz(BuildContext context, String language) {
    final questions = quizData[language] ?? [];

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Memulai Kuis $language dengan ${questions.length} soal!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const HeaderSection(),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  LanguageCard(
                    title: 'C++',
                    logo: const Icon(Icons.code, size: 40, color: Color(0xFF0077B6)),
                    onTap: () => _startQuiz(context, 'C++'),
                  ),
                  const SizedBox(height: 15),

                  LanguageCard(
                    title: 'Java',
                    logo: const Icon(Icons.coffee, size: 40, color: Color(0xFFD32F2F)),
                    onTap: () => _startQuiz(context, 'Java'),
                  ),
                  const SizedBox(height: 15),

                  LanguageCard(
                    title: 'Python',
                    logo: const Icon(Icons.api, size: 40, color: Color(0xFFFFC107)),
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