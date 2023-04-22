import 'package:im2/models/event_model.dart';

class VerifiedEventModel {
  VerifiedEventModel(this.id, this.name, this.description, this.status, this.date);

  int id;
  String description;
  String name;
  DateTime date;
  Status status;
  List<EventModel> reposts = [];
}