// ignore_for_file: sized_box_for_whitespace

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nectflowproject/app_colors.dart';
import 'package:nectflowproject/model/chatmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IndividualPage extends StatefulWidget {
  final Chatmodel chatmodel;
  final String currentUserId;
  final String receiverId; 
  
  const IndividualPage({
    super.key, 
    required this.chatmodel,
    required this.currentUserId,
    required this.receiverId,
  });

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusnode = FocusNode();
  TextEditingController messageController = TextEditingController();
  bool isSending = false;
  List<Map<String, dynamic>> messages = [];
  bool isLoading = true;
  ScrollController scrollController = ScrollController();
  
  @override
  void initState() {
    super.initState();
    loadMessages();
    
    focusnode.addListener(() {
      if (focusnode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  Future<void> loadMessages() async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse(
      'http://localhost:8080/messages?user=${widget.currentUserId}&partner=${widget.receiverId}'
    );
    
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          messages = data.cast<Map<String, dynamic>>();
          isLoading = false;
        });
        
        // เลื่อนลงล่างสุด
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (scrollController.hasClients) {
            scrollController.jumpTo(scrollController.position.maxScrollExtent);
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error loading messages: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  // ส่งข้อความ
  Future<void> sendMessage() async {
    if (messageController.text.trim().isEmpty) {
      return;
    }

    final messageText = messageController.text.trim();
    
    setState(() {
      isSending = true;
    });

    final url = Uri.parse('http://localhost:8080/send-message');
    
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'sender': widget.currentUserId,
          'receiver': widget.receiverId,
          'message': messageText,
        }),
      );

      if (response.statusCode == 200) {
        messageController.clear();
        // โหลดข้อความใหม่
        await loadMessages();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Fail sending')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('error: $e')),
      );
    } finally {
      setState(() {
        isSending = false;
      });
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    focusnode.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.secondary,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: AppBar(
              backgroundColor: AppColors.primary,
              leadingWidth: 70,
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.arrow_back, size: 22, color: Colors.white),
                    const SizedBox(width: 5),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: AppColors.secondary,
                      child: Icon(
                        widget.chatmodel.icon?.icon ?? Icons.person,
                        color: AppColors.background,
                        size: 33,
                      ),
                    ),
                  ],
                ),
              ),
              title: InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.chatmodel.name,
                        style: const TextStyle(
                          fontSize: 18.5,
                          fontWeight: FontWeight.bold,
                          color: AppColors.background,
                        ),
                      ),
                      const Text(
                        "online",
                        style: TextStyle(fontSize: 13, color: Colors.white70),
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.video_call, color: AppColors.background),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.call, color: AppColors.background),
                ),
                PopupMenuButton<String>(
                  icon: const Icon(Icons.more_vert, color: AppColors.background),
                  onSelected: (value) {
                    print(value);
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: "View Contact",
                      child: Text("View Contact"),
                    ),
                    const PopupMenuItem(
                      value: "Refresh",
                      child: Text("Refresh"),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height - 140,
                  child: isLoading
                      ? Center(child: CircularProgressIndicator())
                      : messages.isEmpty
                          ? Center(
                              child: Text(
                                'empty message\n',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                            )
                          : ListView.builder(
                              controller: scrollController,
                              itemCount: messages.length,
                              itemBuilder: (context, index) {
                                final msg = messages[index];
                                final isMe = msg['SenderID'] == widget.currentUserId;
                                
                                return Align(
                                  alignment: isMe 
                                      ? Alignment.centerRight 
                                      : Alignment.centerLeft,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: 5, 
                                      horizontal: 10
                                    ),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: isMe 
                                          ? AppColors.accent 
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    constraints: BoxConstraints(
                                      maxWidth: MediaQuery.of(context).size.width * 0.7,
                                    ),
                                    child: Text(
                                      msg['Message'] ?? '',
                                      style: TextStyle(
                                        color: isMe ? Colors.white : Colors.black87,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 55,
                            child: Card(
                              margin: EdgeInsets.only(left: 2, right: 2, bottom: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextFormField(
                                controller: messageController,
                                focusNode: focusnode,
                                textAlignVertical: TextAlignVertical.center,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Type a message",
                                  prefixIcon: IconButton(
                                    onPressed: () {
                                      if (focusnode.hasFocus) {
                                        focusnode.unfocus();
                                        focusnode.canRequestFocus = false;
                                      }
                                      setState(() {
                                        show = !show;
                                      });
                                    },
                                    icon: Icon(Icons.emoji_emotions_outlined),
                                  ),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.attach_file),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.camera_alt),
                                      ),
                                    ],
                                  ),
                                  contentPadding: EdgeInsets.all(5),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 2,
                              right: 2,
                              bottom: 8,
                            ),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: AppColors.accent,
                              child: IconButton(
                                onPressed: isSending ? null : sendMessage,
                                icon: isSending 
                                  ? SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        color: AppColors.background,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Icon(Icons.send, color: AppColors.background),
                              ),
                            ),
                          ),
                        ],
                      ),
                      show ? emojiSelect() : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        messageController.text += emoji.emoji;
      },
      config: const Config(
        emojiViewConfig: EmojiViewConfig(emojiSizeMax: 32, columns: 7),
      ),
    );
  }
}