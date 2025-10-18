// ignore_for_file: avoid_print, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:nectflowproject/app_colors.dart';
import 'package:nectflowproject/customUI/contactcard.dart';
import 'package:nectflowproject/model/chatmodel.dart';

import '../customUI/avatarcad.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
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
  List<Chatmodel> groups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: AppColors.background,
              ),
            ),
            Text(
              "Add participants",
              style: TextStyle(fontSize: 13, color: AppColors.background),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: AppColors.background, size: 26),
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(height: groups.length > 0 ? 90 : 10);
              }
              return InkWell(
                onTap: () {
                  if (contacts[index].select == true) {
                    setState(() {
                      groups.remove(contacts[index - 1]);
                      contacts[index - 1].select = false;
                    });
                  } else {
                    setState(() {
                      groups.add(contacts[index - 1]);
                      contacts[index - 1].select = true;
                    });
                  }
                },
                child: ContactCard(contact: contacts[index - 1]),
              );
            },
          ),
          groups.length > 0
              ? Column(
                  children: [
                    Container(
                      height: 76,
                      color: AppColors.background,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          if (contacts[index].select == true) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  groups.remove(contacts[index]);
                                  contacts[index].select = false;
                                });
                              },
                              child: AvatarCard(contact: contacts[index]),
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                    Divider(thickness: 1, height: 1),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
