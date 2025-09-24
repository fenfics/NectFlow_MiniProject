import 'package:flutter/material.dart';
import '../app_colors.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายงานบุคคล"),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Text("หน้านี้สำหรับรายงานบุคคล"),
      ),
    );
  }
}
