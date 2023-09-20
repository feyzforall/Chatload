import 'package:hive/hive.dart';

part 'chat_message.g.dart';

@HiveType(typeId: 0)
class ChatMessage extends HiveObject {
  @HiveField(0)
  final String sender;
  @HiveField(1)
  final String message;

  ChatMessage({required this.sender, required this.message});
}
