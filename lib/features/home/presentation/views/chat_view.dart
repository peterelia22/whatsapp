import 'package:flutter/material.dart';
import 'package:whatsapp/core/utils/app_colors.dart';
import 'package:whatsapp/core/utils/assets.dart';

import 'widgets/chat_input.dart';
import 'widgets/message_list.dart';

class ChatView extends StatefulWidget {
  final String contactName;
  final String avatarUrl;

  const ChatView({
    super.key,
    required this.contactName,
    required this.avatarUrl,
  });

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hello', 'isSent': false, 'time': '9:20 AM'},
    {
      'text': 'We are planning party this weekend',
      'isSent': false,
      'time': '9:20 AM',
    },
    {
      'text': 'Get ready with your favorite suite',
      'isSent': false,
      'time': '9:20 AM',
    },
    {'text': 'There will be drinks.', 'isSent': false, 'time': '9:20 AM'},
    {
      'text': 'Will arrange the drop service.',
      'isSent': false,
      'time': '9:20 AM',
    },
    {
      'text': 'Sound\'s Like a plan, Its been really long',
      'isSent': true,
      'time': '9:21 AM',
    },
    {
      'text': 'Yes, This was in my mind for sometime now.',
      'isSent': true,
      'time': '9:21 AM',
    },
    {'text': 'I made the arrangements.', 'isSent': true, 'time': '9:21 AM'},
    {
      'text': 'To be honest , it was hectic.',
      'isSent': true,
      'time': '9:21 AM',
    },
    {'text': 'I hope it pays off', 'isSent': true, 'time': '9:21 AM'},
  ];

  void _handleSendMessage(String message) {
    if (message.trim().isNotEmpty) {
      setState(() {
        _messages.add({
          'text': message,
          'isSent': true,
          'time': _getCurrentTime(),
        });
      });
    }
  }

  String _getCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour > 12 ? now.hour - 12 : now.hour;
    final minute = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightPrimaryColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Hero(
              tag: 'avatar_${widget.contactName}',
              child: CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(widget.avatarUrl),
                backgroundColor: Colors.grey[300],
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: 'name_${widget.contactName}',
                    child: Material(
                      color: Colors.transparent,
                      child: Text(
                        widget.contactName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'last seen today at 9:21 AM',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.call, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.imagesDefaultWallpaper),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(child: MessageList(messages: _messages)),
            ChatInput(onSendMessage: _handleSendMessage),
          ],
        ),
      ),
    );
  }
}
