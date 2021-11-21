// import 'package:hive_flutter/adapters.dart';
// import 'package:path_provider/path_provider.dart';
//
// import '../../../data/model/local/customer_entity.dart';
// import '../../../data/model/local/delivery_time_type_entity.dart';
// import '../../../data/model/local/session_entity.dart';
// import '../../../data/model/local/store_config_entity.dart';
// import '../../../data/model/local/unfinished_order_item_entity.dart';
// import '../../../data/source/local/database.dart';
//
// Future<Database> initDatabase() async {
//   Hive
//     ..init((await getApplicationDocumentsDirectory()).path)
//     ..registerAdapter(SessionEntityAdapter())
//     ..registerAdapter(DeliveryTimeTypeEntityAdapter())
//     ..registerAdapter(UnfinishedOrderItemEntityAdapter())
//     ..registerAdapter(CustomerEntityAdapter())
//     ..registerAdapter(StoreConfigEntityAdapter());
//   return Database();
// }
