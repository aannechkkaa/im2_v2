import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
List<User> Users = [];
// Создаем класс, который будет содержать данные пользователя и наследоваться от ChangeNotifier.
class User with ChangeNotifier {
  String _username = "";
  String _password = "";
  String _profile_description = "";
  String? _avatarUrl = "";
  int _age = 0;
  int _id = 0;
  String _email = "";

  String get username => _username;

  String get profile_description => _profile_description;

  String get password => _password;

  String get email => _email;

  String? get avatarUrl => _avatarUrl;

  int get age => _age;

  int get id => _id;

  void register(
      String username,
      String password,
      String? avatarUrl,
      int age,
      int id,
      String description,
      String mail,
      ) {
    _username = username;
    _password = password;
    _avatarUrl = avatarUrl;
    _age = age;
    _email = mail;
    _id = id;
    _profile_description = description;
    notifyListeners();
  }

  void updateUsername(String newUsername) {
    _username = newUsername;
    notifyListeners();
  }

  void updatePassword(String newPassword) {
    _password = newPassword;
    notifyListeners();
  }

  void updateAvatarUrl(String? newAvatarUrl) {
    _avatarUrl = newAvatarUrl;
    notifyListeners();
  }

  void updateAge(int newAge) {
    _age = newAge;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  void updateProfileDescription(String newProfileDescription) {
    _profile_description = newProfileDescription;
    notifyListeners();
  }
}
