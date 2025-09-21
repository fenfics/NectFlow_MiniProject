import 'package:flutter/material.dart';
import '../app_colors.dart';
import 'register_page.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('WELCOME!', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: AppColors.primary)),
              SizedBox(height: 40),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email, color: AppColors.accent),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock, color: AppColors.accent),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  
                }, // TODO: login logic
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text('Login', style: TextStyle(fontSize: 18)),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => ForgotPasswordPage()));
                },
                child: Text('Forgot Password?', style: TextStyle(color: AppColors.secondary)),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: TextStyle(color: AppColors.darkGreen)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterPage()));
                    },
                    child: Text('Register', style: TextStyle(color: AppColors.accent)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
