// import 'package:get_it/get_it.dart';
// import 'package:graphql_2_rest/graphql_2_rest.dart';
//
// import '../../data/mapper/customer_dto_to_customer_entity_mapper.dart';
// import '../../data/mapper/customer_dto_to_customer_mapper.dart';
// import '../../data/mapper/customer_entity_to_customer_mapper.dart';
// import '../../data/mapper/customer_token_dto_to_session_entity_mapper.dart';
// import '../../data/mapper/delivery_time_type_dto_to_delivery_time_type_entity_mapper.dart';
// import '../../data/mapper/delivery_time_type_dto_to_delivery_time_type_mapper.dart';
// import '../../data/mapper/delivery_time_type_entity_to_delivery_time_type_mapper.dart';
// import '../../data/mapper/manager_comment_dto_to_manager_comment_mapper.dart';
// import '../../data/mapper/order_dto_to_order_mapper.dart';
// import '../../data/mapper/order_item_dto_to_order_item_mapper.dart';
// import '../../data/mapper/phone_hash_dto_to_phone_hash_mapper.dart';
// import '../../data/mapper/resend_code_dto_to_resend_code_mapper.dart';
// import '../../data/mapper/status_to_status_type_mapper.dart';
// import '../../data/mapper/stock_item_data_dto_to_stock_item_data_mapper.dart';
// import '../../data/mapper/store_config_dto_to_store_config_entity_mapper.dart';
// import '../../data/mapper/store_config_dto_to_store_config_mapper.dart';
// import '../../data/mapper/store_config_entity_to_store_config_mapper.dart';
// import '../../data/mapper/support_info_dto_to_support_info_mapper.dart';
// import '../../data/mapper/unfinished_order_item_entity_to_unfinished_order_item_mapper.dart';
// import '../../data/mapper/unfinished_order_item_to_unfinished_order_item_entity_mapper.dart';
// import '../../data/repository/authorization_repository.dart';
// import '../../data/repository/delivery_repository.dart';
// import '../../data/repository/order_repository.dart';
// import '../../data/repository/profile_repository.dart';
// import '../../data/repository/request_repository.dart';
// import '../../data/repository/store_config_repository.dart';
// import '../../data/source/local/database.dart';
// import '../../data/source/remote/api/authorization_api.dart';
// import '../../data/source/remote/api/delivery_api.dart';
// import '../../data/source/remote/api/order_api.dart';
// import '../../data/source/remote/api/profile_api.dart';
// import '../../data/source/remote/api/request_order_api.dart';
// import '../../data/source/remote/api/store_config_api.dart';
// import '../../data/use_case/add_manager_comment_use_case.dart';
// import '../../data/use_case/change_order_status_use_case.dart';
// import '../../data/use_case/change_request_status_use_case.dart';
// import '../../data/use_case/delete_unfinished_use_case.dart';
// import '../../data/use_case/get_active_orders_use_case.dart';
// import '../../data/use_case/get_current_date_time_use_case.dart';
// import '../../data/use_case/get_customer_use_case.dart';
// import '../../data/use_case/get_delivery_time_type_use_case.dart';
// import '../../data/use_case/get_order_use_case.dart';
// import '../../data/use_case/get_phone_hash_use_case.dart';
// import '../../data/use_case/get_ready_orders_use_case.dart';
// import '../../data/use_case/get_requests_use_case.dart';
// import '../../data/use_case/get_scheduled_orders_use_case.dart';
// import '../../data/use_case/get_store_config_use_case.dart';
// import '../../data/use_case/get_support_info_use_case.dart';
// import '../../data/use_case/get_unfinished_order_use_case.dart';
// import '../../data/use_case/is_authorized_use_case.dart';
// import '../../data/use_case/logout_use_case.dart';
// import '../../data/use_case/save_unfinished_order_use_case.dart';
// import '../../data/use_case/validate_otp_use_case.dart';
// import '../../domain/model/authorization_status.dart';
// import 'component/database_component.dart';
// import 'component/network_service_component.dart';
//
// T get<T extends Object>() => GetIt.I<T>();
//
// Future<void> setupDI({bool isDebug = true}) async {
//   GetIt.I
//     ..registerSingleton(GraphQLQueryBuilder())
//     ..registerSingleton(await initDatabase())
//     ..registerSingleton(
//       createNetworkService(
//         isDebug: isDebug,
//         database: get<Database>(),
//       ),
//     );
//
//   //Api
//   GetIt.I
//     ..registerFactory(() => ProfileApi(get(), get()))
//     ..registerFactory(() => AuthorizationApi(get(), get()))
//     ..registerFactory(() => StoreConfigApi(get(), get()))
//     ..registerFactory(() => DeliveryApi(get(), get()))
//     ..registerFactory(() => RequestApi(get(), get()))
//     ..registerFactory(() => OrderApi(get(), get()));
//
//   //Repository
//   GetIt.I
//     ..registerFactory(
//         () => AuthorizationRepository(get(), get(), get(), get(), get()))
//     ..registerFactory(
//       () => ProfileRepository(get(), get(), get(), get(), get(), get()),
//     )
//     ..registerFactory(() => RequestRepository(get(), get(), get()))
//     ..registerFactory(
//       () => DeliveryRepository(get(), get(), get(), get(), get()),
//     )
//     ..registerFactory(
//       () => StoreConfigRepository(get(), get(), get(), get(), get()),
//     )
//     ..registerFactory(
//       () => OrderRepository(get(), get(), get(), get(), get(), get()),
//     );
//
//   //UseCase
//   GetIt.I
//     ..registerFactory(() => ValidateOtpCodeUseCase(get()))
//     ..registerFactory(() => GetPhoneHash(get()))
//     ..registerFactory(() => IsAuthorizedStatusUseCase(get()))
//     ..registerFactory(() => GetActiveOrdersUseCase(get(), get()))
//     ..registerFactory(() => GetReadyOrdersUseCase(get(), get()))
//     ..registerFactory(() => GetScheduledOrdersUseCase(get(), get()))
//     ..registerFactory(() => GetSupportInfoUseCase(get()))
//     ..registerFactory(() => GetStoreConfigUseCase(get()))
//     ..registerFactory(() => GetDeliveryTimeTypeUseCase(get()))
//     ..registerFactory(() => GetCurrentDateTimeUseCase(get()))
//     ..registerFactory(() => LogoutUseCase(get()))
//     ..registerFactory(() => GetOrderUseCase(get(), get()))
//     ..registerFactory(() => GetCustomerUseCase(get()))
//     ..registerFactory(() => ChangeOrderStatusUseCase(get(), get()))
//     ..registerFactory(() => ChangeRequestStatusUseCase(get(), get()))
//     ..registerFactory(() => GetRequestsUseCase(get(), get()));
//
//   //Mapper
//   GetIt.I
//     ..registerFactory(() => PhoneHashDtoToPhoneHashMapper())
//     ..registerFactory(() => CustomerTokenDtoToSessionEntityMapper())
//     ..registerFactory(() => StoreConfigDtoToStoreConfigEntityMapper())
//     ..registerFactory(() => StoreConfigEntityToStoreConfigMapper())
//     ..registerFactory(() => ResendCodeDtoToResendCodeMapper())
//     ..registerFactory(() => DeliveryTimeTypeDtoToDeliveryTimeTypeMapper())
//     ..registerFactory(() => StoreConfigDtoToStoreConfigMapper())
//     ..registerFactory(() => StatusToStatusTypeMapper())
//     ..registerFactory(() => DeliveryTimeTypeDtoToDeliveryTimeTypeEntityMapper())
//     ..registerFactory(() => DeliveryTimeTypeEntityToDeliveryTimeTypeMapper())
//     ..registerFactory(() => ManagerCommentDtoToManagerCommentMapper())
//     ..registerFactory(() => OrderDtoToOrderMapper(get(), get(), get()))
//     ..registerFactory(() => SupportInfoDtoToSupportInfoMapper())
//     ..registerFactory(() => CustomerDtoToCustomerMapper())
//     ..registerFactory(() => StockItemDataDtoToStockItemDataMapper())
//     ..registerFactory(() => OrderItemDtoToOrderItemMapper(get()))
//     ..registerFactory(() => AddManagerCommentUseCase(get()))
//     ..registerFactory(() => GetUnfinishedOrderUseCase(get()))
//     ..registerFactory(() => SaveUnfinishedOrderUseCase(get()))
//     ..registerFactory(() => DeleteUnfinishedUseCase(get()))
//     ..registerFactory(
//       () => UnfinishedOrderItemToUnfinishedOrderItemEntityMapper(),
//     )
//     ..registerFactory(
//       () => UnfinishedOrderItemEntityToUnfinishedOrderItemMapper(),
//     )
//     ..registerFactory(() => CustomerDtoToCustomerEntityMapper())
//     ..registerFactory(() => CustomerEntityToCustomerMapper());
// }
//
// Future<AuthorizationStatus> getAuthorizationStatus() async {
//   final isAuthorized = await get<IsAuthorizedStatusUseCase>().getStatus();
//   return AuthorizationStatus(isAuthorized: isAuthorized);
// }
