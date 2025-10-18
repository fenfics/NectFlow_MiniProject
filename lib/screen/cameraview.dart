import 'package:flutter/material.dart';

class CameraViewPage extends StatelessWidget {
  const CameraViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.crop_rotate,size: 27,))
        ],
      ),
    );
  }
}