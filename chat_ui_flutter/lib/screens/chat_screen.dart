import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../services/api_service.dart';
import '../widgets/message_bubble.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add(ChatMessage(role: 'user', content: text));
    });

    _controller.clear();

    // TODO: Replace with real backend call later
    //await Future.delayed(const Duration(milliseconds: 500));
    //setState(() {
    //  _messages.add(ChatMessage(role: 'assistant', content: 'Hello from backend!'));
    //});
    final reply = await ApiService.sendMessage(text);
    setState(() {
      _messages.add(ChatMessage(role: 'assistant', content: reply));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                //return ListTile(
                //  title: Text(msg.content),
                //  subtitle: Text(msg.role),
                //);
                return MessageBubble(message: msg);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                //Expanded(child: TextField(controller: _controller)),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (_) => _sendMessage(),
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
