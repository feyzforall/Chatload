import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../constants/app_strings.dart';
import '../../constants/sender.dart';
import '../../view-model/chat_view_model.dart';

class ChatView extends StatelessWidget {
  const ChatView({
    super.key,
    required this.chatViewModel,
    required this.textEditingController,
    required this.openAI,
    required this.chatId,
    required this.tabName,
    required this.isClosable,
    required this.closePage,
  });

  final ChatViewModel chatViewModel;
  final TextEditingController textEditingController;
  final OpenAI openAI;
  final String chatId;
  final String tabName;
  final bool isClosable;
  final VoidCallback closePage;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Visibility(
              visible: isClosable,
              child: IconButton(
                onPressed: () {
                  closePage();
                },
                icon: Icon(Icons.close),
              ),
            ),
            // Chats
            Flexible(
              child: Observer(builder: (_) {
                return ListView.builder(
                  itemCount: chatViewModel.messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    return chatViewModel.messages[index];
                  },
                );
              }),
            ),
            EnterMessageField(
              controller: textEditingController,
              viewModel: chatViewModel,
              openAI: openAI,
              chatId: chatId,
            ),
          ],
        ),
      ),
    );
  }
}

class EnterMessageField extends StatelessWidget {
  const EnterMessageField({
    super.key,
    required this.controller,
    required this.viewModel,
    required this.openAI,
    required this.chatId,
  });

  final TextEditingController controller;
  final ChatViewModel viewModel;
  final OpenAI openAI;
  final String chatId;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) {
        if (controller.text.isNotEmpty) {
          viewModel.sendMessage(
            controller.text,
            Sender.person,
            openAI,
            chatId,
          );
          controller.clear();
        }
      },
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: AppStrings.message,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: SendButton(
            controller: controller,
            viewModel: viewModel,
            openAI: openAI,
            chatId: chatId,
          ),
        ),
      ),
    );
  }
}

class SendButton extends StatelessWidget {
  const SendButton({
    super.key,
    required this.controller,
    required this.viewModel,
    required this.openAI,
    required this.chatId,
  });

  final TextEditingController controller;
  final ChatViewModel viewModel;
  final OpenAI openAI;
  final String chatId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: controller.text.isEmpty ? Colors.white : Theme.of(context).primaryColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: () {
          if (controller.text.isNotEmpty) {
            viewModel.sendMessage(
              controller.text,
              Sender.person,
              openAI,
              chatId,
            );
            controller.clear();
          }
        },
        icon: const Icon(
          Icons.arrow_forward_ios_outlined,
        ),
      ),
    );
  }
}
