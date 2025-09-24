import 'package:flutter/material.dart';
import '../app_colors.dart';

class ForgotPasswordPage extends StatelessWidget {

  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Forgot Password'),
        backgroundColor: AppColors.primary,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email, color: AppColors.accent),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {}, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                child: Text('Send Reset Link',style: TextStyle(fontSize: 18, color: AppColors.background)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
