class WeatherByCoordinatesRequest {
  final String latitude;
  final String longitude;
  final String hourly;
  WeatherByCoordinatesRequest(
      {this.hourly = "temperature_2m",
      required this.latitude,
      required this.longitude});
}
