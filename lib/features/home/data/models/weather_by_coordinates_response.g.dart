// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_by_coordinates_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherByCoordinatesResponse _$WeatherByCoordinatesResponseFromJson(
        Map<String, dynamic> json) =>
    WeatherByCoordinatesResponse(
      elevation: (json['elevation'] as num?)?.toDouble(),
      generationTimeMs: (json['generationtime_ms'] as num?)?.toDouble(),
      hourly: json['hourly'] == null
          ? null
          : Hourly.fromJson(json['hourly'] as Map<String, dynamic>),
      hourlyUnits: json['hourly_units'] == null
          ? null
          : HourlyUnits.fromJson(json['hourly_units'] as Map<String, dynamic>),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      timezone: json['timezone'] as String?,
      timezoneAbbreviation: json['timezone_abbreviation'] as String?,
      utcOffsetSeconds: json['utc_offset_seconds'] as int?,
    );

Map<String, dynamic> _$WeatherByCoordinatesResponseToJson(
        WeatherByCoordinatesResponse instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'generationtime_ms': instance.generationTimeMs,
      'utc_offset_seconds': instance.utcOffsetSeconds,
      'timezone': instance.timezone,
      'timezone_abbreviation': instance.timezoneAbbreviation,
      'elevation': instance.elevation,
      'hourly_units': instance.hourlyUnits,
      'hourly': instance.hourly,
    };

HourlyUnits _$HourlyUnitsFromJson(Map<String, dynamic> json) => HourlyUnits(
      time: json['time'] as String,
      temperature2m: json['temperature_2m'] as String,
    );

Map<String, dynamic> _$HourlyUnitsToJson(HourlyUnits instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature2m,
    };

Hourly _$HourlyFromJson(Map<String, dynamic> json) => Hourly(
      time: (json['time'] as List<dynamic>).map((e) => e as String).toList(),
      temperature2m: (json['temperature_2m'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'time': instance.time,
      'temperature_2m': instance.temperature2m,
    };
