import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../globalData.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 70);

    dio = Dio();
    dio!
      ..options.connectTimeout = timeOut
      ..options.receiveTimeout = timeOut;
    // dio!.interceptors.add(
    //   DioInterceptor(
    //     getDio(),
    //   ),
    // );

    dio!.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers = {
          "Content-Type": "application/json",
          "Accept": "application/json",
        };
        options.contentType = "application/json";
        options.headers["Authorization"] = 'Bearer $token'; // TODO: remove static token and search for best practice
        // // options.headers[ApiConstants.authorization] = 'Bearer 88|8xRKYp5u3ytwugWpFl0famhplZmfrxGmdy1b6XYpbd7cc4a8'; // TODO: remove static token and search for best practice
        options.sendTimeout = const Duration(
          seconds: 70,
        );
        options.receiveTimeout = const Duration(
          seconds: 70,
        );
        return handler.next(options);
      },
      onError: (e, handler) {
        if (e.response?.statusCode == 401) {
          getDio();
        }
        return handler.next(e);
      },
      onResponse: (e, handler) {
        if (e.statusCode == 401) {
          getDio();
        }
        return handler.next(e);
      },
    ));

    _addDioLogger();
    return dio!;
  }

  static void _addDioLogger() {
    if (kReleaseMode) return;
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
