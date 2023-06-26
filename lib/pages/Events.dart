
import 'package:flutter/material.dart';
import 'package:im2/pages/Comment.dart';

class Event with ChangeNotifier {
  String _category = "";
  String _name = "";
  String _shortDescription = "";
  String _longDescription = "";
  String _place = "";
  String _chatLink = "";
  DateTime _Date = DateTime.now();
  TimeOfDay _Time = TimeOfDay.now();
  int _index = 0;
  List<Comment_class> _comments = [];

  String? _picURL1 = "";
  String? _picURL2 = "";

  String? get picURL1 => _picURL1;
  String? get picURL2 => _picURL2;
  String get category => _category;
  String get name => _name;
  String get shortDescription => _shortDescription;
  String get longDescription => _longDescription;
  String get place => _place;
  String get chatLink => _chatLink;
  DateTime get Date => _Date;
  TimeOfDay get Time => _Time;
  int get index => _index;
  List<Comment_class> get comments => _comments;

  void setCategory(String category) {
    _category = category;
    notifyListeners();
  }

  void setIndex(int index) {
    _index = index;
    notifyListeners();
  }

  void setDate(DateTime date) {
    _Date = date;
    notifyListeners();
  }

  void setTime(TimeOfDay time) {
    _Time = time;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setPic1(String? url1) {
    _picURL1 = url1;
    notifyListeners();
  }

  void setPic2(String? url2) {
    _picURL2 = url2;
    notifyListeners();
  }


  void setShortDescription(String shortDescription) {
    _shortDescription = shortDescription;
    notifyListeners();
  }

  void setLongDescription(String longDescription) {
    _longDescription = longDescription;
    notifyListeners();
  }

  void setPlace(String place) {
    _place = place;
    notifyListeners();
  }

  void setChatLink(String chatLink) {
    _chatLink = chatLink;
    notifyListeners();
  }

  void addComment(Comment_class comment) {
    _comments.add(comment);
    notifyListeners();
  }

  void removeComment(Comment_class comment) {
    _comments.remove(comment);
    notifyListeners();
  }
}



