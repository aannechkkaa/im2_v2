import 'dart:convert';
import 'dart:io';
//import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'package:im2/models/user_model.dart';
import 'package:im2/services/api/comment_api_service.dart';
import 'package:im2/services/api/event_api_service.dart';
import 'package:im2/services/api/user_api_service.dart';

class ApiService {
  static String APIUrl = 'http://167.71.196.196:80';
  static String authEndpoint = '/auth';
  
  late CommentApiService commentApi;
  late UserApiService userApi;
  late EventApiService eventApi;

  ApiService(String token) {
    commentApi = CommentApiService(APIUrl, token);
    userApi = UserApiService(APIUrl, token);
    eventApi = EventApiService(APIUrl, token);
  }
  
  static Future<String> logIn(String email, String password) async {
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

  static Future<UserModel> register(String email, int age, String password, String? name, String? imagePath) async {
    final url = Uri.parse('$APIUrl$authEndpoint/register');
    final request = http.MultipartRequest('POST', url);

    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['age'] = age.toString();
    if (name != null) {
      request.fields['name'] = name;
    }
    if (imagePath != null) {
      final imageFile = File(imagePath);
      final stream = http.ByteStream(imageFile.openRead());
      final length =  imageFile.length();

      final multipartFile = http.MultipartFile('file', stream, length as int, filename: imageFile.path);
      request.files.add(multipartFile);
    }

    final response = await request.send();

    if (response.statusCode == 201) {
      final body = await response.stream.bytesToString();
      final data = jsonDecode(body);
      return UserModel.fromJson(data);
    } else {
      throw Error();
    }
  }



}