import '../constants/app_colors.dart';
import '../constants/app_strings.dart';
import '../model/chat_message.dart';
import '../repository/boxes.dart';
import 'history_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.history),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ValueListenableBuilder(
          valueListenable: Hive.box(Boxes.boxKeys).listenable(),
          builder: (BuildContext context, dynamic value, Widget? child) {
            final keysBox = Hive.box(Boxes.boxKeys);
            return ListView.builder(
              itemCount: keysBox.length,
              itemBuilder: (BuildContext context, int index) {
                if (Hive.box(keysBox.getAt(index)).isNotEmpty) {
                  final ChatMessage chatMessage = Hive.box(keysBox.getAt(index)).values.first as ChatMessage;
                  return ListTile(
                    leading: const Icon(
                      Icons.message_outlined,
                      color: AppColors.frenchPass,
                    ),
                    title: Text(
                      chatMessage.message,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HistoryDetailScreen(boxKey: keysBox.getAt(index)),
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
