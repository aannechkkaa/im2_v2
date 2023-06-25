import 'dart:convert';
import 'dart:io';

import 'package:im2/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserApiService {
  final String APIUrl;
  final String JwtToken;
  static String endpoint = '/user';

  UserApiService(this.APIUrl ,this.JwtToken);

  Future<UserModel> getProfile() async {
    final uri = Uri.http(APIUrl, endpoint);
    final response = await http.get(uri, headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $JwtToken',
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      final body = response.body;
      final data = jsonDecode(body);
      return UserModel.fromJson(data);
    }
    throw Error();
  }

  Future<UserModel> updateProfile(UpdateUserModel profile) async {
    final url = Uri.http(APIUrl, endpoint);
    final request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = 'Bearer $JwtToken';
    if(profile.file != null) {
      final img = profile.file!;
      request.files.add(http.MultipartFile('file', img.readAsBytes().asStream(), img.lengthSync(), filename: img.uri.pathSegments.last));      
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
  
  Future<UserModel> updateImage(File image) async {
    final url = Uri.http(APIUrl, '$endpoint/image');
    final request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = 'Bearer $JwtToken';
    request.files.add(http.MultipartFile('file', image.readAsBytes().asStream(), image.lengthSync(), filename: image.uri.pathSegments.last));      
    
    final response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      final body = await response.stream.bytesToString();
      final data = jsonDecode(body);
      return UserModel.fromJson(data);
    }
    throw Error();
  }
}