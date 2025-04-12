import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/search_page.dart';

void main() {
  runApp(const EcoGlamApp());
}

class EcoGlamApp extends StatelessWidget {
  const EcoGlamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoGlam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {'/search': (context) => const SearchPage()},
    );
  }
}
