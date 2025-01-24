import 'package:flutter/material.dart';
import 'pages/login.dart';
import 'pages/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug banner'ı gizle
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark, // Karanlık tema varsayılan
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF1E2833), // Genel arka plan rengi
      ),
      initialRoute: '/', // Başlangıç rotası
      routes: {
        '/': (context) => const LoginPage(), // Login sayfası
        '/signup': (context) => const SignupPage(), // Signup sayfası
      },
    );
  }
}
