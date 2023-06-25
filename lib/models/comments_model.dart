import 'package:im2/models/event_model.dart';
import 'package:im2/models/user_model.dart';

class CommentModel {
  CommentModel(this.id, this.content, this.event, this.author, this.createdAt, this.updatedAt);

  int id;
  String content;
  EventModel event;
  UserModel author;
  int reactions = 0;
  DateTime createdAt;
  DateTime updatedAt;

  factory CommentModel.fromJson(Map<String, dynamic> data) {
    final id = data["id"] as int;
    final content = data["content"] as String;
    final event = data["event"] as EventModel;
    final author = data["author"] as UserModel;
    final reactions = data["reactions"] as int;
    final createdAt = data["createdAt"] as DateTime;
    final updatedAt = data["updatedAt"] as DateTime;

    final comment = CommentModel(id,content, event, author, createdAt, updatedAt);
    comment.reactions = reactions;
    return comment;
  }
}