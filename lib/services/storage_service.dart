import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  final _secureStorage = const FlutterSecureStorage();

  Future<void> writeItem(String key, String value) async => _secureStorage.write(key: key, value: value);

  Future<String?> getSelfInfo(String key) async =>_secureStorage.read(key: key);

  Future<void> setJwt(String jwt) async => await _secureStorage.write(key: "jwt", value: jwt);

  Future<String?> getJwt() async => await _secureStorage.read(key: "jwt");
}