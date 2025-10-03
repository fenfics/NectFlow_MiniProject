import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screen/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My NectFlow App',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(
        Theme.of(context).textTheme,
        ),
      ),
      home: LoginPage(),
    );
  }
}
