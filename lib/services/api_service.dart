import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:im2/models/user_model.dart';

class ApiService {
  static String APIUrl = 'http://10.0.2.2:3000';
  static String authEndpoint = '/auth';
  String? jwt;

  ApiService([this.jwt]);

  Future<String> logIn(String email, String password) async {
    final url = Uri.parse('$APIUrl$authEndpoint/login');
    final Map<String, dynamic> data = {
      'email' : email,
      'password': password
    };
    final response = await http.post(url, 
      headers: {
        'Content-Type': 'application/json'
      },
      body: json.encode(data)
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return data['accessToken'] as String;
    }
    throw Error();
  }

  setToken(String token) {
    jwt = token;
  }

  Future<UserModel> register(String email, String password, String? name) async {
    final url = Uri.parse('$APIUrl$authEndpoint/register');
    final Map<String, dynamic> data = {
      'email': email,
      'password': password,
    };
    if (name != null) {
      data['name'] = name;
    }
    final response = await http.post(url,
      body: data
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return UserModel.fromJson(data);
    }
    throw Error();
  }

  Future<UserModel> updateProfile(UpdateUserModel profile) async {
    final url = Uri.parse('$APIUrl/user');
    final request = http.MultipartRequest('POST', url);

    if(jwt != null) {
      request.headers['Authorization'] = 'Bearer ${jwt!}';
    }
    if(profile.file != null) {
      request.files.add(http.MultipartFile.fromBytes('file', profile.file!.readAsBytesSync()));      
    }
    if (profile.name != null) {
      request.fields['name'] = profile.name!;
    }
    if (profile.password != null) {
      request.fields['password'] = profile.password!;
    }
    final response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      final body = await response.stream.bytesToString();
      final data = jsonDecode(body);
      return UserModel.fromJson(data);
    }
    throw Error();
  }

  Future<UserModel> getProfile() async {
    final url = Uri.parse('$APIUrl/user');
    final request = http.MultipartRequest('POST', url);

    if(jwt != null) {
      request.headers['Authorization'] = 'Bearer ${jwt!}';
    }

    final response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      final body = await response.stream.bytesToString();
      final data = jsonDecode(body);
      return UserModel.fromJson(data);
    }
    throw Error();
  }

  Future<UserModel> updateImage(File image) async {
    final url = Uri.parse('$APIUrl/user');
    final request = http.MultipartRequest('POST', url);

    if(jwt != null) {
      request.headers['Authorization'] = 'Bearer ${jwt!}';
    }
    request.files.add(http.MultipartFile.fromBytes('file', image.readAsBytesSync()));      
    final response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      final body = await response.stream.bytesToString();
      final data = jsonDecode(body);
      return UserModel.fromJson(data);
    }
    throw Error();
  }
}