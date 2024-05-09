import 'dart:js_util';

import 'dart:async';
//import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User with ChangeNotifier {
  String _username = '';
  String _password = '';
  String _profileDescription = '';
  String? _avatarUrl;
  int _age = 0;
  int _id = 0;
  String _email = '';
  bool _isAdmin = false;

  String get username => _username;
  String get profile_description => _profileDescription;
  String get password => _password;
  String get email => _email;
  String? get avatarUrl => _avatarUrl;
  int get age => _age;
  int get id => _id;
  bool get isAdmin => _isAdmin;

  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  Future<void> register(
      String username,
      String password,
      String? avatarUrl,
      int age,
      String description,
      String mail,
      bool isAdmin,
      ) async {
    try {
      _username = username;
      _password = password;
      _avatarUrl = avatarUrl;
      _age = age;
      _email = mail;
      _profileDescription = description;
      _isAdmin = isAdmin;
      notifyListeners();

      if (_username.isEmpty) {
        print('Error: Username is required');
        return;
      }

      if (_password.isEmpty) {
        print('Error: Password is required');
        return;
      }

      if (_email.isEmpty) {
        print('Error: Email is required');
        return;
      }

      final userData = {
        'username': _username,
        'password': _password,
        'avatarUrl': _avatarUrl ?? '', // Use empty string if null
        'age': _age,
        'email': _email,
        'profileDescription': _profileDescription,
        'isAdmin': _isAdmin,
      };

      // Add a new document with a generated ID
      final newUserRef = await usersCollection.add(userData);
      _id = int.parse(newUserRef.id); // Parse the document ID as an integer
      debugPrint('User registered on Firestore with ID: $_id');
    } catch (e) {
      debugPrint('Error registering user: $e');
      // Handle error appropriately, maybe throw an exception or show a snackbar
    }
  }


  Future<void> login(String email, String password) async {
    try {
      var userQuery = await usersCollection
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .limit(1)
          .get();

      if (userQuery.docs.isNotEmpty) {
        var userDoc = userQuery.docs.first;
        var userData = userDoc.data() as Map<String, dynamic>?;

        if (userData != null) {
          _username = userData['username'] as String? ?? '';
          _avatarUrl = userData['avatarUrl'] as String? ?? null;
          _age = userData['age'] as int? ?? 0;
          _email = userData['email'] as String? ?? '';
          _id = userData['id'] as int? ?? 0;
          _profileDescription = userData['profileDescription'] as String? ?? '';
          _isAdmin = userData['isAdmin'] as bool? ?? false;
          notifyListeners();

          print('User logged in successfully');
        } else {
          print('User data is null');
          // Handle null user data appropriately
        }
      } else {
        print('User not found or incorrect credentials');
        // Handle invalid credentials, maybe throw an exception or show a snackbar
      }
    } catch (e) {
      print('Error logging in: $e');
      // Handle error appropriately, maybe throw an exception or show a snackbar
    }
  }

  void logout() {
    _username = '';
    _password = '';
    _avatarUrl = null;
    _age = 0;
    _email = '';
    _id = 0;
    _profileDescription = '';
    _isAdmin = false;
    notifyListeners();
    print('User logged out');
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
    _profileDescription = newProfileDescription;
    notifyListeners();
  }
}

List<User> Users = [];
User current_user = User();
int userId = 0;