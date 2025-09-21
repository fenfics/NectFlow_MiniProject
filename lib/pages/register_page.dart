import 'package:flutter/material.dart';
import '../app_colors.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Full Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person, color: AppColors.accent),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone, color: AppColors.accent),
              ),
            ),
            SizedBox(height: 20),
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
            
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {}, // TODO: register logic
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: Size(double.infinity, 50),
              ),
              child: Text('Register', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
