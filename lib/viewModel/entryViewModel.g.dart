// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entryViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EntryStore on _EntryStore, Store {
  late final _$warningStringAtom =
      Atom(name: '_EntryStore.warningString', context: context);

  @override
  String get warningString {
    _$warningStringAtom.reportRead();
    return super.warningString;
  }

  @override
  set warningString(String value) {
    _$warningStringAtom.reportWrite(value, super.warningString, () {
      super.warningString = value;
    });
  }

  late final _$userNameAtom =
      Atom(name: '_EntryStore.userName', context: context);

  @override
  String get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  late final _$_EntryStoreActionController =
      ActionController(name: '_EntryStore', context: context);

  @override
  String setUserName(String newValue) {
    final _$actionInfo = _$_EntryStoreActionController.startAction(
        name: '_EntryStore.setUserName');
    try {
      return super.setUserName(newValue);
    } finally {
      _$_EntryStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
warningString: ${warningString},
userName: ${userName}
    ''';
  }
}
