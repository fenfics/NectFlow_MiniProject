import 'package:flutter/material.dart';

class Chatmodel {
  String name;
  Icon? icon;
  bool? isGroup;
  String? time;
  String? currentMessage;
  String? status;
  bool select;
  Chatmodel({
    required this.name,
    this.icon,
    this.isGroup,
    this.time,
    this.currentMessage,
    this.status,
    this.select = false,
  });
}
