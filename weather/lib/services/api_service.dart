import 'package:dio/dio.dart';
import '../models/city_location.dart';
import '../models/weather_data.dart';

class ApiService {
  late final Dio _dio;

  ApiService() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  Future<List<CityLocation>> searchCities(String query) async {
    try {
      final response = await _dio.get(
        'https://geocoding-api.open-meteo.com/v1/search',
        queryParameters: {
          'name': query,
          'count': 5,
        },
      );

      final data = response.data;
      if (data != null && data['results'] != null) {
        final List results = data['results'];
        return results.map((json) => CityLocation.fromJson(json)).toList();
      }
      return [];
    } on DioException catch (e) {
      throw Exception('Failed to fetch cities: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }

  Future<WeatherData> getWeatherData(double lat, double lon) async {
    try {
      final response = await _dio.get(
        'https://api.open-meteo.com/v1/forecast',
        queryParameters: {
          'latitude': lat,
          'longitude': lon,
          'current':
              'temperature_2m,relative_humidity_2m,wind_speed_10m,weather_code',
          'hourly': 'temperature_2m,weather_code',
          'daily': 'weather_code,temperature_2m_max,temperature_2m_min',
          'timezone': 'auto',
        },
      );

      return WeatherData.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to fetch weather data: ${e.message}');
    } catch (e) {
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
