// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nectflowproject/customUI/customcard.dart';
import '../app_colors.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  _ChatpageState createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.chat_sharp, color: AppColors.primary),
      ),
      body: ListView(
        children: [
          CustomCard(),
          CustomCard(),
          CustomCard(),
        ],
      ),
    );
  }
}