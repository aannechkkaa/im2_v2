import 'dart:convert';
import 'dart:io';

import 'package:im2/models/comments_model.dart';
import 'package:http/http.dart' as http;

class CommentApiService {
  final String APIUrl;
  final String JwtToken;
  static String endpoint = '/comment';

  CommentApiService(this.APIUrl ,this.JwtToken);

  Future<CommentModel> createComment(int eventId, String content) async {
    final queryParams = {
      'eventId': eventId
    };
    final uri = Uri.http(APIUrl, endpoint, queryParams);
    final response = await http.post(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $JwtToken',
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return CommentModel.fromJson(data);
    }
    throw Error();
  }

  Future deleteComment(int id) async {
    final queryParams = {
      'id': id,
    };
    final uri = Uri.http(APIUrl, endpoint, queryParams);
    final response = await http.delete(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $JwtToken',
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      if(response.body == 'ok') {
        return;
      }
    }
    throw Error();
  }
}