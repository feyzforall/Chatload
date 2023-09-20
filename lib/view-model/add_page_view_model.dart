import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../env/env.dart';
import '../repository/chat_repository.dart';
import '../view/chat/chat_view.dart';
import 'chat_view_model.dart';

part 'add_page_view_model.g.dart';

class AddPageViewModel = _AddPageViewModelBase with _$AddPageViewModel;

abstract class _AddPageViewModelBase with Store {
  final ChatRepository chatRepository;

  _AddPageViewModelBase({required this.chatRepository});

  @observable
  ObservableList<ChatView> pages = ObservableList<ChatView>();

  @observable
  int numberOfPage = 0;

  @action
  void createPage() {
    // Define api key
    String apiKey = Env.key;
    // Create OpenAI instance
    final OpenAI openAI = OpenAI.instance.build(
      token: apiKey,
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 9)),
    );
    // Create chat box
    final chatId = chatRepository.createChat();
    // Open box
    chatRepository.initBox(chatId);

    numberOfPage += 1;

    pages.add(
      ChatView(
        chatViewModel: ChatViewModel(chatRepository: chatRepository),
        textEditingController: TextEditingController(),
        openAI: openAI,
        chatId: chatId,
        tabName: 'Chat-${numberOfPage}',
        isClosable: numberOfPage != 1,
        closePage: () => closePage(numberOfPage - 1),
      ),
    );
  }

  void closePage(int index) {
    if (pages.length > 1) {
      pages.removeAt(index);
      numberOfPage -= 1;
    }
  }
}
