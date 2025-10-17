import 'package:flutter/material.dart';
import 'package:nectflowproject/app_colors.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    super.key,
    required this.name,
    required this.icon,
  });

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 42, 190, 1),
        radius: 23,
        child: Icon(icon, color: AppColors.background, size: 28),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
