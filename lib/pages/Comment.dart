import 'package:flutter/material.dart';

class Comment_class {
  String _commentText = "";
  int _commentId = 0;
  String _commentAuthorName = "";
  DateTime _commentDate = DateTime.now();
  TimeOfDay _commentTime = TimeOfDay.now();

  String get commentText => _commentText;
  int get commentId => _commentId;
  String get commentAuthorName => _commentAuthorName;
  DateTime get commentDate => _commentDate;
  TimeOfDay get commentTime => _commentTime;

  void setCommentText(String commentText) {
    _commentText = commentText;
  }

  void setCommentId(int commentId) {
    _commentId = commentId;
  }

  void setCommentAuthorName(String commentAuthorName) {
    _commentAuthorName = commentAuthorName;
  }

  void setCommentDate(DateTime commentDate) {
    _commentDate = commentDate;
  }

  void setCommentTime(TimeOfDay commentTime) {
    _commentTime = commentTime;
  }

  Comment_class({
    required String commentText,
    required int commentId,
    required String commentAuthorName,
    required DateTime commentDate,
    required TimeOfDay commentTime,
  })  : _commentText = commentText,
        _commentId = commentId,
        _commentAuthorName = commentAuthorName,
        _commentDate = commentDate,
        _commentTime = commentTime;
}

