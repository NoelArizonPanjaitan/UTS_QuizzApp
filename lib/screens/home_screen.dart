import 'package:flutter/material.dart';
import '../data/quiz_data.dart';
import '../widgets/language_card.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final ThemeMode currentThemeMode;

  const HomeScreen({
    required this.onThemeToggle,
    required this.currentThemeMode,
    super.key,
  });

  void _startQuiz(BuildContext context, String language) {
    final rawQuestions = quizData[language] ?? [];

    final shuffledQuestions = List<Map<String, dynamic>>.from(rawQuestions);
    shuffledQuestions.shuffle();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => QuizScreen(
          language: language,
          questions: shuffledQuestions,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderSectionWithTheme(
              onThemeToggle: onThemeToggle,
              currentThemeMode: currentThemeMode,
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  LanguageCard(
                    title: 'C++',
                    logo: Image.asset(
                      'assets/images/cplusplus_logo.png',
                      height: 40,
                      width: 40,
                    ),
                    onTap: () => _startQuiz(context, 'C++'),
                  ),
                  const SizedBox(height: 15),

                  LanguageCard(
                    title: 'Java',
                    logo: Image.asset(
                      'assets/images/java_logo.png',
                      height: 40,
                      width: 40,
                    ),
                    onTap: () => _startQuiz(context, 'Java'),
                  ),
                  const SizedBox(height: 15),

                  LanguageCard(
                    title: 'Python',
                    logo: Image.asset(
                      'assets/images/python_logo.png',
                      height: 40,
                      width: 40,
                    ),
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

class HeaderSectionWithTheme extends StatelessWidget {
  final VoidCallback onThemeToggle;
  final ThemeMode currentThemeMode;

  const HeaderSectionWithTheme({
    required this.onThemeToggle,
    required this.currentThemeMode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: screenHeight * 0.4,
      decoration: const BoxDecoration(
        color: Color(0xFF9C27B0),
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: const Icon(
                Icons.dashboard,
                size: 60,
                color: Color(0xFF9C27B0),
              ),
            ),
          ),

          Positioned(
            top: 40,
            right: 20,
            child: IconButton(
              icon: Icon(
                currentThemeMode == ThemeMode.dark
                    ? Icons.light_mode_rounded
                    : Icons.dark_mode_rounded,
                color: Colors.white,
                size: 30,
              ),
              onPressed: onThemeToggle,
            ),
          ),
        ],
      ),
    );
  }
}