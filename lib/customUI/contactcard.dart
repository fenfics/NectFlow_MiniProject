// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:nectflowproject/app_colors.dart';
import 'package:nectflowproject/model/chatmodel.dart';

class ContactCard extends StatefulWidget {
  final Chatmodel contact;
  const ContactCard({super.key, required this.contact});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          widget.contact.select = !(widget.contact.select);
        });
      },
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.secondary,
              radius: 23,
              child: Icon(Icons.person, color: Colors.white, size: 30),
            ),
            if (widget.contact.select == true)
              Positioned(
                bottom: 4,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 11,
                  child: Icon(Icons.check, color: Colors.white, size: 18),
                ),
              )
          ],
        ),
      ),
      title: Text(
        widget.contact.name,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(widget.contact.status ?? '', style: TextStyle(fontSize: 13)),
    );
  }
}
