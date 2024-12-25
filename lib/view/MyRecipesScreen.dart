import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:recipe_app2/service/FavouriteService.dart';
import 'package:recipe_app2/viewModel/addFoodViewModel.dart';
import 'package:recipe_app2/viewModel/observableListViewModel.dart';
import 'package:recipe_app2/widgets/BuildCard.dart';

class MyRecipesScreen extends StatelessWidget {
  final ObservableList foodRecipeList;
  final ObservableList foodNameList;
  final ObservableList foodMaterialList;
  final ObservableList foodCategoriesList;
  final ObservableList favoriteList;
  final AddFoodStore addFoodStore;
  final ListStore listStore;
  final String userName;

  MyRecipesScreen(
      {required this.userName,
      required this.addFoodStore,
      required this.listStore,
      required this.foodNameList,
      required this.foodMaterialList,
      required this.foodRecipeList,
      required this.foodCategoriesList,
      required this.favoriteList});

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tariflerim")),
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepOrange, Colors.red],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Observer(
            builder: (_) {
              return ListView.builder(
                itemCount: listStore.foodRecipeList.length,
                itemBuilder: (context, index) {
                  var recipe = listStore.foodRecipeList[index];

                  String title = recipe['title'] ?? 'Başlık Yok';
                  String description = recipe['description'] ?? 'Açıklama Yok';
                  bool isFavorite = recipe['isFavourite'] ?? false;

                  return buildRecipeCard(context,
                      title: title,
                      description: description,
                      isFavorite: isFavorite, onFavoriteToggle: () async {
                    listStore.toggleFavourite(index);
                    FavouriteService.postFavourite(userName, title, true);
                  });
                },
              );
            },
          )),
    );
  }
}
