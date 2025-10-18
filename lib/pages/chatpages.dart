// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nectflowproject/customUI/customcard.dart';
import 'package:nectflowproject/model/chatmodel.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  _ChatpageState createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  List<Chatmodel> chats = [
    Chatmodel(
      name: "Bryan from korea",
      icon: Icon(Icons.person),
      time: "4:00",
      isGroup: false,
      currentMessage: "Hi guys",
    ),
    Chatmodel(
      name: "Developer G.1",
      icon: Icon(Icons.groups),
      time: "3:50",
      isGroup: true,
      currentMessage: "Hi everyone!!!",
    ),
    Chatmodel(
      name: "Melon",
      icon: Icon(Icons.person),
      time: "3:50",
      isGroup: false,
      currentMessage: "Hi!!!!",
    ),
    Chatmodel(
      name: "Developer G.2",
      icon: Icon(Icons.groups),
      time: "10:25",
      isGroup: true,
      currentMessage: "We need to fix sth",
    ),
    Chatmodel(
      name: "Alice in wonderland",
      icon: Icon(Icons.person),
      time: "18:35",
      isGroup: false,
      currentMessage: "hey what r u doin",
    ),
    Chatmodel(
      name: "Wawa",
      icon: Icon(Icons.person),
      time: "4:00",
      isGroup: false,
      currentMessage: "Hi",
    ),
    Chatmodel(
      name: "Developer G.3",
      icon: Icon(Icons.groups),
      time: "3:50",
      isGroup: true,
      currentMessage: "Hi everyone!!!",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(
          chatmodel: chats[index],
          currentUserId: 'US0019', 
          receiverId: 'US0016', 
        ),
      ),
    );
  }
}
