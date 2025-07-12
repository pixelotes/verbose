import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.role == 'user';

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: const EdgeInsets.all(12),
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: isUser ? Colors.blueAccent : Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16),
            topRight: const Radius.circular(16),
            bottomLeft: Radius.circular(isUser ? 16 : 0),
            bottomRight: Radius.circular(isUser ? 0 : 16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message.content,
              style: TextStyle(
                color: isUser ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              DateFormat.jm().format(message.timestamp), // e.g., 10:42 AM
              style: TextStyle(
                fontSize: 10,
                color: isUser ? Colors.white70 : Colors.black45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
