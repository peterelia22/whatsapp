import 'package:flutter/material.dart';

import '../status_view.dart';

class StatusItem extends StatelessWidget {
  final String name;
  final String avatarUrl;
  final String timestamp;
  final bool hasStory;

  const StatusItem({
    super.key,
    required this.name,
    required this.avatarUrl,
    required this.timestamp,
    this.hasStory = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: hasStory ? const Color(0xFF25D366) : Colors.grey[300]!,
            width: 2,
          ),
        ),
        child: CircleAvatar(radius: 22, backgroundImage: AssetImage(avatarUrl)),
      ),
      title: Text(
        name,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        timestamp,
        style: const TextStyle(fontSize: 14, color: Colors.grey),
      ),
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                StatusViewerScreen(
                  name: name,
                  avatarUrl: avatarUrl,
                  timestamp: timestamp,
                ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: Tween<double>(begin: 0.8, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animation,
                          curve: Curves.easeOut,
                        ),
                      ),
                      child: child,
                    ),
                  );
                },
            transitionDuration: const Duration(milliseconds: 300),
          ),
        );
      },
    );
  }
}
