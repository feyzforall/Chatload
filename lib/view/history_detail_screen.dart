import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/app_strings.dart';
import '../model/chat_message.dart';
import 'common_widgets/message_view.dart';

class HistoryDetailScreen extends StatelessWidget {
  const HistoryDetailScreen({super.key, required this.boxKey});

  final String boxKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.history),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
          valueListenable: Hive.box(boxKey).listenable(),
          builder: (BuildContext context, dynamic value, Widget? child) {
            return ListView.builder(
              itemCount: Hive.box(boxKey).length,
              itemBuilder: (BuildContext context, int index) {
                final ChatMessage chatMessage = Hive.box(boxKey).getAt(index);
                return MessageView(chatMessage: chatMessage);
              },
            );
          },
        ),
      ),
    );
  }
}
