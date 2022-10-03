
class Weather {
  final String location;
  final double temperatureC;
  final double temperatureF;
  final String condition;
  final String country;
  final int cloud;
  final int humidity;

  Weather({
    this.temperatureC = 0,
    this.temperatureF = 0,
    this.condition = "Sunny",
    this.location = "",
    this.country = "",
    this.cloud = 0,
    this.humidity = 0
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperatureC: json['current']['temp_c'],
      temperatureF: json['current']['temp_f'],
      condition: json['current']['condition']['text'],
      location: json['location']['name'],
      country: json['location']['country'],
      cloud: json['current']['cloud'],
      humidity: json['current']['humidity']
    );
  }
}