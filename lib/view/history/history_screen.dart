import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_strings.dart';
import '../../constants/boxes.dart';
import '../../model/chat_message.dart';
import 'history_detail_screen.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.history),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
          valueListenable: Hive.box(Boxes.chats).listenable(),
          builder: (BuildContext context, dynamic value, Widget? child) {
            final chats = Hive.box(Boxes.chats);
            return ListView.builder(
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index) {
                if (Hive.box(chats.getAt(index)).isNotEmpty) {
                  final firstMessage = Hive.box(chats.getAt(index)).values.first as ChatMessage;
                  return ListTile(
                    leading: const Icon(
                      Icons.message_outlined,
                      color: AppColors.frenchPass,
                    ),
                    title: Text(
                      firstMessage.message,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HistoryDetailScreen(
                          boxKey: chats.getAt(index),
                        ),
                      ),
                    ),
                  );
                } else {
                  return null;
                }
              },
            );
          },
        ),
      ),
    );
  }
}
