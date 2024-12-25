import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:recipe_app2/Functions/functions.dart';
import 'package:recipe_app2/service/AddFoodService.dart';
import 'package:recipe_app2/service/MyRecipesService.dart';
import 'package:recipe_app2/view/MyRecipesScreen.dart';
import 'package:recipe_app2/viewModel/addFoodViewModel.dart';
import 'package:recipe_app2/viewModel/observableListViewModel.dart';

class AddRecipeScreen extends StatelessWidget {
  ObservableList foodNameList;
  ObservableList foodMaterialList;
  ObservableList foodRecipeList;
  ObservableList foodCategoriesList;
  ObservableList favoriteList;

  AddFoodStore addFoodStore;

  ListStore listStore;
  String userName;

  AddRecipeScreen(
      {required this.userName,
      required this.addFoodStore,
      required this.listStore,
      required this.foodNameList,
      required this.foodMaterialList,
      required this.foodRecipeList,
      required this.foodCategoriesList,
      required this.favoriteList});

  // Controllers for the text fields
  final TextEditingController recipeController = TextEditingController();
  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController prepareTimeController = TextEditingController();
  final TextEditingController cookingTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    AddFoodService addFoodService = AddFoodService();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 244, 245, 223),
      ),
      backgroundColor: const Color.fromARGB(255, 244, 245, 223),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            DropdownButtonFormField<String>(
              value: addFoodStore.selectedCategory,
              onChanged: (String? newValue) {
                addFoodStore.setSelectedCategory(newValue!);
              },
              decoration: InputDecoration(
                labelText: 'Select Category',
                labelStyle: TextStyle(color: Colors.red),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              items: foodCategoriesList.map((category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            SizedBox(
              height: 40,
            ),
            TextField(
              controller: foodNameController,
              decoration: InputDecoration(
                labelText: "Food Name",
                labelStyle: TextStyle(color: Colors.red),
                prefixIcon: Icon(Icons.food_bank, color: Colors.red),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: prepareTimeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Prepare Time (minutes)",
                labelStyle: TextStyle(color: Colors.red),
                prefixIcon: Icon(Icons.timer, color: Colors.red),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: cookingTimeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Cooking Time (minutes)",
                labelStyle: TextStyle(color: Colors.red),
                prefixIcon: Icon(Icons.timer_outlined, color: Colors.red),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            // Recipe Input Field
            TextFormField(
              controller: recipeController,
              decoration: InputDecoration(
                labelText: 'Recipe Instructions',
                labelStyle: TextStyle(color: Colors.red),
                prefixIcon: Icon(Icons.article, color: Colors.red),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red),
                ),
              ),
              maxLines: 10,
              minLines: 5,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 40,
            ),

            ElevatedButton(
              onPressed: () async {
                // Tarif ekleme işlemleri
                await addFoodService.addCookingTime(
                  foodName: foodNameController.text,
                  prepTime: int.parse(prepareTimeController.text),
                  cookTime: int.parse(cookingTimeController.text),
                );

                await addFoodService.addRecipeTable(
                  foodName: foodNameController.text,
                  recipeName: recipeController.text,
                  username: userName,
                  categoryName: addFoodStore.selectedCategory,
                );

                // Yeni tarifleri almak ve listeyi güncellemek
                List fetchedNewFoodList = await MyRecipesService.getRecipes();

                foodRecipeList
                    .addAll(fetchedNewFoodList); // Yeni tarifleri ekleyin
                listStore.foodRecipeList =
                    ObservableList.of(foodRecipeList); // Listeyi güncelle
                //listStore.makeListUnique();

                // Listeyi güncelleyip flag'i true yapabilirsiniz
                listStore.setRecipeListUpdated(true);
                recipeController.clear();
                foodNameController.clear();
                prepareTimeController.clear();
                cookingTimeController.clear();
                listStore.categoriesList.clear();
              },
              child: const Text("Save Recipe"),
            ),
          ],
        ),
      ),
    );
  }
}
