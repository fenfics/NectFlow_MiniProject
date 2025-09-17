import 'package:flutter/material.dart';
import 'package:nectflowproject/screen/login.dart';
//import 'package:nectflowproject/screen/splash_screen.dart'; // <--- เพิ่มบรรทัดนี้

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NectFlowApp',
      routes: {
        '/': (context) => const LoginScreen(),
      },
    );
  }
}