import 'package:connectivity_plus/connectivity_plus.dart';

mixin InternetConnection {
  final _connectivity = Connectivity();

  Future<bool> get hasInternetConnection async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } catch (e) {
      return false;
    }
  }
}
