// ignore_for_file: library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'home_page.dart';
import '../app_colors.dart';
import 'register_page.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? selectedRole; // เก็บค่าที่เลือก
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final List<String> roles = ['Admin', 'Resident', 'Manager'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('WELCOME!',
                  style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary)),
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
              
              // Dropdown สำหรับเลือก Role
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Role',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person, color: AppColors.accent),
                ),
                value: selectedRole,
                items: roles
                    .map((role) => DropdownMenuItem(
                          value: role,
                          child: Text(role),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedRole = value;
                  });
                },
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (selectedRole == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please select a role!")),
                    );
                    return;
                  }
                  // ทดสอบ login
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text(
                            "Login Successful as $selectedRole!!!")),
                  );
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding:
                      EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18, color: AppColors.background),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => ForgotPasswordPage()));
                },
                child:
                    Text('Forgot Password?', style: TextStyle(color: AppColors.secondary)),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: TextStyle(color: AppColors.darkGreen)),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => RegisterPage()));
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
