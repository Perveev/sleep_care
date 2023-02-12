// import 'package:hive/hive.dart';
//
// class Database {
//   static const _boxNameSession = 'session_box';
//
//   static const _keyRefresh = 'refresh';
//   static const _keyAccess = 'access';
//
//   static final _boxSession = Hive.openBox<String>(_boxNameSession);
//
//   Future<void> saveRefreshToken(String refreshToken) async =>
//       (await _boxSession).put(_keyRefresh, refreshToken);
//
//   Future<String?> loadRefreshToken() async =>
//       (await _boxSession).get(_keyRefresh);
//
//   Future<void> saveAccessToken(String accessToken) async =>
//       (await _boxSession).put(_keyAccess, accessToken);
//
//   Future<String?> loadAccessToken() async =>
//       (await _boxSession).get(_keyAccess);
// }
