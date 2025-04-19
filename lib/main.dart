<<<<<<< HEAD
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/search_page.dart';
import 'pages/welcome_page.dart';
import 'pages/register_page.dart';
import 'pages/signin_page.dart';
import 'pages/cart_page.dart';
import 'package:ecoglam/pages/account_page.dart'; // นำเข้า AccountPage
import 'firebase_options.dart'; // ใช้ Firebase options ที่ถูกสร้างมาในโปรเจกต์

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initializing Firebase
  await Firebase.initializeApp(
    options:
        DefaultFirebaseOptions
            .currentPlatform, // ใช้ Firebase options สำหรับ platform ที่ใช้
  );
=======
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/search_page.dart';
import 'pages/product_page.dart';

void main() {
>>>>>>> fb9e8eb26864dd0d7e593d3b8db755f11f7df4c4
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
<<<<<<< HEAD
        fontFamily: 'Inter',
      ),
      debugShowCheckedModeBanner: false,

      home: const WelcomePage(),

      routes: {
        '/home': (context) => const HomePage(),
        '/search': (context) => const SearchPage(),
        '/register': (context) => const RegisterPage(),
        '/signin': (context) => const SignInPage(),
        '/cart': (context) => const CartPage(),
        // เพิ่มเส้นทางสำหรับ AccountPage
      },
=======
        fontFamily: 'Arial',
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {'/search': (context) => const SearchPage()},
>>>>>>> fb9e8eb26864dd0d7e593d3b8db755f11f7df4c4
    );
  }
}
