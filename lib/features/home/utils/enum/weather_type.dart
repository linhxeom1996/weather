import 'package:softbase/core/constants/app_assets.dart';

enum WeatherType { humidity, wind, rain }

extension WeatherTypeExt on WeatherType {
  String get name {
    switch (this) {
      case WeatherType.humidity:
        return "HUMIDITY";
      case WeatherType.wind:
        return "WIND";
      case WeatherType.rain:
        return "RAIN";
    }
  }

  String get icon {
    switch (this) {
      case WeatherType.humidity:
        return AppAssets.imagesIcHumidity;
      case WeatherType.wind:
        return AppAssets.imagesIcWind;
      case WeatherType.rain:
        return AppAssets.imagesIcRain;
    }
  }
}
