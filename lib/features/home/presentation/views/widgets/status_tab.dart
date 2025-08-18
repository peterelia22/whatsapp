import 'package:flutter/material.dart';
import 'package:whatsapp/core/utils/assets.dart';

import '../status_view.dart';
import 'my_status_section.dart';
import 'status_item.dart';

class StatusTab extends StatelessWidget {
  const StatusTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            const MyStatusSection(),
            const SizedBox(height: 8),

            Container(
              color: Colors.grey[100],
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Text(
                'Recent updates',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            ...statusUpdates.map(
              (status) => StatusItem(
                name: status['name'],
                avatarUrl: status['avatar'],
                timestamp: status['timestamp'],
                hasStory: status['hasStory'],
              ),
            ),
          ],
        ),

        Positioned(
          bottom: 88,
          right: 16,
          child: FloatingActionButton(
            heroTag: "pen_fab",
            mini: true,
            onPressed: () {},
            backgroundColor: Color(0XFF02B099),
            child: Image.asset(Assets.imagesEdit),
          ),
        ),

        Positioned(
          bottom: 16,
          right: 16,
          child: FloatingActionButton(
            heroTag: "camera_fab",
            onPressed: () {},
            backgroundColor: const Color(0xFF016B5D),
            child: const Icon(Icons.camera_alt, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

final List<Map<String, dynamic>> statusUpdates = [
  {
    'name': 'Martin Torff',
    'avatar': Assets.imagesPerson1,
    'timestamp': '5 minutes ago',
    'hasStory': true,
  },
  {
    'name': 'Alfonso Rhiel Madsen',
    'avatar': Assets.imagesPerson2,
    'timestamp': '7 minutes ago',
    'hasStory': true,
  },
  {
    'name': 'Carla Korsgaard',
    'avatar': Assets.imagesPerson3,
    'timestamp': '10 minutes ago',
    'hasStory': true,
  },
  {
    'name': 'Cristofer Passaquindici Arcand',
    'avatar': Assets.imagesPerson1,
    'timestamp': '12 minutes ago',
    'hasStory': true,
  },
  {
    'name': 'Zaire Passaquindici Arcand',
    'avatar': Assets.imagesPerson2,
    'timestamp': '15 minutes ago',
    'hasStory': true,
  },
  {
    'name': 'Martin Dorwart',
    'avatar': Assets.imagesPerson3,
    'timestamp': '16 minutes ago',
    'hasStory': true,
  },
  {
    'name': 'Phillip Westervelt',
    'avatar': Assets.imagesPerson1,
    'timestamp': '18 minutes ago',
    'hasStory': true,
  },
  {
    'name': 'Terry Dokidis',
    'avatar': Assets.imagesPerson1,
    'timestamp': '20 minutes ago',
    'hasStory': true,
  },
  {
    'name': 'Davis Westervelt',
    'avatar': Assets.imagesPerson1,
    'timestamp': '25 minutes ago',
    'hasStory': true,
  },
];
