class WeatherData {
  final double currentTemperature;
  final double currentHumidity;
  final double currentWindSpeed;
  final int currentWeatherCode;

  final List<HourlyForecast> hourlyForecasts;
  final List<DailyForecast> dailyForecasts;

  WeatherData({
    required this.currentTemperature,
    required this.currentHumidity,
    required this.currentWindSpeed,
    required this.currentWeatherCode,
    required this.hourlyForecasts,
    required this.dailyForecasts,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    final current = json['current'] ?? {};
    final hourly = json['hourly'] ?? {};
    final daily = json['daily'] ?? {};

    // Parse Hourly
    List<HourlyForecast> hourlyList = [];
    if (hourly['time'] is List && hourly['temperature_2m'] is List) {
      final times = hourly['time'] as List;
      final temps = hourly['temperature_2m'] as List;
      final codes = hourly['weather_code'] as List?;

      for (int i = 0; i < times.length && i < 24; i++) {
        hourlyList.add(
          HourlyForecast(
            time: DateTime.parse(times[i] as String),
            temperature: (temps[i] as num).toDouble(),
            weatherCode: codes != null ? codes[i] as int : 0,
          ),
        );
      }
    }

    // Parse Daily
    List<DailyForecast> dailyList = [];
    if (daily['time'] is List &&
        daily['temperature_2m_max'] is List &&
        daily['temperature_2m_min'] is List) {
      final times = daily['time'] as List;
      final maxTemps = daily['temperature_2m_max'] as List;
      final minTemps = daily['temperature_2m_min'] as List;
      final codes = daily['weather_code'] as List?;

      for (int i = 0; i < times.length; i++) {
        dailyList.add(
          DailyForecast(
            date: DateTime.parse(times[i] as String),
            maxTemperature: (maxTemps[i] as num).toDouble(),
            minTemperature: (minTemps[i] as num).toDouble(),
            weatherCode: codes != null ? codes[i] as int : 0,
          ),
        );
      }
    }

    return WeatherData(
      currentTemperature:
          (current['temperature_2m'] as num?)?.toDouble() ?? 0.0,
      currentHumidity:
          (current['relative_humidity_2m'] as num?)?.toDouble() ?? 0.0,
      currentWindSpeed: (current['wind_speed_10m'] as num?)?.toDouble() ?? 0.0,
      currentWeatherCode: (current['weather_code'] as int?) ?? 0,
      hourlyForecasts: hourlyList,
      dailyForecasts: dailyList,
    );
  }
}

class HourlyForecast {
  final DateTime time;
  final double temperature;
  final int weatherCode;

  HourlyForecast({
    required this.time,
    required this.temperature,
    required this.weatherCode,
  });
}

class DailyForecast {
  final DateTime date;
  final double maxTemperature;
  final double minTemperature;
  final int weatherCode;

  DailyForecast({
    required this.date,
    required this.maxTemperature,
    required this.minTemperature,
    required this.weatherCode,
  });
}
