// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addFoodViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddFoodStore on _AddFoodStore, Store {
  late final _$selectedCategoryAtom =
      Atom(name: '_AddFoodStore.selectedCategory', context: context);

  @override
  String? get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String? value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  late final _$_AddFoodStoreActionController =
      ActionController(name: '_AddFoodStore', context: context);

  @override
  void setSelectedCategory(String newValue) {
    final _$actionInfo = _$_AddFoodStoreActionController.startAction(
        name: '_AddFoodStore.setSelectedCategory');
    try {
      return super.setSelectedCategory(newValue);
    } finally {
      _$_AddFoodStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCategory: ${selectedCategory}
    ''';
  }
}
