import '../models/city_location.dart';
import '../models/weather_data.dart';
import '../services/api_service.dart';

class WeatherRepository {
  final ApiService _apiService;

  WeatherRepository(this._apiService);

  Future<List<CityLocation>> searchCities(String query) async {
    if (query.trim().isEmpty) return [];
    return await _apiService.searchCities(query);
  }

  Future<WeatherData> getWeatherForCity(double lat, double lon) async {
    return await _apiService.getWeatherData(lat, lon);
  }
}
