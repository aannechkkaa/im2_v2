import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:im2/models/user_model.dart';

class ApiService {
  static String APIUrl = 'http://localhost3000';
  static String authEndpoint = '/auth';

  Future<String> logIn(String email, String password) async {
    final url = Uri.parse('$APIUrl$authEndpoint/login');
    final response = await http.post(url, body: {email, password});
    if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['accessToken'] as String;
    }
    throw Error();
  }

  Future<UserModel> register(String email, String password, String? name) async {
    final url = Uri.parse('$APIUrl$authEndpoint/register');
    final response = await http.post(url, body: {email, password, name});
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserModel.fromJson(data);
    }
    throw Error();
  }
}