import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:recipe_app2/service/FavouriteService.dart';
import 'package:recipe_app2/service/LoginService.dart';
import 'package:recipe_app2/view/ForgotPasswordScreen.dart';
import 'package:recipe_app2/view/MenuScreen.dart';
import 'package:recipe_app2/Functions/functions.dart';
import 'package:recipe_app2/view/SignUpScreen.dart';
import 'package:recipe_app2/viewModel/addFoodViewModel.dart';
import 'package:recipe_app2/viewModel/entryViewModel.dart';
import 'package:recipe_app2/viewModel/observableListViewModel.dart';

// ignore: must_be_immutable
class EntryScreen extends StatelessWidget {
  final loginService = LoginService();

  final EntryStore entryStore = EntryStore();

  TextEditingController userNameFieldController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ObservableList foodNameList;
  ObservableList foodMaterialList;
  ObservableList foodRecipeList;
  ObservableList foodCategoriesList;
  ObservableList favoriteList;

  final AddFoodStore addFoodStore;
  final ListStore listStore;
  String userName;

  EntryScreen(
      {required this.userName,
      required this.addFoodStore,
      required this.listStore,
      required this.foodNameList,
      required this.foodMaterialList,
      required this.foodRecipeList,
      required this.foodCategoriesList,
      required this.favoriteList});

  Future<void> fetchGetFavorite(String userName) async {
    List fetchedFavorite = await FavouriteService.getFavouriteFoods(userName);
    listStore.favoriteList = ObservableList.of(fetchedFavorite);
  }

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
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 100, 20, 40),
          child: Column(
            children: [
              Icon(
                Icons.restaurant,
                size: 240,
                color: Colors.white,
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(height: 30),
              TextField(
                controller: userNameFieldController,
                decoration: InputDecoration(
                  labelText: "User Name",
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 1000,
              ),
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    userNameFieldController.clear();
                    passwordController.clear();
                    Functions.navigateToScreen(context, ForgotPasswordScreen());
                  },
                  child: const Text(
                    'Forgot your password?',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Observer(
                builder: (_) => ElevatedButton(
                  onPressed: () async {
                    await fetchGetFavorite(userNameFieldController.text);
                    var loginResult = await loginService.loginState(
                        userNameFieldController.text, passwordController.text);
                    if (loginResult == 1) {
                      userName =
                          entryStore.setUserName(userNameFieldController.text);

                      userNameFieldController.clear();
                      passwordController.clear();
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
                    } else {
                      entryStore.warningString = "Invalid username or password";
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(entryStore.warningString)),
                      );
                    }
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(150, 50)),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextButton(
                onPressed: () {
                  userNameFieldController.clear();
                  passwordController.clear();
                  Functions.navigateToScreen(context, SignUpScreen());
                },
                child: const Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
