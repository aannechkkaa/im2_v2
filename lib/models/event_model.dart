import 'package:flutter/foundation.dart';
import 'package:im2/models/comments_model.dart';
import 'package:im2/models/user_model.dart';

class EventModel {
  EventModel(this.id, this.name, this.status, this.date, this.host);

  int id;
  String name;
  String? description;
  String? shortDescription;
  String? groupLink;
  List<String>? images;
  Status status;
  DateTime date;
  UserModel host;
  List<UserModel> participants = [];
  List<CommentModel> comments = [];

  factory EventModel.fromJson(Map<String, dynamic> data) {
    final id = data["id"] as int;
    final name = data["name"] as String;
    final status = Status.values.byName((data["status"] as String).toLowerCase());
    final date = DateTime.parse(data["date"] as String);
    final host = UserModel.fromJson(data["host"]);

    final event = EventModel(id, name, status, date, host);
    if(data["participants"] != null) {
      Iterable l = data["participants"];
      event.participants = List<UserModel>.from(l.map((item) => UserModel.fromJson(item["user"])));
    }
    if(data["comments"] != null) {
      Iterable l = data["comments"];
      event.comments = List<CommentModel>.from(l.map((item) => CommentModel.fromJson(item)));
    }
    if(data["images"] != null) {
      final str = data["images"] as String;
      event.images = str.split(',');
    }
    event.description = data["description"] as String?;
    event.shortDescription = data["shortDescription"] as String?;
    event.groupLink = data["groupLink"] as String?;

    return event;
  }
}

enum Status {active, preparing, waiting, passed}

extension StatusEx on Status {
  String get name => describeEnum(this).toUpperCase();
}