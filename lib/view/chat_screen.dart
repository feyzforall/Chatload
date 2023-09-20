import 'package:chatload/constants/app_strings.dart';
import 'package:chatload/model/chat_message.dart';
import 'package:chatload/view-model/chat_view_model.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController chatFieldController;
  final ChatViewModel viewModel = ChatViewModel();

  OpenAI? _openAI;

  @override
  void initState() {
    chatFieldController = TextEditingController();
    _openAI = OpenAI.instance.build(
      token: "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",
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
      enableLog: true,
    );
    super.initState();
  }

  @override
  void dispose() {
    chatFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.chatbot),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Observer(builder: (_) {
                  return ListView.builder(
                    itemCount: viewModel.messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return viewModel.messages[index];
                    },
                  );
                }),
              ),
              ChatField(
                controller: chatFieldController,
                viewModel: viewModel,
                openAI: _openAI!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChatField extends StatelessWidget {
  const ChatField({
    super.key,
    required this.controller,
    required this.viewModel,
    required this.openAI,
  });

  final TextEditingController controller;
  final ChatViewModel viewModel;
  final OpenAI openAI;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) {
        viewModel.sendMessage(
          controller.text,
          Sender.person,
          openAI,
        );
        controller.clear();
      },
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: 'Message',
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: controller.text.isEmpty ? Colors.white : Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {
                viewModel.sendMessage(
                  controller.text,
                  Sender.person,
                  openAI,
                );
                controller.clear();
              },
              icon: const Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
        ),
      ),
    );
  }
}
