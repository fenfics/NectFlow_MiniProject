import 'package:flutter/material.dart';

class Chatmodel {
  String name;
  Icon icon;
  bool isGroup;
  String time;
  String currentMessage;
  Chatmodel(
    {required this.name,required this.icon,required this.time,required this.isGroup,required this.currentMessage}
  );
}
