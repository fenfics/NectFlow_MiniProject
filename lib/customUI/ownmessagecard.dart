import 'package:flutter/material.dart';
import 'package:nectflowproject/app_colors.dart';

class OwnmessageCard extends StatelessWidget {
  const OwnmessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          color: AppColors.accent,
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 60, top: 5, bottom: 20),
                child: Text(
                  "Heyyyyyyyyyyyyyyyyyyyyyyyyyyyyy",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: const [
                    Text(
                      "20:00",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.done_all, size: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
