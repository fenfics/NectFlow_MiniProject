// ignore_for_file: avoid_print, sort_child_properties_last, sized_box_for_whitespace, unnecessary_null_comparison
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:nectflowproject/app_colors.dart';
import 'package:nectflowproject/model/chatmodel.dart';

class IndividualPage extends StatefulWidget {
  final Chatmodel chatmodel;
  const IndividualPage({super.key, required this.chatmodel});

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

class _IndividualPageState extends State<IndividualPage> {
  bool show = false;
  FocusNode focusnode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusnode.addListener(() {
      if (focusnode.hasFocus) {
        setState(() {
          show = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    widget.chatmodel.icon.icon,
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
                    "last seen today at 12:05",
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
                  value: "New group",
                  child: Text("New group"),
                ),
                const PopupMenuItem(
                  value: "Starred messages",
                  child: Text("Starred messages"),
                ),
                const PopupMenuItem(value: "Settings", child: Text("Settings")),
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
            ListView(),
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
                            focusNode: focusnode,
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Type a messages",
                              prefixIcon: IconButton(
                                onPressed: () {
                                  if (focusnode != null && focusnode.hasFocus) {
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
                            onPressed: () {},
                            icon: Icon(Icons.mic, color: AppColors.background),
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
    );
  }

  Widget emojiSelect() {
    return EmojiPicker(
      onEmojiSelected: (category, emoji) {
        print(emoji);
      },
      config: const Config(
        emojiViewConfig: EmojiViewConfig(emojiSizeMax: 32, columns: 7),
      ),
    );
  }
}
