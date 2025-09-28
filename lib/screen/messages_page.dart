// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';
import '../app_colors.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabcontroller;

  @override
  void initState() {
    super.initState();
    _tabcontroller = TabController(length: 4, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Messages", style: TextStyle(color: AppColors.background)),
        backgroundColor: AppColors.primary,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: AppColors.background),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: AppColors.background),
          ),
        ],
        bottom: TabBar(
          controller: _tabcontroller,
          labelColor: AppColors.background, 
          unselectedLabelColor: Colors.white70, 
          indicatorColor: AppColors.background, 
          indicatorSize: TabBarIndicatorSize.tab,  
          tabs: const [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: "Chats"),
            Tab(text: "Notifications"),
            Tab(text: "Calls"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabcontroller,
        children: [
         Text("Camera"),
         Text("Chats"),
         Text("Notification"),
         Text("Calls"),
      ],
      ),
    );
  }
}
