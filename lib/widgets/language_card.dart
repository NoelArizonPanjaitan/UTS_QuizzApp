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
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
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
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A148C), 
                ),
              ),
              const Spacer(),

              const Icon(Icons.arrow_forward_ios, size: 20, color: Color(0xFF9C27B0)),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: screenHeight * 0.4,
      decoration: const BoxDecoration(
        color: Color(0xFF9C27B0),
      ),
      child: Center(
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
    );
  }
}
