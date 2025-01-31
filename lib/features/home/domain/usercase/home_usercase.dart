import 'package:injectable/injectable.dart';
import 'package:softbase/core/commundomain/based_api_result/api_result_model.dart';
import 'package:softbase/core/commundomain/usecases/base_params_usecase.dart';
import 'package:softbase/features/home/domain/entities/weather_info_entities.dart';
import 'package:softbase/features/home/domain/repositories/home_repository.dart';
import 'package:softbase/utils/requests_models/weather_by_coordinates_request.dart';

@injectable
class GetWeatherDataByCoordinates
    implements
        BaseParamsUseCase<WeatherInfoEntities?, WeatherByCoordinatesRequest> {
  GetWeatherDataByCoordinates(this._repository);
  final HomeRepository _repository;
  @override
  Future<ApiResultModel<WeatherInfoEntities?>> call(
      WeatherByCoordinatesRequest? request) {
    return _repository.getWeatherDataByCoordinates(request);
  }
}
