import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:recipe_app2/service/AddFoodService.dart';
import 'package:recipe_app2/service/FavouriteService.dart';
import 'package:recipe_app2/view/AddRecipeScreen.dart';
import 'package:recipe_app2/view/FavoriteRecipesScreen.dart';
import 'package:recipe_app2/view/MenuScreen.dart';
import 'package:recipe_app2/view/MyRecipesScreen.dart';
import 'package:recipe_app2/viewModel/addFoodViewModel.dart';
import 'package:recipe_app2/viewModel/observableListViewModel.dart';
import 'View/EntryScreen.dart';
import 'service/MyRecipesService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPageView(),
    );
  }
}

// ignore: must_be_immutable
class MyPageView extends StatelessWidget {
  ListStore listStore = ListStore();
  AddFoodStore addFoodStore = AddFoodStore();

  String userName = "";
  String userEmail = "";
  String userPassword = "";

  PageController pageController = PageController();

  Future<void> fetchData() async {
    await Future.wait([fetchGetCategories(), fetchGetRecipes()]);
  }

  Future<void> fetchGetCategories() async {
    List<String> fetchedCategories = await AddFoodService.getCategories();

    listStore.categoriesList = ObservableList.of(fetchedCategories);
  }

  Future<void> fetchGetRecipes() async {
    List fetchedRecipes = await MyRecipesService.getRecipes();

    listStore.foodRecipeList = ObservableList.of(fetchedRecipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: fetchData(), // Asenkron fonksiyonu bekliyoruz
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Hata durumu
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return PageView(
              controller: pageController,
              children: [
                EntryScreen(
                    userName: userName,
                    listStore: listStore,
                    addFoodStore: addFoodStore,
                    foodNameList: listStore.foodNameList,
                    foodMaterialList: listStore.foodMaterialList,
                    foodRecipeList: listStore.foodRecipeList,
                    foodCategoriesList: listStore.categoriesList,
                    favoriteList: listStore.favoriteList),
                MenuScreen(
                    userName: userName,
                    listStore: listStore,
                    addFoodStore: addFoodStore,
                    foodNameList: listStore.foodNameList,
                    foodMaterialList: listStore.foodMaterialList,
                    foodRecipeList: listStore.foodRecipeList,
                    foodCategoriesList: listStore.categoriesList,
                    favoriteList: listStore.favoriteList),
                AddRecipeScreen(
                  userName: userName,
                  listStore: listStore,
                  addFoodStore: addFoodStore,
                  foodNameList: listStore.foodNameList,
                  foodMaterialList: listStore.foodMaterialList,
                  foodRecipeList: listStore.foodRecipeList,
                  foodCategoriesList: listStore.categoriesList,
                  favoriteList: listStore.favoriteList,
                ),
                MyRecipesScreen(
                    userName: userName,
                    listStore: listStore,
                    addFoodStore: addFoodStore,
                    foodNameList: listStore.foodNameList,
                    foodMaterialList: listStore.foodMaterialList,
                    foodRecipeList: listStore.foodRecipeList,
                    foodCategoriesList: listStore.categoriesList,
                    favoriteList: listStore.favoriteList),
                FavoriteRecipesScreen(
                    userName: userName,
                    listStore: listStore,
                    addFoodStore: addFoodStore,
                    foodNameList: listStore.foodNameList,
                    foodMaterialList: listStore.foodMaterialList,
                    foodRecipeList: listStore.foodRecipeList,
                    foodCategoriesList: listStore.categoriesList,
                    favoriteList: listStore.favoriteList),
              ],
            );
          }
        },
      ),
    );
  }
}
