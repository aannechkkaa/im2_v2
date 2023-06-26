import 'package:im2/models/event_model.dart';
import 'package:im2/models/user_model.dart';

class CommentModel {
  CommentModel(this.id, this.content, this.createdAt, this.updatedAt);

  int id;
  String content;
  EventModel? event;
  UserModel? author;
  int reactions = 0;
  DateTime createdAt;
  DateTime updatedAt;

  factory CommentModel.fromJson(Map<String, dynamic> data) {
    final id = data["id"] as int;
    final content = data["content"] as String;
    final reactions = data["reactions"] as int;
    final createdAt = data["createdAt"] as DateTime;
    final updatedAt = data["updatedAt"] as DateTime;

    final comment = CommentModel(id,content, createdAt, updatedAt);
    comment.reactions = reactions;
    if(data["event"] != null) {
      comment.event = EventModel.fromJson(data["event"]);
    }
    if(data["author"] != null) {
      comment.author = UserModel.fromJson(data["author"]);
    }
    return comment;
  }
}