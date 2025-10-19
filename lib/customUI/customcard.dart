import 'package:flutter/material.dart';
import 'package:nectflowproject/app_colors.dart';
import 'package:nectflowproject/model/chatmodel.dart';
import 'package:nectflowproject/screen/individualpage.dart';

class CustomCard extends StatelessWidget {
  final Chatmodel chatmodel;
  final String currentUserId;
  final String receiverId;

  const CustomCard({
    super.key,
    required this.chatmodel,
    this.currentUserId = 'US0022',
    this.receiverId = 'US0019',
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => IndividualPage(
              chatmodel: chatmodel,
              currentUserId: currentUserId,
              receiverId: receiverId,
            ),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: AppColors.secondary,
              radius: 25,
              child: Icon(
                chatmodel.icon?.icon ?? Icons.person,
                color: AppColors.darkGreen,
                size: 33,
              ),
            ),
            title: Text(
              chatmodel.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                const Icon(Icons.done_all, size: 18),
                const SizedBox(width: 3),
                Expanded(
                  child: Text(
                    chatmodel.currentMessage ?? '',
                    style: const TextStyle(fontSize: 13),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            trailing: Text(chatmodel.time ?? ''),
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
