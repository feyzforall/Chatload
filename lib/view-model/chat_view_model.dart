import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:chatload/model/chat_message.dart';
import 'package:chatload/view/common_widgets/message_view.dart';
import 'package:mobx/mobx.dart';
part 'chat_view_model.g.dart';

// ignore: library_private_types_in_public_api
class ChatViewModel = _ChatViewModelBase with _$ChatViewModel;

abstract class _ChatViewModelBase with Store {
  @observable
  ObservableList<MessageView> messages = ObservableList<MessageView>();

  @action
  void sendMessage(String message, Sender sender, OpenAI openAI) {
    // User's Message
    messages.insert(
      0,
      MessageView(
        chatMessage: ChatMessage(
          sender: sender,
          message: message,
        ),
      ),
    );

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
        messages.insert(
          0,
          MessageView(
            chatMessage: ChatMessage(
              sender: Sender.bot,
              message: value!.choices[0].message!.content,
            ),
          ),
        );
      },
    );
  }
}
