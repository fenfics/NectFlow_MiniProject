import 'package:flutter/material.dart';
import 'package:nectflowproject/pages/login_page.dart';
import '../app_colors.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();
  final TextEditingController _floorController = TextEditingController();
  final TextEditingController _roomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person, color: AppColors.accent),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: TextField(
                    controller: _lastNameController,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      border: const OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person, color: AppColors.accent),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                border: const OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone, color: AppColors.accent),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: const OutlineInputBorder(),
                prefixIcon: Icon(Icons.email, color: AppColors.accent),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: const OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock, color: AppColors.accent),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _buildingController,
              decoration: InputDecoration(
                labelText: 'Building',
                border: const OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city, color: AppColors.accent),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _floorController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Floor',
                border: const OutlineInputBorder(),
                prefixIcon: Icon(Icons.layers, color: AppColors.accent),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _roomController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Room Number',
                border: const OutlineInputBorder(),
                prefixIcon: Icon(Icons.meeting_room, color: AppColors.accent),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // TODO: ส่งข้อมูลไปยัง backend / API
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: Text(
                'Register',
                style: TextStyle(fontSize: 18, color: AppColors.background),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
