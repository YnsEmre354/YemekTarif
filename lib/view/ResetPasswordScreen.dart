import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:recipe_app2/Functions/functions.dart';
import 'package:recipe_app2/service/LoginService.dart';
import 'package:recipe_app2/view/EntryScreen.dart';
import 'package:recipe_app2/view/MenuScreen.dart';
import 'package:recipe_app2/viewModel/addFoodViewModel.dart';
import 'package:recipe_app2/viewModel/observableListViewModel.dart';

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController currentPasswordController =
      TextEditingController();

  LoginService loginService = LoginService();
  final ObservableList foodNameList;
  final ObservableList foodMaterialList;
  final ObservableList foodRecipeList;
  final ObservableList foodCategoriesList;
  final ObservableList favoriteList;
  final AddFoodStore addFoodStore;
  final ListStore listStore;
  final String userName;

  ResetPasswordScreen(
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
    return Scaffold(
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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepOrangeAccent, Colors.indigo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock_outline,
                size: 100,
                color: Colors.white,
              ),
              SizedBox(height: 30),
              Text(
                'Enter your username and new password',
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              TextField(
                controller: userNameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: currentPasswordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Current Password',
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: newPasswordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'New Password',
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Colors.white),
                  prefixIcon: Icon(Icons.lock, color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  String username = userNameController.text;
                  String newPassword = newPasswordController.text;
                  String confirmPassword = confirmPasswordController.text;
                  var loginResult = await loginService.loginState(
                      userNameController.text, currentPasswordController.text);
                  loginService.resetPassword(username, newPassword);

                  if (loginResult == 1) {
                    if (newPassword == confirmPassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Password reset successful!')),
                      );
                      Navigator.pop(context);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Passwords do not match!')),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Invalid username or current password")));
                  }
                },
                child: Text(
                  "Reset Password",
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(150, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
