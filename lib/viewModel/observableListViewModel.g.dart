// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observableListViewModel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ListStore on _ListStore, Store {
  late final _$foodNameListAtom =
      Atom(name: '_ListStore.foodNameList', context: context);

  @override
  ObservableList<dynamic> get foodNameList {
    _$foodNameListAtom.reportRead();
    return super.foodNameList;
  }

  @override
  set foodNameList(ObservableList<dynamic> value) {
    _$foodNameListAtom.reportWrite(value, super.foodNameList, () {
      super.foodNameList = value;
    });
  }

  late final _$foodMaterialListAtom =
      Atom(name: '_ListStore.foodMaterialList', context: context);

  @override
  ObservableList<dynamic> get foodMaterialList {
    _$foodMaterialListAtom.reportRead();
    return super.foodMaterialList;
  }

  @override
  set foodMaterialList(ObservableList<dynamic> value) {
    _$foodMaterialListAtom.reportWrite(value, super.foodMaterialList, () {
      super.foodMaterialList = value;
    });
  }

  late final _$foodRecipeListAtom =
      Atom(name: '_ListStore.foodRecipeList', context: context);

  @override
  ObservableList<dynamic> get foodRecipeList {
    _$foodRecipeListAtom.reportRead();
    return super.foodRecipeList;
  }

  @override
  set foodRecipeList(ObservableList<dynamic> value) {
    _$foodRecipeListAtom.reportWrite(value, super.foodRecipeList, () {
      super.foodRecipeList = value;
    });
  }

  late final _$categoriesListAtom =
      Atom(name: '_ListStore.categoriesList', context: context);

  @override
  ObservableList<dynamic> get categoriesList {
    _$categoriesListAtom.reportRead();
    return super.categoriesList;
  }

  @override
  set categoriesList(ObservableList<dynamic> value) {
    _$categoriesListAtom.reportWrite(value, super.categoriesList, () {
      super.categoriesList = value;
    });
  }

  late final _$favoriteListAtom =
      Atom(name: '_ListStore.favoriteList', context: context);

  @override
  ObservableList<dynamic> get favoriteList {
    _$favoriteListAtom.reportRead();
    return super.favoriteList;
  }

  @override
  set favoriteList(ObservableList<dynamic> value) {
    _$favoriteListAtom.reportWrite(value, super.favoriteList, () {
      super.favoriteList = value;
    });
  }

  late final _$isRecipeListUpdatedAtom =
      Atom(name: '_ListStore.isRecipeListUpdated', context: context);

  @override
  bool get isRecipeListUpdated {
    _$isRecipeListUpdatedAtom.reportRead();
    return super.isRecipeListUpdated;
  }

  @override
  set isRecipeListUpdated(bool value) {
    _$isRecipeListUpdatedAtom.reportWrite(value, super.isRecipeListUpdated, () {
      super.isRecipeListUpdated = value;
    });
  }

  late final _$isFavoriteAtom =
      Atom(name: '_ListStore.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$toggleFavouriteAsyncAction =
      AsyncAction('_ListStore.toggleFavourite', context: context);

  @override
  Future<void> toggleFavourite(int index) {
    return _$toggleFavouriteAsyncAction.run(() => super.toggleFavourite(index));
  }

  late final _$_ListStoreActionController =
      ActionController(name: '_ListStore', context: context);

  @override
  void setRecipeListUpdated(bool value) {
    final _$actionInfo = _$_ListStoreActionController.startAction(
        name: '_ListStore.setRecipeListUpdated');
    try {
      return super.setRecipeListUpdated(value);
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void makeListUnique() {
    final _$actionInfo = _$_ListStoreActionController.startAction(
        name: '_ListStore.makeListUnique');
    try {
      return super.makeListUnique();
    } finally {
      _$_ListStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
foodNameList: ${foodNameList},
foodMaterialList: ${foodMaterialList},
foodRecipeList: ${foodRecipeList},
categoriesList: ${categoriesList},
favoriteList: ${favoriteList},
isRecipeListUpdated: ${isRecipeListUpdated},
isFavorite: ${isFavorite}
    ''';
  }
}
