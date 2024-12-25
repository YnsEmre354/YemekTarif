import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:recipe_app2/Functions/functions.dart';
import 'package:recipe_app2/view/AddRecipeScreen.dart';
import 'package:recipe_app2/view/EntryScreen.dart';
import 'package:recipe_app2/view/FavoriteRecipesScreen.dart';
import 'package:recipe_app2/view/MyRecipesScreen.dart';
import 'package:recipe_app2/view/ResetPasswordScreen.dart';
import 'package:recipe_app2/viewModel/addFoodViewModel.dart';
import 'package:recipe_app2/viewModel/observableListViewModel.dart';
import 'package:recipe_app2/widgets/BuildNavBarItem.dart';
import 'package:recipe_app2/viewModel/menuViewModel.dart';
import 'package:recipe_app2/widgets/menuBuildElevatedButton.dart';

class MenuScreen extends StatelessWidget {
  final ObservableList foodNameList;
  final ObservableList foodMaterialList;
  final ObservableList foodRecipeList;
  final ObservableList foodCategoriesList;
  final ObservableList favoriteList;
  final AddFoodStore addFoodStore;
  final ListStore listStore;
  final String userName;

  MenuScreen(
      {required this.userName,
      required this.addFoodStore,
      required this.listStore,
      required this.foodNameList,
      required this.foodMaterialList,
      required this.foodRecipeList,
      required this.foodCategoriesList,
      required this.favoriteList});

  @override
  Widget build(BuildContext context) {
    final MenuStore menuStore = MenuStore();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 244, 245, 223),
        title: Text(" "),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 244, 245, 223),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Functions.navigateToScreen(
                    context,
                    MenuScreen(
                        userName: userName,
                        listStore: listStore,
                        addFoodStore: addFoodStore,
                        foodNameList: foodNameList,
                        foodMaterialList: foodMaterialList,
                        foodRecipeList: foodRecipeList,
                        foodCategoriesList: foodCategoriesList,
                        favoriteList: favoriteList));
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Functions.navigateToScreen(
                    context,
                    ResetPasswordScreen(
                        userName: userName,
                        listStore: listStore,
                        addFoodStore: addFoodStore,
                        foodNameList: foodNameList,
                        foodMaterialList: foodMaterialList,
                        foodRecipeList: foodRecipeList,
                        foodCategoriesList: foodCategoriesList,
                        favoriteList: favoriteList));
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Functions.navigateToScreen(
                    context,
                    EntryScreen(
                        userName: userName,
                        listStore: listStore,
                        addFoodStore: addFoodStore,
                        foodNameList: foodNameList,
                        foodMaterialList: foodMaterialList,
                        foodRecipeList: foodRecipeList,
                        foodCategoriesList: foodCategoriesList,
                        favoriteList: favoriteList));
              },
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 244, 245, 223),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menü butonları
            menuBuildElevatedButton(
              context,
              icon: Icons.restaurant_menu,
              label: 'Tarif Gir',
              color: Colors.deepOrange,
              AddRecipeScreen(
                  userName: userName,
                  listStore: listStore,
                  addFoodStore: addFoodStore,
                  foodNameList: foodNameList,
                  foodMaterialList: foodMaterialList,
                  foodRecipeList: foodRecipeList,
                  foodCategoriesList: foodCategoriesList,
                  favoriteList: favoriteList),
            ),
            SizedBox(height: 70),
            menuBuildElevatedButton(
              context,
              icon: Icons.book,
              label: 'Tariflerim',
              color: Colors.teal,
              MyRecipesScreen(
                  userName: userName,
                  listStore: listStore,
                  addFoodStore: addFoodStore,
                  foodNameList: foodNameList,
                  foodMaterialList: foodMaterialList,
                  foodRecipeList: foodRecipeList,
                  foodCategoriesList: foodCategoriesList,
                  favoriteList: favoriteList),
            ),
            SizedBox(height: 65),
            menuBuildElevatedButton(
              context,
              icon: Icons.favorite,
              label: 'Favori Tariflerim',
              color: Colors.red.shade400,
              FavoriteRecipesScreen(
                  userName: userName,
                  listStore: listStore,
                  addFoodStore: addFoodStore,
                  foodNameList: foodNameList,
                  foodMaterialList: foodMaterialList,
                  foodRecipeList: foodRecipeList,
                  foodCategoriesList: foodCategoriesList,
                  favoriteList: favoriteList),
            ),
          ],
        ),
      ),
    );
  }
}
