
import 'package:injectable/injectable.dart';
import 'package:softbase/core/commundomain/based_api_result/api_result_model.dart';
import 'package:softbase/core/network/dio/dio_client.dart';
import 'package:softbase/features/home/data/models/weather_by_coordinates_response.dart';
import 'package:softbase/utils/requests_models/weather_by_coordinates_request.dart';

import '../../../../core/commundomain/based_api_result/error_result_model.dart';

mixin ApiUrl {
  static const String forecast = "/forecast";
}

abstract class HomeRemoteDataSource {
  Future<ApiResultModel<WeatherByCoordinatesResponse?>>
      getWeatherDataByCoordinates(WeatherByCoordinatesRequest? request);
}

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient _dioClient;
  HomeRemoteDataSourceImpl(this._dioClient);

  @override
  Future<ApiResultModel<WeatherByCoordinatesResponse?>>
      getWeatherDataByCoordinates(WeatherByCoordinatesRequest? request) async {
    final ApiResultModel weatherInfo =
        await _dioClient.get(ApiUrl.forecast, queryParameters: {
      'latitude': request?.latitude,
      'longitude': request?.longitude,
      'hourly': request?.hourly,
    });
    return await weatherInfo.when(success: (response) {
      return ApiResultModel.success(
          data: WeatherByCoordinatesResponse.fromJson(response));
    }, failure: (ErrorResultModel errorResultModel) {
      return ApiResultModel<WeatherByCoordinatesResponse?>.failure(
          errorResultEntity: errorResultModel);
    });
  }
}
