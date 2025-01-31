import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:softbase/core/utils/mapper/data_mapper.dart';

import '../../domain/entities/weather_info_entities.dart';

part 'weather_by_coordinates_response.g.dart';

@JsonSerializable()
class WeatherByCoordinatesResponse extends DataMapper<WeatherInfoEntities> {
  final double? latitude;
  final double? longitude;
  @JsonKey(name: 'generationtime_ms')
  final double? generationTimeMs;
  @JsonKey(name: 'utc_offset_seconds')
  final int? utcOffsetSeconds;
  final String? timezone;
  @JsonKey(name: 'timezone_abbreviation')
  final String? timezoneAbbreviation;
  final double? elevation;
  @JsonKey(name: 'hourly_units')
  final HourlyUnits? hourlyUnits;
  final Hourly? hourly;

  WeatherByCoordinatesResponse(
      {this.elevation,
      this.generationTimeMs,
      this.hourly,
      this.hourlyUnits,
      this.latitude,
      this.longitude,
      this.timezone,
      this.timezoneAbbreviation,
      this.utcOffsetSeconds});

  factory WeatherByCoordinatesResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherByCoordinatesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherByCoordinatesResponseToJson(this);

  @override
  WeatherInfoEntities mapToEntity() {
    return WeatherInfoEntities(
      latitude: latitude,
      longitude: longitude,
      generationTimeMs: generationTimeMs,
      utcOffsetSeconds: utcOffsetSeconds,
      timezone: timezone,
      timezoneAbbreviation: timezoneAbbreviation,
      elevation: elevation,
      hourlyUnits: hourlyUnits?.mapToEntity(),
      hourly: hourly?.mapToEntity(),
    );
  }
}

@JsonSerializable()
class HourlyUnits extends DataMapper<HourlyUnitsEntities> {
  final String? time;
  @JsonKey(name: 'temperature_2m')
  final String? temperature2m;

  HourlyUnits({
    this.time,
    this.temperature2m,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) =>
      _$HourlyUnitsFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyUnitsToJson(this);

  @override
  HourlyUnitsEntities mapToEntity() {
    return HourlyUnitsEntities(
      time: time,
      temperature2m: temperature2m,
    );
  }
}

@JsonSerializable()
class Hourly extends DataMapper<HourlyEntities> {
  final List<String> time;
  @JsonKey(name: 'temperature_2m')
  final List<double> temperature2m;

  Hourly({
    this.time = const [],
    this.temperature2m = const [],
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);
  Map<String, dynamic> toJson() => _$HourlyToJson(this);

  @override
  HourlyEntities mapToEntity() {
    return HourlyEntities(
      time: time,
      temperature2m: temperature2m,
    );
  }
}
