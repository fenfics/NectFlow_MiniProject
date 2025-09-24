import 'package:flutter/material.dart';
import '../app_colors.dart';

class IssuePage extends StatelessWidget {
  const IssuePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("แจ้งปัญหา"),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Text("หน้านี้สำหรับการแจ้งปัญหา"),
      ),
    );
  }
}
