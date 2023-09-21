import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../constants/app_strings.dart';
import '../../repository/local_chat_repository.dart';
import '../../view-model/add_page_view_model.dart';
import '../../view-model/chat_view_model.dart';
import '../history/history_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final LocalChatRepository chatRepository = LocalChatRepository();
  final AddPageViewModel addPageViewModel = AddPageViewModel(
    chatRepository: LocalChatRepository(),
  );
  final ChatViewModel viewModel = ChatViewModel(
    chatRepository: LocalChatRepository(),
  );

  @override
  void initState() {
    addPageViewModel.createPage();
    chatRepository.openAllBoxes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return DefaultTabController(
          length: addPageViewModel.pages.length,
          child: Scaffold(
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
              actions: [
                IconButton(
                  onPressed: () {
                    addPageViewModel.createPage();
                  },
                  icon: Icon(Icons.add),
                )
              ],
              bottom: TabBar(
                dividerColor: Colors.transparent,
                tabs: List.generate(
                  addPageViewModel.pages.length,
                  (index) => Tab(
                    text: addPageViewModel.pages[index].tabName,
                  ),
                ),
              ),
            ),
            body: TabBarView(
              children: List.generate(
                addPageViewModel.pages.length,
                (index) => addPageViewModel.pages[index],
              ),
            ),
          ),
        );
      },
    );
  }
}
