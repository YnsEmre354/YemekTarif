import 'package:mobx/mobx.dart';

part 'menuViewModel.g.dart';

class MenuStore = _MenuStore with _$MenuStore;

abstract class _MenuStore with Store {
  @observable
  int selectedIndex = 0;

  @action
  void setSelectedIndex(int index) {
    selectedIndex = index;
  }
}
