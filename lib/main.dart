import 'package:flutter/material.dart';
import 'package:whatsapp/features/home/presentation/views/home_view.dart';

void main() {
  runApp(const WhatsApp());
}

class WhatsApp extends StatelessWidget {
  const WhatsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Helvetica'),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
