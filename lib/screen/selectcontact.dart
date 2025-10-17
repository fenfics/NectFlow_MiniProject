// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:nectflowproject/app_colors.dart';
import 'package:nectflowproject/customUI/buttoncard.dart';
import 'package:nectflowproject/customUI/contactcard.dart';
import 'package:nectflowproject/model/chatmodel.dart';
import 'package:nectflowproject/screen/creategroup.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    List<Chatmodel> contacts = [
      Chatmodel(name: "Dev ev", status: "Developer"),
      Chatmodel(name: "Nect Flow", status: "Project Team"),
      Chatmodel(name: "Alice", status: "Designer"),
      Chatmodel(name: "Bob", status: "Backend Engineer"),
      Chatmodel(name: "Charlie", status: "Frontend Engineer"),
      Chatmodel(name: "Diana", status: "Tester"),
      Chatmodel(name: "Ethan", status: "Database Admin"),
      Chatmodel(name: "Fiona", status: "UI/UX Lead"),
      Chatmodel(name: "George", status: "Scrum Master"),
      Chatmodel(name: "Hannah", status: "Product Owner"),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Contact",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: AppColors.background,
              ),
            ),
            Text(
              "265 contacts",
              style: TextStyle(fontSize: 13, color: AppColors.background),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: AppColors.background, size: 26),
          ),
          PopupMenuButton<String>(
            icon: Icon(Icons.more_vert, color: AppColors.background),
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "Invite a friend",
                child: Text("Invite a friend"),
              ),
              const PopupMenuItem(value: "Contact", child: Text("Contact")),
              const PopupMenuItem(value: "Refresh", child: Text("Refresh")),
              const PopupMenuItem(value: "Help", child: Text("Help")),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 2,
        itemBuilder: (context, index) {
          if (index == 0) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreateGroup()),
                );
              },
              child: const ButtonCard(
                icon: Icons.group_add,
                name: "New Community",
              ),
            );
          } else if (index == 1) {
            return const ButtonCard(
              icon: Icons.person_add,
              name: "New Contact",
            );
          }
          return ContactCard(contact: contacts[index - 2]);
        },
      ),
    );
  }
}
