import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

import '../constants/boxes.dart';
import '../model/chat_message.dart';

class ChatRepository {
  final _uuid = const Uuid();

  /// This function will run as soon as the conversation starts
  /// and a unique id will be generated for that conversation.
  String createChat() {
    final id = _uuid.v1();
    // The unique keys to be generated for each conversation are added to this box for later use.
    Hive.box(Boxes.boxKeys).add(id);

    return id;
  }

  void initBox(String id) {
    Hive.openBox(id);
  }

  /// Function used to open the boxes where the recorded conversations are kept.
  void openAllBoxes() {
    final Box box = Hive.box(Boxes.boxKeys);
    for (var i = 0; i < box.length; i++) {
      Hive.openBox(box.getAt(i));
    }
  }

  void saveChat(String id, ChatMessage message) {
    var box = Hive.box(id);
    box.add(message);
  }
}
