// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatViewModel on _ChatViewModelBase, Store {
  late final _$messagesAtom =
      Atom(name: '_ChatViewModelBase.messages', context: context);

  @override
  ObservableList<MessageView> get messages {
    _$messagesAtom.reportRead();
    return super.messages;
  }

  @override
  set messages(ObservableList<MessageView> value) {
    _$messagesAtom.reportWrite(value, super.messages, () {
      super.messages = value;
    });
  }

  late final _$_ChatViewModelBaseActionController =
      ActionController(name: '_ChatViewModelBase', context: context);

  @override
  void sendMessage(
      String message, Sender sender, OpenAI openAI, String chatId) {
    final _$actionInfo = _$_ChatViewModelBaseActionController.startAction(
        name: '_ChatViewModelBase.sendMessage');
    try {
      return super.sendMessage(message, sender, openAI, chatId);
    } finally {
      _$_ChatViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
messages: ${messages}
    ''';
  }
}
