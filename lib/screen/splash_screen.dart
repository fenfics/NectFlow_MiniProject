// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // หน่วงเวลา 2 วินาทีแล้วไปหน้า login
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // ดึงขนาดหน้าจอเพื่อทำให้โลโก้ปรับขนาดตามอุปกรณ์ (Responsive)
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/splash_background.png'), 
            fit: BoxFit.cover, 
          ),
        ),
        child: Center( // จัดให้อยู่กึ่งกลางหน้าจอ
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // จัดให้อยู่กึ่งกลางแนวตั้ง
            children: [
              // โลโก้ของคุณ, ปรับขนาดตามหน้าจอ
              Image.asset(
                'assets/logo/logo.png', // **ตรวจสอบเส้นทางนี้ให้ตรงกับตำแหน่งไฟล์จริงของคุณ**
                width: screenSize.width * 0.45, // กำหนดความกว้างเป็น 45% ของหน้าจอ
                height: screenSize.width * 0.45, // กำหนดความสูงเพื่อรักษาสัดส่วน
                fit: BoxFit.contain, // ทำให้โลโก้ทั้งหมดปรากฏและรักษาสัดส่วน
              ),
            ],
          ),
        ),
      ),
    );
  }
}
