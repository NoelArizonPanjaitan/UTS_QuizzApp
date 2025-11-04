import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  final String language;
  final List<Map<String, dynamic>> questions;

  const QuizScreen({
    required this.language,
    required this.questions,
    super.key,
  });

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  String? _selectedAnswer;
  bool _answered = false;

  void _answerQuestion(String selectedAnswer) {
    if (_answered) return;

    setState(() {
      _selectedAnswer = selectedAnswer;
      _answered = true;
    });

    final currentQuestion = widget.questions[_currentQuestionIndex];
    final correctAnswer = currentQuestion['correctAnswer'] as String;

    if (selectedAnswer == correctAnswer) {
      setState(() {
        _score++;
      });
    }
  }

  void _nextQuestion() {
    if (!_answered) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Silakan pilih jawaban terlebih dahulu!')),
      );
      return;
    }

    if (_currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = null;
        _answered = false;
      });
    } else {
      _showResult();
    }
  }

  void _showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Kuis Selesai!'),
          content: Text('Skor Akhir Anda: $_score dari ${widget.questions.length} soal.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Selesai'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _getLanguageLogo() {
    String imagePath;
    switch (widget.language) {
      case 'C++':
        imagePath = 'assets/images/cplusplus_logo.png';
        break;
      case 'Java':
        imagePath = 'assets/images/java_logo.png';
        break;
      case 'Python':
        imagePath = 'assets/images/python_logo.png';
        break;
      default:
        return const Icon(Icons.quiz, size: 60, color: Colors.white);
    }
    return Image.asset(
      imagePath,
      height: 60,
      width: 60,
    );
  }

  BorderSide _getAnswerBorder(String answer) {
    final theme = Theme.of(context);

    if (!_answered) {
      return BorderSide(color: theme.dividerColor, width: 1);
    }

    final correctAnswer = widget.questions[_currentQuestionIndex]['correctAnswer'] as String;

    if (answer == correctAnswer) {
      return const BorderSide(color: Colors.green, width: 3);
    } else if (answer == _selectedAnswer) {
      return const BorderSide(color: Colors.red, width: 3);
    }
    return BorderSide(color: theme.dividerColor, width: 1);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (widget.questions.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Kuis ${widget.language}')),
        body: const Center(child: Text('Tidak ada soal untuk kuis ini.')),
      );
    }

    final currentQuestion = widget.questions[_currentQuestionIndex];
    final questionText = currentQuestion['question'] as String;
    final answers = currentQuestion['answers'] as List<String>;
    final correctAnswer = currentQuestion['correctAnswer'] as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('Kuis ${widget.language}'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              color: theme.primaryColor,
            ),
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: theme.cardColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: _getLanguageLogo(),
              ),
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Soal ${_currentQuestionIndex + 1} dari ${widget.questions.length}',
                    style: TextStyle(
                      fontSize: 18,
                      color: theme.textTheme.bodySmall?.color,
                    ),
                  ),
                  const SizedBox(height: 10),

                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Text(
                        questionText,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  ...answers.map((answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: OutlinedButton(
                        onPressed: () => _answerQuestion(answer),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          side: _getAnswerBorder(answer),
                          elevation: theme.brightness == Brightness.light ? 2 : 0,
                        ),
                        child: Text(
                          answer,
                          style: TextStyle(
                            fontSize: 18,
                            color: _selectedAnswer == answer && _answered
                                ? (answer == correctAnswer ? Colors.green : Colors.red)
                                : theme.textTheme.bodyMedium?.color,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: _nextQuestion,
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                _currentQuestionIndex < widget.questions.length - 1 ? 'Next' : 'Finish Quiz',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Skor Sementara: $_score',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: theme.brightness == Brightness.light
                ? const Color(0xFF4A148C)
                : Colors.white70,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}