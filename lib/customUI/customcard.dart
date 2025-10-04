import 'package:flutter/material.dart';
import 'package:nectflowproject/app_colors.dart';
import 'package:nectflowproject/model/chatmodel.dart';
import 'package:nectflowproject/screen/individualpage.dart';

class CustomCard extends StatelessWidget {
  final Chatmodel chatmodel;
  const CustomCard({super.key, required this.chatmodel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> IndividualPage(chatmodel: chatmodel,)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.secondary,
              radius: 25,
              child: Icon(
                chatmodel.icon.icon,
                color: AppColors.darkGreen,
                size: 33,
              ),
            ),
            title: Text(
              chatmodel.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all, size: 18),
                const SizedBox(width: 3),
                Text(
                  chatmodel.currentMessage,
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
            trailing: Text(chatmodel.time),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(thickness: 1),
          ),
        ],
      ),
    );
  }
}
