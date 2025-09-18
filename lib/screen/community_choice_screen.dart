import 'package:flutter/material.dart';

class CommunityChoiceScreen extends StatelessWidget {
  const CommunityChoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Container(
          color: Color.fromRGBO(56,124,123,1.0), // โทนสีเดิม
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Which one between',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Create a new community or join an existing one?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // TODO: navigate to Create Community screen
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 140, 144, 144), // สีปุ่มสวย ๆ
                    ),
                    child: Text(
                      'Create Community',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      // TODO: navigate to Join Community screen
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 255, 251, 244), // สีปุ่มสวย ๆ
                    ),
                    child: Text(
                      'Join Community',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // กลับไปหน้า Login
                },
                child: Text(
                  'Back',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
