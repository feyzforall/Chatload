import 'package:mobx/mobx.dart';

import '../constants/sender.dart';
import '../model/chat_message.dart';
import '../repository/local_chat_repository.dart';
import '../repository/remote_chat_repository.dart';

part 'chat_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ChatViewModel = _ChatViewModelBase with _$ChatViewModel;

abstract class _ChatViewModelBase with Store {
  final LocalChatRepository chatRepository;
  final RemoteChatRepository remoteChatRepository = RemoteChatRepository();

  @observable
  ObservableList<ChatMessage> messages = ObservableList<ChatMessage>();

  @observable
  bool isLoading = false;

  @observable
  String errorMessage = "";

  _ChatViewModelBase({required this.chatRepository});

  @action
  Future<void> sendMessage(
    String message,
    Sender sender,
    String chatId,
  ) async {
    isLoading = true;
    // User's Message
    saveMessage(sender.title, message, chatId);

    final response = await remoteChatRepository.askQuestion(message);

    response.fold(
      (l) => errorMessage = l.errorMessage,
      (r) => saveMessage(Sender.bot.title, r.choices![0].message!.content!, chatId),
    );

    isLoading = false;
  }

  @action
  void saveMessage(String sender, String message, String id) {
    ChatMessage chatMessage = ChatMessage(
      sender: Sender.bot.title,
      message: message,
    );

    chatRepository.saveChat(id, chatMessage);

    messages.insert(
      0,
      ChatMessage(
        message: message,
        sender: sender,
      ),
    );
  }
}
