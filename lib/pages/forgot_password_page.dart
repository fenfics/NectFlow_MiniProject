import 'package:flutter/material.dart';
import '../app_colors.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgotPasswordPage({super.key});

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
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email, color: AppColors.accent),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {}, // TODO: forgot password logic
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Send Reset Link', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
