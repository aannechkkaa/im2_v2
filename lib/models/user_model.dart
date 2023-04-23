import 'package:im2/models/event_model.dart';

class UserModel {
  UserModel(this.id, this.email, this.name, this.role);

  factory UserModel.fromJson(Map<String, dynamic> data) {
    final id = data['id'] as int;
    final role = data['role'] as Role;
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

enum Role {person, organization, admin}