
import 'package:flutter/material.dart';
import 'package:nectflowproject/model/chatmodel.dart';

import '../app_colors.dart';


class AvatarCard extends StatelessWidget {

  final Chatmodel contact;
  const AvatarCard({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2,horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
         Stack(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.secondary,
                radius: 23,
                child: Icon(Icons.person, color: Colors.white, size: 30),
              ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 0, 0),
                    radius: 11,
                    child: Icon(Icons.clear, color: Colors.white, size: 13),
                  ),
                )
            ],
          ),
          Text(contact.name,style: TextStyle(fontSize: 12),)
        ],
      ),
    );
  }
}
