import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../constants/app_strings.dart';
import '../constants/sender.dart';
import '../env/env.dart';
import '../repository/chat_repository.dart';
import '../view-model/chat_view_model.dart';
import 'history_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController controller;
  final ChatRepository chatRepository = ChatRepository();
  final ChatViewModel viewModel = ChatViewModel(
    chatRepository: ChatRepository(),
  );

  OpenAI? _openAI;
  late String chatId;

  @override
  void initState() {
    String apiKey = Env.key;
    controller = TextEditingController();
    _openAI = OpenAI.instance.build(
      token: apiKey,
      baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
    );
    chatId = chatRepository.createChat();
    chatRepository.initBox(chatId);
    chatRepository.openAllBoxes();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.chatbot),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HistoryScreen(),
              ),
            );
          },
          icon: const Icon(Icons.history_outlined),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Chats
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
              EnterMessageField(
                controller: controller,
                viewModel: viewModel,
                openAI: _openAI!,
                chatId: chatId,
              ),
            ],
          ),
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
          viewModel.sendMessage(controller.text, Sender.person, openAI, chatId);
          controller.clear();
        }
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
                if (controller.text.isNotEmpty) {
                  viewModel.sendMessage(controller.text, Sender.person, openAI, chatId);
                  controller.clear();
                }
              },
              icon: const Icon(Icons.arrow_forward_ios_outlined),
            ),
          ),
        ),
      ),
    );
  }
}
