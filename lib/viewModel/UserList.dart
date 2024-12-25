import 'package:flutter/foundation.dart';

class UserList {
  ObserverList userNameList = ObserverList();
  ObserverList passwordList = ObserverList();

  void addUniqueUserName(String userName) {
    if (!userNameList.contains(userName)) {
      userNameList.add(userName);
    }
  }

  void addUniquePassword(String password) {
    if (!passwordList.contains(password)) {
      passwordList.add(password);
    }
  }

  void removeUserName(String userName) {
    userNameList.remove(userName);
  }

  void removePassword(String password) {
    passwordList.remove(password);
  }

  void clearUserNames() {
    userNameList.clear();
  }

  void clearPasswords() {
    passwordList.clear();
  }
}
