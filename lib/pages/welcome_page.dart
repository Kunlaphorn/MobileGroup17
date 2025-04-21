import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFEF8),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', height: 150),
              const SizedBox(height: 32),
              const Text.rich(
                TextSpan(
                  text: "Welcome to ",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "EcoGlam!",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                '"Glow with Nature, Shine with Care"',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/signin'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEAC78C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text(
                  "Sign in",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF81B971),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  minimumSize: const Size(double.infinity, 48),
                ),
                child: const Text(
                  "Register",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
