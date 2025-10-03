import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
            radius: 25,
        ),
        title: Text("WHo??", style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),),
        subtitle: Row(
            children: [
                Icon(Icons.done_all),
                SizedBox(width: 3,),
                Text("Hi Who r you?", style: TextStyle(fontSize: 13))
            ],
        ),
        trailing: Text("18:04"),
    );
  }
}