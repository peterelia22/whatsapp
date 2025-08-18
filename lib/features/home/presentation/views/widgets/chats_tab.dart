import 'package:flutter/material.dart';
import 'package:whatsapp/core/utils/app_colors.dart';
import 'package:whatsapp/features/home/presentation/views/chat_view.dart';

import 'chat_item.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatData.length,
                itemBuilder: (context, index) {
                  final chat = chatData[index];
                  return ChatItem(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatView(
                            contactName: chat['name'],
                            avatarUrl: chat['avatarUrl'],
                          ),
                        ),
                      );
                    },
                    name: chat['name'],
                    message: chat['message'],
                    time: chat['time'],
                    avatarUrl: chat['avatarUrl'],
                    isRead: chat['isRead'],
                    unreadCount: chat['unreadCount'],
                  );
                },
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.lightPrimaryColor,
            child: const Icon(Icons.chat, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
