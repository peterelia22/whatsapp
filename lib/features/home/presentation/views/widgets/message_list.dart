import 'package:flutter/material.dart';
import 'message_bubble.dart';

class MessageList extends StatefulWidget {
  final List<Map<String, dynamic>> messages;

  const MessageList({super.key, required this.messages});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  final List<Animation<Offset>> _slideAnimations = [];
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _setupAnimations();

    Future.delayed(const Duration(milliseconds: 300), () {
      _animationController.forward();
    });
  }

  void _setupAnimations() {
    _slideAnimations.clear();
    for (int i = 0; i < widget.messages.length; i++) {
      double startTime = (i * 0.05).clamp(0.0, 0.7);
      double endTime = (startTime + 0.3).clamp(0.0, 1.0);

      final animation =
          Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
            CurvedAnimation(
              parent: _animationController,
              curve: Interval(startTime, endTime, curve: Curves.easeOutBack),
            ),
          );
      _slideAnimations.add(animation);
    }
  }

  @override
  void didUpdateWidget(MessageList oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.messages.length != widget.messages.length) {
      _setupAnimations();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_scrollController.hasClients) {
          _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.all(8),
      itemCount: widget.messages.length,
      itemBuilder: (context, index) {
        final message = widget.messages[index];
        return index < _slideAnimations.length
            ? SlideTransition(
                position: _slideAnimations[index],
                child: MessageBubble(
                  text: message['text'] as String,
                  isSent: message['isSent'] as bool,
                  time: message['time'] as String,
                ),
              )
            : MessageBubble(
                text: message['text'] as String,
                isSent: message['isSent'] as bool,
                time: message['time'] as String,
              );
      },
    );
  }
}
