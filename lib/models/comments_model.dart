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
}