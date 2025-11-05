import 'package:flutter/material.dart';
import '../data/app_themes.dart';
import 'home_screen.dart';

class WelcomeScreen extends StatefulWidget {
  final VoidCallback onThemeToggle;
  final ThemeMode currentThemeMode;

  const WelcomeScreen({
    required this.onThemeToggle,
    required this.currentThemeMode,
    super.key,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final TextEditingController _nameController = TextEditingController();

  void _startApp(BuildContext context) {
    final userName = _nameController.text.trim();
    if (userName.isEmpty) {
      // Tampilkan notifikasi jika nama kosong
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama tidak boleh kosong!')),
      );
      return;
    }

    // Navigasi ke HomeScreen dan hapus WelcomeScreen dari stack navigasi
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          onThemeToggle: widget.onThemeToggle,
          currentThemeMode: widget.currentThemeMode,
          userName: userName, // Meneruskan nama pengguna
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Ikon tema di sudut kanan atas
    final themeButton = Positioned(
      top: 40,
      right: 20,
      child: IconButton(
        icon: Icon(
          widget.currentThemeMode == ThemeMode.dark
              ? Icons.light_mode_rounded
              : Icons.dark_mode_rounded,
          color: Colors.white,
          size: 30,
        ),
        onPressed: widget.onThemeToggle,
      ),
    );

    return Scaffold(
      body: Stack(
        children: [
          // Header Ungu
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              color: primaryColor,
            ),
            child: Center(
              child: Text(
                'Quiz Pemrograman',
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          themeButton, // Tombol tema di atas header

          // Card Input Nama
          Center(
            child: Card(
              margin: const EdgeInsets.all(30),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Masukkan Nama Anda',
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nama Pengguna',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      onSubmitted: (_) => _startApp(context), // Bisa tekan enter
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () => _startApp(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Mulai Aplikasi', style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}