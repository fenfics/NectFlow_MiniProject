import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(   // ✅ บังคับเต็มจอ
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isWide = constraints.maxWidth > 700;

            return isWide
                ? Row(
                    children: [
                      Expanded(child: _buildLeftSide()),
                      Expanded(child: _buildRightSide(context)),
                    ],
                  )
                : Column(
                    children: [
                      Expanded(flex: 2, child: _buildLeftSide()),
                      Expanded(flex: 3, child: _buildRightSide(context)),
                    ],
                  );
          },
        ),
      ),
    );
  }

  Widget _buildLeftSide() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Image.asset(
          "assets/images/login_illustration.png",
          width: 600,
        ),
      ),
    );
  }

  Widget _buildRightSide(BuildContext context) {
    return Container(
      color: const Color(0xFF1E3A3A),
      padding: const EdgeInsets.all(32),
      child: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome!",
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                _buildTextField(Icons.person, "Your name"),
                const SizedBox(height: 16),
                _buildTextField(Icons.email, "Your e-mail"),
                const SizedBox(height: 16),
                _buildTextField(Icons.key, "Create password", obscure: true),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[400],
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Create account"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Sign in"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint,
      {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
