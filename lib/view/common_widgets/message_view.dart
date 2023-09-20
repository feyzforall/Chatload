import 'package:chatload/constants/app_colors.dart';
import 'package:chatload/model/chat_message.dart';
import 'package:flutter/material.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key, required this.chatMessage});

  final ChatMessage chatMessage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      isThreeLine: true,
      leading: CircleAvatar(
        backgroundColor: chatMessage.sender == Sender.bot ? AppColors.frenchPass : Colors.blue,
        child: Text(
          chatMessage.sender == Sender.bot ? 'CL' : 'Y',
        ),
      ),
      title: Text(
        chatMessage.sender.title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        chatMessage.message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
