// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddPageViewModel on _AddPageViewModelBase, Store {
  late final _$pagesAtom =
      Atom(name: '_AddPageViewModelBase.pages', context: context);

  @override
  ObservableList<ChatView> get pages {
    _$pagesAtom.reportRead();
    return super.pages;
  }

  @override
  set pages(ObservableList<ChatView> value) {
    _$pagesAtom.reportWrite(value, super.pages, () {
      super.pages = value;
    });
  }

  late final _$numberOfPageAtom =
      Atom(name: '_AddPageViewModelBase.numberOfPage', context: context);

  @override
  int get numberOfPage {
    _$numberOfPageAtom.reportRead();
    return super.numberOfPage;
  }

  @override
  set numberOfPage(int value) {
    _$numberOfPageAtom.reportWrite(value, super.numberOfPage, () {
      super.numberOfPage = value;
    });
  }

  late final _$_AddPageViewModelBaseActionController =
      ActionController(name: '_AddPageViewModelBase', context: context);

  @override
  void createPage() {
    final _$actionInfo = _$_AddPageViewModelBaseActionController.startAction(
        name: '_AddPageViewModelBase.createPage');
    try {
      return super.createPage();
    } finally {
      _$_AddPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pages: ${pages},
numberOfPage: ${numberOfPage}
    ''';
  }
}
