import 'dart:developer';

import 'package:dio/dio.dart';

class DioClient {
  static Dio initiate() {
    final dio = Dio(BaseOptions(baseUrl: 'https://open-api.my.id/api/wilayah'));

    // Add interceptors if needed
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          log('Request: ${options.method} ${options.path}', name: 'on request');
          // You can add custom headers or log requests here
          return handler.next(options);
        },
        onResponse: (response, handler) {
          log(
            'Response: ${response.statusCode} ${response.statusMessage}',
            name: 'on response',
          );
          // Handle responses here if needed
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          log('Error: ${e.message}', name: 'on error');
          // Handle errors here if needed
          return handler.next(e);
        },
      ),
    );

    return dio;
  }
}
