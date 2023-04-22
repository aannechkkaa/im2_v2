import 'package:im2/models/user_model.dart';

class EventModel {
  EventModel(this.id, this.name, this.status, this.date, this.host);

  int id;
  String name;
  String? description;
  String? groupLink;
  Status status;
  DateTime date;
  UserModel host;
  List<UserModel> participants = [];
}

enum Status {active, preparing, waiting, passed}