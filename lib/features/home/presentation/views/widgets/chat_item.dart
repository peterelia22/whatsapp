import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class ChatItem extends StatefulWidget {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;
  final bool isRead;
  final int unreadCount;
  final VoidCallback? onTap;

  const ChatItem({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.avatarUrl,
    required this.isRead,
    this.unreadCount = 0,
    this.onTap,
  });

  @override
  State<ChatItem> createState() => _ChatItemState();
}

class _ChatItemState extends State<ChatItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Added animation controller for tap feedback
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _animationController.reverse();
  }

  void _handleTapCancel() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _scaleAnimation.value,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  Hero(
                    tag: 'avatar_${widget.name}',
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(widget.avatarUrl),
                      backgroundColor: Colors.grey[300],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Hero(
                              tag: 'name_${widget.name}',
                              child: Material(
                                color: Colors.transparent,
                                child: Text(
                                  widget.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              widget.time,
                              style: TextStyle(
                                fontSize: 12,
                                color: widget.unreadCount > 0
                                    ? const Color(0xFF25D366)
                                    : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            if (widget.isRead)
                              const Icon(
                                Icons.done_all,
                                size: 16,
                                color: Color(0xFF4FC3F7),
                              ),
                            if (widget.isRead) const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                widget.message,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (widget.unreadCount > 0)
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
                                  widget.unreadCount.toString(),
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
            ),
          );
        },
      ),
    );
  }
}

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
