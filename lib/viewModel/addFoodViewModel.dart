import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'addFoodViewModel.g.dart';

class AddFoodStore = _AddFoodStore with _$AddFoodStore;

abstract class _AddFoodStore with Store {
  @observable
  String? selectedCategory;

  @action
  void setSelectedCategory(String newValue) {
    selectedCategory = newValue;
  }
}
