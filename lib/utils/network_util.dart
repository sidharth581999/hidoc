// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

String base_url = "https://omdbapi.com";

class ApiEndpoints{
  
}

//network connectivity check
class NetworkHelper {
  static Future<bool> hasNetwork() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    // ignore: unrelated_type_equality_checks
    if (connectivityResult == ConnectivityResult.none) {
      return false; // No network available
    }

    // Check actual internet access
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false; // No internet
    }
  }
}


class DioSetup {
  static final DioSetup _instance = DioSetup._internal();
  late final Dio dio;

  factory DioSetup() {
    return _instance;
  }

  DioSetup._internal() {
    dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 6000),
        receiveTimeout: const Duration(seconds: 6000),
      ),
    );

  dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        return handler.next(options);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 401) {
        }
        return handler.next(error);
      },
    ));
  }
}





