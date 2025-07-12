class ChatMessage {
  final String role;
  String content;
  final DateTime timestamp;

  ChatMessage({
    required this.role,
    required this.content,
    DateTime? timestamp,
  })  : timestamp = timestamp ?? DateTime.now();
}