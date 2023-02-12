// import 'package:hive_flutter/hive_flutter.dart';
//
// import '../../../common/extension/list_extension.dart';
// import '../../model/local/customer_entity.dart';
// import '../../model/local/delivery_time_type_entity.dart';
// import '../../model/local/session_entity.dart';
// import '../../model/local/store_config_entity.dart';
// import '../../model/local/unfinished_order_item_entity.dart';
//
// class Database {
//   static const _boxNameSession = 'session_box';
//
//   static const _keySession = 'session';
//
//   static final _boxSession = Hive.openBox<String>(_boxNameSession);
//
//
//
//
//   Future<void> saveSession(SessionEntity sessionEntity) async =>
//       (await _boxSession).put(_keySession, sessionEntity);
//
//   Future<SessionEntity?> loadSession() async =>
//       (await _boxSession).get(_keySession);
//
//
//   Future<CustomerEntity?> loadCustomer() async =>
//       (await _boxCustomer).get(_keyCustomer);
//
//   Future<void> saveStoreConfig(StoreConfigEntity entity) async =>
//       (await _boxStoreConfig).put(_keyStoreConfig, entity);
//
//   Future<StoreConfigEntity?> loadStoreConfig() async =>
//       (await _boxStoreConfig).get(_keyStoreConfig);
//
//   Future<void> clear() async {
//     await (await _boxSession).clear();
//     await (await _boxStoreConfig).clear();
//     await (await _boxDeliveryTimeTypeList).clear();
//     await (await _boxCustomer).clear();
//     await (await _boxOrders).clear();
//   }
// }