import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:recipe_app2/Functions/functions.dart';
import 'package:recipe_app2/service/FavouriteService.dart';
import 'package:recipe_app2/view/EntryScreen.dart';
import 'package:recipe_app2/viewModel/addFoodViewModel.dart';
import 'package:recipe_app2/viewModel/observableListViewModel.dart';
import 'package:recipe_app2/widgets/BuildCard.dart';

class SettingsScreen extends StatelessWidget {
  final ObservableList foodNameList;
  final ObservableList foodMaterialList;
  final ObservableList foodRecipeList;
  final ObservableList foodCategoriesList;
  final ObservableList favoriteList;

  final AddFoodStore addFoodStore;
  final ListStore listStore;
  final String userName;

  SettingsScreen({
    required this.userName,
    required this.addFoodStore,
    required this.listStore,
    required this.foodNameList,
    required this.foodMaterialList,
    required this.foodRecipeList,
    required this.foodCategoriesList,
    required this.favoriteList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrangeAccent, Colors.indigo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ElevatedButton.icon(
            icon: Icon(Icons.exit_to_app, color: Colors.white),
            label: Text(
              "Exit to Main Screen",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.indigoAccent,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              Functions.navigateToScreen(
                context,
                EntryScreen(
                  userName: userName,
                  addFoodStore: addFoodStore,
                  listStore: listStore,
                  foodNameList: foodNameList,
                  foodMaterialList: foodMaterialList,
                  foodRecipeList: foodRecipeList,
                  foodCategoriesList: foodCategoriesList,
                  favoriteList: favoriteList,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
