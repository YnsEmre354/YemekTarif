import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:recipe_app2/service/FavouriteService.dart';
import 'package:recipe_app2/viewModel/addFoodViewModel.dart';
import 'package:recipe_app2/viewModel/observableListViewModel.dart';
import 'package:recipe_app2/widgets/BuildCard.dart';

class FavoriteRecipesScreen extends StatefulWidget {
  final ObservableList foodRecipeList;
  final ObservableList foodNameList;
  final ObservableList foodMaterialList;
  final ObservableList foodCategoriesList;
  final ObservableList favoriteList;
  final AddFoodStore addFoodStore;
  final ListStore listStore;
  final String userName;

  FavoriteRecipesScreen({
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
  _FavoriteRecipesScreenState createState() => _FavoriteRecipesScreenState();
}

class _FavoriteRecipesScreenState extends State<FavoriteRecipesScreen> {
  late Future<void> _fetchFavorites;

  @override
  void initState() {
    super.initState();
    _fetchFavorites = _loadFavoriteRecipes();
  }

  Future<void> _loadFavoriteRecipes() async {
    try {
      List fetchedFavoriteList =
          await FavouriteService.getFavouriteFoods(widget.userName);
      widget.listStore.favoriteList.clear();
      widget.listStore.favoriteList.addAll(fetchedFavoriteList);
    } catch (e) {
      print("Error fetching favorites: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favori Tariflerim")),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrange, Colors.red],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FutureBuilder<void>(
          future: _fetchFavorites,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text("Favori tarifler yüklenirken bir hata oluştu."));
            } else {
              return Observer(
                builder: (_) {
                  if (widget.listStore.favoriteList.isEmpty) {
                    return const Center(
                        child: Text("Hiç favori tarifiniz yok."));
                  }
                  return ListView.builder(
                    itemCount: widget.listStore.favoriteList.length,
                    itemBuilder: (context, index) {
                      var recipe = widget.listStore.favoriteList[index];

                      String title = recipe['foodName'] ?? 'Başlık Yok';
                      String description =
                          recipe['recipeName'] ?? 'Açıklama Yok';

                      return buildRecipeCard2(
                        context,
                        title: title,
                        description: description,
                      );
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
