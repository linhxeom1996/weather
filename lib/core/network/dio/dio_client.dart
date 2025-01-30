import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.example.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
    ));

    // interceptor or middleware add here
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Add header, example add token
        options.headers['Authorization'] = 'Bearer YOUR_TOKEN';
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // hangle response
        return handler.next(response);
      },
      onError: (DioException error, handler) {
        // handle error
        return handler.next(error);
      },
    ));
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? path,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
    bool isRetry = false,
    bool isShowError = false,
    bool isTranformData = true,
    bool isAuth = true,
    bool isProvinceHeader = true,
  }) async {
    try {
      return await dio.get(url);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String url, dynamic data) async {
    try {
      return await dio.post(url, data: data);
    } catch (e) {
      rethrow;
    }
  }
}
