import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  SecureStorageHelper._();

  static const _storage = FlutterSecureStorage();
  static const _sessionIdKey = 'session_id';
  static const _accountIdKey = 'account_id';

  static Future<void> saveSessionId(String sessionId) async {
    await _storage.write(key: _sessionIdKey, value: sessionId);
  }

  static Future<String?> getSessionId() async {
    return await _storage.read(key: _sessionIdKey);
  }

  static Future<void> deleteSessionId() async {
    await _storage.delete(key: _sessionIdKey);
  }

  static Future<void> saveAccountId(int accountId) async {
    await _storage.write(key: _accountIdKey, value: accountId.toString());
  }

  static Future<String?> getAccountId() async {
    return await _storage.read(key: _accountIdKey);
  }

  static Future<void> deleteAccountId() async {
    await _storage.delete(key: _accountIdKey);
  }
}
