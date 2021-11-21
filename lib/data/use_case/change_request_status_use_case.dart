// import '../repository/request_repository.dart';
// import '../repository/store_config_repository.dart';
//
// class ChangeRequestStatusUseCase {
//   final RequestRepository _requestRepository;
//   final StoreConfigRepository _storeConfigRepository;
//
//   ChangeRequestStatusUseCase(
//     this._requestRepository,
//     this._storeConfigRepository,
//   );
//
//   Future<void> acceptRequest(int requestId) async {
//     final storeConfig = await _storeConfigRepository.getStoreConfig();
//     return _requestRepository.acceptRequest(requestId, storeConfig);
//   }
//
//   Future<void> rejectRequest(int requestId) async {
//     final storeConfig = await _storeConfigRepository.getStoreConfig();
//     return _requestRepository.rejectRequest(requestId, storeConfig);
//   }
// }
