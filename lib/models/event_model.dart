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

  factory EventModel.fromJson(Map<String, dynamic> data) {
    final id = data["id"] as int;
    final name = data["name"] as String;
    final status = data["status"] as Status;
    final date = data["date"] as DateTime;
    final host = data["host"] as UserModel;

    final event = EventModel(id, name, status, date, host);
    event.participants = data["participants"] as List<UserModel>;
    event.description = data["description"] as String?;
    event.groupLink = data["groupLink"] as String?;

    return event;
  }
}

enum Status {active, preparing, waiting, passed}