// import '../source/local/database.dart';
// import '../source/remote/api/authorization_api.dart';
//
// class AuthorizationRepository {
//   final AuthorizationApi _authorizationApi;
//   final PhoneHashDtoToPhoneHashMapper _validatePhoneMapper;
//   final CustomerTokenDtoToSessionEntityMapper
//       _customerTokenDtoToSessionEntityMapper;
//   final ResendCodeDtoToResendCodeMapper _resendCodeDtoToResendCodeMapper;
//   final Database _database;
//
//   AuthorizationRepository(
//     this._authorizationApi,
//     this._validatePhoneMapper,
//     this._customerTokenDtoToSessionEntityMapper,
//     this._resendCodeDtoToResendCodeMapper,
//     this._database,
//   );
//
//   Future<PhoneHash> sendPhone(String phone) async {
//     final validatePhoneDto = await _authorizationApi.sendPhone(phone: phone);
//     return _validatePhoneMapper.map(validatePhoneDto);
//   }
//
//   Future<ResendCode> resendSMS({required String hash}) async {
//     final resendCodeDto = await _authorizationApi.resendSMS(hash: hash);
//     return _resendCodeDtoToResendCodeMapper.map(resendCodeDto);
//   }
//
//   Future<void> getCustomerToken({
//     required String phone,
//     required String otpCode,
//     required PhoneHash phoneHash,
//   }) async {
//     final customerTokenDto = await _authorizationApi.getCustomerToken(
//       phone: phone,
//       phoneHash: phoneHash,
//       otpCode: otpCode,
//     );
//     await _database.saveSession(
//       _customerTokenDtoToSessionEntityMapper.map(customerTokenDto),
//     );
//   }
//
//   Future<void> logout() => _database.clear();
// }
