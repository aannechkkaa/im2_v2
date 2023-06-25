import 'dart:convert';
import 'dart:io';

import 'package:im2/models/event_model.dart';
import 'package:http/http.dart' as http;

class EventApiService {
  final String APIUrl;
  final String JwtToken;
  static String endpoint = '/event';

  EventApiService(this.APIUrl ,this.JwtToken);

  Future<EventModel> getEvent(int id) async {
    final queryParams = {
      'id': id
    };
    final uri = Uri.http(APIUrl, endpoint, queryParams);
    final response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $JwtToken',
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return EventModel.fromJson(data);
    }
    throw Error();
  }

  Future<EventModel> createEvent(String name, String? description, DateTime date, Status status) async {
    final uri = Uri.http(APIUrl, endpoint);
    final Map<String, dynamic> data  = {
      "name": name,
      "date": date,
      "status": status
    };
    if (description != null) {
      data["description"] = description;
    }
    final response = await http.post(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $JwtToken',
    }, body: data);

    if(response.statusCode == 201) {
      final result = jsonDecode(response.body);
      return EventModel.fromJson(result);
    }

    throw Error();
  }

  Future joinEvent(int id) async {
    final queryParams = {
      'id': id,
    };
    final uri = Uri.http(APIUrl, '$endpoint/join', queryParams);
    final response = await http.post(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $JwtToken'
    });

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      if (result == 'ok') {
        return;
      }
    }
    throw Error();
  }

  Future leaveEvent(int id) async {
    final queryParams = {
      'id': id,
    };
    final uri = Uri.http(APIUrl, '$endpoint/leave', queryParams);
    final response = await http.post(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $JwtToken'
    });

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      if (result == 'ok') {
        return;
      }
    }
    throw Error();
  }

  Future closeEvent(int id) async {
    final queryParams = {
      'id': id,
    };
    final uri = Uri.http(APIUrl, '$endpoint/close', queryParams);
    final response = await http.post(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $JwtToken'
    });

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      if (result == 'ok') {
        return;
      }
    }
    throw Error();
  }
}