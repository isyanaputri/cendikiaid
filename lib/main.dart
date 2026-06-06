import 'package:flutter/material.dart';
import 'screens/splash_screen.dart'; // Sesuaikan dengan folder tempat kamu menyimpannya

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan pita "DEBUG" di pojok kanan atas
      title: 'Cendekia ID',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Aplikasi tetap start dari Splash Screen
    );
  }
}