import 'package:flutter/material.dart';
import '../app_colors.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message Page"),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Text("หน้านี้สำหรับการส่งข้อความ" ,style: TextStyle(fontSize: 18, color: AppColors.background)),
      ),
    );
  }
}
