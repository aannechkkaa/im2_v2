import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Создаем класс, который будет содержать данные пользователя и наследоваться от ChangeNotifier.
class User with ChangeNotifier {
  String _username = "";
  String _password = "";

  String get username => _username;

  String get password => _password;

  void register(String username, String password) {
    // Здесь вы можете выполнить проверку на уникальность имени пользователя и другие необходимые проверки.
    _username = username;
    _password = password;
    notifyListeners();
  }
}

