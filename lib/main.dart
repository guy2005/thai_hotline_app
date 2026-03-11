import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_hotline_app/view/splash_screen_ui.dart';

void main() {
  runApp(const ThaiHotlineApp());
}

class ThaiHotlineApp extends StatelessWidget {
  const ThaiHotlineApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreenUi(), // แก้เป็น Ui ให้ตรงกับหน้าไฟล์
      theme: ThemeData(
        textTheme: GoogleFonts.kanitTextTheme(),
      ), 
    );
  }
}