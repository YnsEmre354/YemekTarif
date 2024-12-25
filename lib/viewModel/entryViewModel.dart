import 'package:mobx/mobx.dart';

part 'entryViewModel.g.dart';

class EntryStore = _EntryStore with _$EntryStore;

abstract class _EntryStore with Store {
  @observable
  String warningString = "";
  @observable
  String userName = "";

  @action
  String setUserName(String newValue) {
    return newValue;
  }
}
