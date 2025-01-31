import 'package:softbase/core/commundomain/based_api_result/api_result_model.dart';
import 'package:softbase/features/home/domain/entities/weather_info_entities.dart';
import 'package:softbase/utils/requests_models/weather_by_coordinates_request.dart';

abstract class HomeRepository {
  Future<ApiResultModel<WeatherInfoEntities?>> getWeatherDataByCoordinates(
      WeatherByCoordinatesRequest? request);
}
