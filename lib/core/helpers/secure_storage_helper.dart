import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  SecureStorageHelper._();

  static const _storage = FlutterSecureStorage();
  static const _sessionIdKey = 'session_id';

  static Future<void> saveSessionId(String sessionId) async {
    await _storage.write(key: _sessionIdKey, value: sessionId);
  }

  static Future<String?> getSessionId() async {
    return await _storage.read(key: _sessionIdKey);
  }

  static Future<void> deleteSessionId() async {
    await _storage.delete(key: _sessionIdKey);
  }
}
