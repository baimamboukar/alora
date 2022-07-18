import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return Dio(BaseOptions(
      baseUrl: 'https://agentcrop.azurewebsites.net',
      sendTimeout: 60000,
      connectTimeout: 60000,
      receiveTimeout: 60000,
      contentType: Headers.jsonContentType,
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'en',
      }))
    ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
});
