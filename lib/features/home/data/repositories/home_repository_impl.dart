import 'package:injectable/injectable.dart';
import 'package:softbase/core/commundomain/based_api_result/api_result_model.dart';
import 'package:softbase/features/home/data/datasource/home_remote_datasource.dart';
import 'package:softbase/features/home/domain/entities/weather_info_entities.dart';
import 'package:softbase/features/home/domain/repositories/home_repository.dart';
import 'package:softbase/utils/requests_models/weather_by_coordinates_request.dart';

import '../../../../core/commundomain/based_api_result/error_result_model.dart';
import '../models/weather_by_coordinates_response.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;
  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<ApiResultModel<WeatherInfoEntities?>> getWeatherDataByCoordinates(
      WeatherByCoordinatesRequest? request) async {
    final reponse =
        await _remoteDataSource.getWeatherDataByCoordinates(request);
    return reponse.when(
        success: (WeatherByCoordinatesResponse? successReponse) {
      return ApiResultModel<WeatherInfoEntities?>.success(
          data: successReponse?.mapToEntity());
    }, failure: (ErrorResultModel errorResultModel) {
      return ApiResultModel.failure(errorResultEntity: errorResultModel);
    });
  }
}
