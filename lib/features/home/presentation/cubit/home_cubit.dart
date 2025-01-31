import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:softbase/core/basecubit/base_cubit.dart';
import 'package:softbase/features/home/domain/usercase/home_usercase.dart';
import 'package:softbase/utils/requests_models/weather_by_coordinates_request.dart';

import '../../domain/entities/weather_info_entities.dart';
import 'home_state.dart';

@singleton
class HomeCubit extends BaseCubit<HomeState> {
  final GetWeatherDataByCoordinates _getWeatherDataByCoordinates;
  HomeCubit(this._getWeatherDataByCoordinates) : super(const HomeState());

  init() async {
    final reponse = await _getWeatherDataByCoordinates.call(
        WeatherByCoordinatesRequest(
            latitude: "11.548957", longitude: "107.810755"));
    reponse.when(
        success: (WeatherInfoEntities? weatherInfo) {
          log("check sucess: ${weatherInfo?.hourly?.temperature2m?.first}");
        },
        failure: (errorResult) {});
  }
}
