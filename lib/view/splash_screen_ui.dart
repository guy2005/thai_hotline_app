import 'package:flutter/material.dart';
import 'package:thai_hotline_app/view/home_ui.dart'; // แก้เป็นนำเข้า HomeUi

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override 
  void initState() {
    super.initState(); 
    
    // ทำ SplashScreen หน่วงเวลา 3 วินาที
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (!mounted) return; 
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeUi(), // นำทางไปหน้า HomeUi ศูนย์กลาง
          ),
        );
      },
    );
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: Center( 
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Image.asset(
              'assets/images/hotline.jpg',
              height: 400.0, 
            ),
            const Text(
              'THAI HOTLINE APP',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 10.0), 
            const Text(
              'สายด่วน',
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 229, 92, 82),
              ),
            ),
          ],
        ),
      ),
    );
  }
}