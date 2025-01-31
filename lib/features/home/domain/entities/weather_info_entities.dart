import 'package:equatable/equatable.dart';

class WeatherInfoEntities extends Equatable {
  final double? latitude;
  final double? longitude;
  final double? generationTimeMs;
  final int? utcOffsetSeconds;
  final String? timezone;
  final String? timezoneAbbreviation;
  final double? elevation;
  final HourlyUnitsEntities? hourlyUnits;
  final HourlyEntities? hourly;

  const WeatherInfoEntities({
    this.latitude,
    this.longitude,
    this.generationTimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.hourlyUnits,
    this.hourly,
  });

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        generationTimeMs,
        utcOffsetSeconds,
        timezone,
        timezoneAbbreviation,
        elevation,
        hourlyUnits,
        hourly,
      ];
}

class HourlyUnitsEntities extends Equatable {
  final String? time;
  final String? temperature2m;

  const HourlyUnitsEntities({this.time, this.temperature2m});

  @override
  List<Object?> get props => [time, temperature2m];
}

class HourlyEntities extends Equatable {
  final List<String>? time;
  final List<double>? temperature2m;

  const HourlyEntities({this.time, this.temperature2m});

  @override
  List<Object?> get props => [time, temperature2m];
}
