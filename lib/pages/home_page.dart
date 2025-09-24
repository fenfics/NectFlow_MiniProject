import 'package:flutter/material.dart';
import '../app_colors.dart';
import './messages_page.dart';
import  './report_person_page.dart';
import './report_issue_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => MessagePage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Sent Message" ,style: TextStyle(fontSize: 18, color: AppColors.background)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ReportPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Report Person",style: TextStyle(fontSize: 18, color: AppColors.background)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => IssuePage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text("Report Issue",style: TextStyle(fontSize: 18, color: AppColors.background)),
            ),
          ],
        ),
      ),
    );
  }
}
