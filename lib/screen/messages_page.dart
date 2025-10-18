// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:nectflowproject/screen/camerascreen.dart';
import '../app_colors.dart';
import 'package:nectflowproject/pages/chatpages.dart';

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
    _tabcontroller = TabController(length: 2, vsync: this, initialIndex: 0);
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
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: AppColors.background),
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext contesxt) {
              return [
                PopupMenuItem(value: "New group", child: Text("New group")),
                PopupMenuItem(
                  value: "Starred messages",
                  child: Text("Starred messages"),
                ),
                PopupMenuItem(value: "Settings", child: Text("Settings")),
              ];
            },
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
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabcontroller,
        children: [
          CameraScreen(),
          Chatpage(),
        ],
      ),
    );
  }
}
