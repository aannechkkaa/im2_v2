import 'dart:io';

import 'package:im2/models/event_model.dart';

class UserModel {
  UserModel(this.id, this.email, this.name, this.role);

  factory UserModel.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as int;
    final role = roleFromString(data['role']);
    final email = data['email'] as String;
    final name = data['name'] as String;

    final user = UserModel(id, email, name, role);
    user.image = data['image'] as String?;

    return user;
  }

  final int id;
  final Role role;
  int? telegramId;
  String? image;
  String name;
  String email;
  List<EventModel> eventsParticipant = [];
  List<EventModel> eventsHosting = [];
}

class CreateUserModel {
  CreateUserModel(this.email, this.password, this.name);

  String email;
  String password;
  String? name;
}

class UpdateUserModel {
  UpdateUserModel(this.password, this.name, this.file);

  String? password;
  String? name;
  File?  file;
}

enum Role {person, organization, admin}

Role roleFromString(String role) {
  switch (role) {
    case "PERSON": {
      return Role.person;
    }
    case "ADMIN": {
      return Role.admin;
    }
    case "ORGANIZATION": {
      return Role.organization;
    }
    default: {
      return Role.person;
    }
  }
}