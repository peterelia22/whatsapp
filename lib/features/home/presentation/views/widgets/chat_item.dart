import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final bool isRead;
  final int unreadCount;

  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    required this.isRead,
    this.unreadCount = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(avatarUrl),
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: unreadCount > 0
                            ? const Color(0xFF25D366)
                            : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                Row(
                  children: [
                    if (isRead)
                      const Icon(
                        Icons.done_all,
                        size: 16,
                        color: Color(0xFF4FC3F7),
                      ),
                    if (isRead) const SizedBox(width: 4),

                    Expanded(
                      child: Text(
                        message,
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    if (unreadCount > 0)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xFF02B099),
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          unreadCount.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Sample chat data
final List<Map<String, dynamic>> chatData = [
  {
    'name': 'Martin Torff',
    'message': 'Let\'s Meet',
    'time': '11:48',
    'avatarUrl': Assets.imagesPerson1,
    'isRead': false,
    'unreadCount': 123,
  },
  {
    'name': 'Alfonso Rhiel Madsen',
    'message': ' Yes, That\'s correct!',
    'time': '09:21',
    'avatarUrl': Assets.imagesPerson2,
    'isRead': true,
    'unreadCount': 0,
  },
  {
    'name': 'Carla Korsgaard',
    'message': ' Nice',
    'time': '11:48',
    'avatarUrl': Assets.imagesPerson3,
    'isRead': true,
    'unreadCount': 0,
  },
  {
    'name': 'Cristofer Passaquindici Arcand',
    'message': ' It\'s going well here. What about there?',
    'time': '11:48',
    'avatarUrl': Assets.imagesPerson1,
    'isRead': true,
    'unreadCount': 0,
  },
  {
    'name': 'Zaire Passaquindici Arcand',
    'message': ' I am still wondering, when will you grow up',
    'time': '11:48',
    'avatarUrl': Assets.imagesPerson2,
    'isRead': true,
    'unreadCount': 0,
  },
  {
    'name': 'Martin Dorwart',
    'message': 'Thanks for the Party',
    'time': '11:48',
    'avatarUrl': Assets.imagesPerson1,
    'isRead': false,
    'unreadCount': 0,
  },
  {
    'name': 'Phillip Westervelt',
    'message': 'We had fun last week. Lets plan another party soon !!!',
    'time': '11:48',
    'avatarUrl': Assets.imagesPerson1,
    'isRead': false,
    'unreadCount': 0,
  },
  {
    'name': 'Terry Dokidis',
    'message': 'Sorry, I couldn\'t make it for the party last week.',
    'time': '11:48',
    'avatarUrl': Assets.imagesPerson1,
    'isRead': false,
    'unreadCount': 0,
  },
  {
    'name': 'Davis Westervelt',
    'message': ' I am travelling, will call later.',
    'time': '11:48',
    'avatarUrl': Assets.imagesPerson1,
    'isRead': true,
    'unreadCount': 0,
  },
  {
    'name': 'Cooper Septimus',
    'message': ' When will you share the details?',
    'time': '11:48',
    'avatarUrl': Assets.imagesPerson1,
    'isRead': true,
    'unreadCount': 0,
  },
];
