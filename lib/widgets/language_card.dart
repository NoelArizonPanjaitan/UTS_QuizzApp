import 'package:flutter/material.dart';

class LanguageCard extends StatelessWidget {
  final String title;
  final Widget logo;
  final VoidCallback onTap;

  const LanguageCard({
    required this.title,
    required this.logo,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25.0),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: Center(child: logo),
              ),
              const SizedBox(width: 20),

              Text(
                title,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: theme.brightness == Brightness.light
                      ? const Color(0xFF4A148C)
                      : theme.textTheme.titleLarge?.color,
                ),
              ),
              const Spacer(),

              // Ikon Panah
              Icon(Icons.arrow_forward_ios, size: 20, color: theme.primaryColor),
            ],
          ),
        ),
      ),
    );
  }
}

