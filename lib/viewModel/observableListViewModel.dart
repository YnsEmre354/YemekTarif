import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:recipe_app2/service/FavouriteService.dart';
import 'package:recipe_app2/service/MyRecipesService.dart';

part 'observableListViewModel.g.dart';

class ListStore = _ListStore with _$ListStore;

abstract class _ListStore with Store {
  @observable
  ObservableList foodNameList = ObservableList();
  @observable
  ObservableList foodMaterialList = ObservableList();
  @observable
  ObservableList foodRecipeList = ObservableList();
  @observable
  ObservableList categoriesList = ObservableList();
  @observable
  ObservableList favoriteList = ObservableList();

  @observable
  bool isRecipeListUpdated = false;

  @observable
  bool isFavorite = false;

  @action
  void setRecipeListUpdated(bool value) {
    isRecipeListUpdated = value;
  }

  Future<void> fetchGetRecipes() async {
    List fetchedRecipes = await MyRecipesService.getRecipes();
    foodRecipeList = ObservableList.of(fetchedRecipes);
  }

  @action
  Future<void> toggleFavourite(int index) async {
    var food = foodRecipeList[index];
    isFavorite = food['isFavourite'] ?? false;

    // Durumu tersine çevir (true ise false, false ise true yap)
    food['isFavourite'] = !isFavorite;

    // Listeyi MobX'e bildirerek güncellenmesini sağla
    foodRecipeList[index] = Map.from(food); // MobX'in değişikliği izlemesi için
  }

  @action
  void makeListUnique() {
    final uniqueFoodName = foodNameList.toSet().toList();
    final uniqueFoodMaterial = foodMaterialList.toSet().toList();
    final uniqueFoodRecipe = foodRecipeList.toSet().toList();
    final uniqueCategories = categoriesList.toSet().toList();
    final uniqueFavoriteList = favoriteList.toSet().toList();
  }
}
