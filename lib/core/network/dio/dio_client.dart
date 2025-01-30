import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:softbase/core/commundomain/based_api_result/api_result_model.dart';

import '../../commundomain/based_api_result/error_result_model.dart';

@singleton
class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio(BaseOptions(
      baseUrl: 'https://api.open-meteo.com/v1',
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

  Future<ApiResultModel<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    try {
      final response = await dio.get(
        endpoint,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            ...?headers,
          },
        ),
      );

      if (response.statusCode == 200) {
        return ApiResultModel.success(
          data: response.data,
        );
      } else {
        return ApiResultModel.failure(
          errorResultEntity: ErrorResultModel(
            message: 'Unexpected error',
            statusCode: response.statusCode,
          ),
        );
      }
    } catch (e) {
      if (e is DioException) {
        return ApiResultModel.failure(
          errorResultEntity: ErrorResultModel(
            message: e.message ?? 'Dio error',
            statusCode: e.response?.statusCode,
          ),
        );
      }
      return const ApiResultModel.failure(
        errorResultEntity: ErrorResultModel(
          message: 'Unknown error',
        ),
      );
    }
  }

  Future<ApiResultModel<T>> post<T>(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic data,
  }) async {
    try {
      final response = await dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            ...?headers,
          },
        ),
      );

      if (response.statusCode == 200) {
        return ApiResultModel.success(
          data: response.data,
        );
      } else {
        return ApiResultModel.failure(
          errorResultEntity: ErrorResultModel(
            message: 'Unexpected error',
            statusCode: response.statusCode,
          ),
        );
      }
    } catch (e) {
      if (e is DioException) {
        return ApiResultModel.failure(
          errorResultEntity: ErrorResultModel(
            message: e.message ?? 'Dio error',
            statusCode: e.response?.statusCode,
          ),
        );
      }
      return const ApiResultModel.failure(
        errorResultEntity: ErrorResultModel(
          message: 'Unknown error',
        ),
      );
    }
  }
}
