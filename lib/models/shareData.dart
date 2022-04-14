import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedDataRepository {
  static final SharedDataRepository _repository =
      SharedDataRepository._internal();
  SharedDataRepository._internal();
  static SharedDataRepository instance = _repository;
  final _storage = FlutterSecureStorage();
  final String _token = 'bearer_token';

  Future<String?> getToken() async {
    return await _storage.read(key: _token);
  }

  Future<void> setToken(String bearerToken) async {
    await _storage.write(key: _token, value: bearerToken);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _token);
    return;
  }
}