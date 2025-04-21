import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/search_page.dart';
import 'pages/welcome_page.dart';
import 'pages/register_page.dart';
import 'pages/signin_page.dart';
import 'pages/cart_page.dart';
import 'package:ecoglam/pages/account_page.dart';
import 'package:ecoglam/pages/payment_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/payment': (context) => const PaymentPage(),
        '/account': (context) => const AccounttPage(),
      },
    );
  }
}
