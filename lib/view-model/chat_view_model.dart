import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:mobx/mobx.dart';

import '../constants/sender.dart';
import '../model/chat_message.dart';
import '../repository/chat_repository.dart';
import '../view/common_widgets/message_view.dart';

part 'chat_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ChatViewModel = _ChatViewModelBase with _$ChatViewModel;

abstract class _ChatViewModelBase with Store {
  @observable
  ObservableList<MessageView> messages = ObservableList<MessageView>();
  final ChatRepository chatRepository;

  _ChatViewModelBase({required this.chatRepository});

  @action
  void sendMessage(
    String message,
    Sender sender,
    OpenAI openAI,
    String chatId,
  ) {
    // User's Message
    ChatMessage chatMessage = ChatMessage(
      sender: sender.title,
      message: message,
    );
    messages.insert(
      0,
      MessageView(
        chatMessage: chatMessage,
      ),
    );

    chatRepository.saveChat(chatId, chatMessage);

    final request = ChatCompleteText(
      model: GptTurboChatModel(),
      messages: [
        Messages(role: Role.user, content: message),
      ],
      maxToken: 200,
      temperature: 0.7,
    );

    // ChatGPT Response
    openAI.onChatCompletion(request: request).then(
      (value) {
        print(request.stop);
        ChatMessage chatMessage = ChatMessage(
          sender: Sender.bot.title,
          message: value!.choices[0].message!.content,
        );

        messages.insert(
          0,
          MessageView(
            chatMessage: chatMessage,
          ),
        );

        chatRepository.saveChat(chatId, chatMessage);
      },
    );
  }
}
