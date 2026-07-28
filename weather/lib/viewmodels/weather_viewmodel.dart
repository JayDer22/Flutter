import 'package:flutter/foundation.dart';
import '../models/city_location.dart';
import '../models/weather_data.dart';
import '../repositories/weather_repository.dart';

enum ViewState { initial, loading, success, error, empty }

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepository _repository;

  WeatherViewModel(this._repository);

  ViewState _state = ViewState.initial;
  ViewState get state => _state;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  List<CityLocation> _searchResults = [];
  List<CityLocation> get searchResults => _searchResults;

  final List<CityLocation> _recentSearches = [];
  List<CityLocation> get recentSearches => _recentSearches;

  CityLocation? _selectedCity;
  CityLocation? get selectedCity => _selectedCity;

  WeatherData? _weatherData;
  WeatherData? get weatherData => _weatherData;

  bool _isCelsius = true;
  bool get isCelsius => _isCelsius;

  void toggleUnit() {
    _isCelsius = !_isCelsius;
    notifyListeners();
  }

  double convertTemp(double celsius) {
    if (_isCelsius) return celsius;
    return (celsius * 9 / 5) + 32;
  }

  Future<void> searchCities(String query) async {
    if (query.trim().isEmpty) {
      _searchResults = [];
      _state = ViewState.initial;
      notifyListeners();
      return;
    }

    _state = ViewState.loading;
    notifyListeners();

    try {
      _searchResults = await _repository.searchCities(query);
      if (_searchResults.isEmpty) {
        _state = ViewState.empty;
      } else {
        _state = ViewState.success;
      }
    } catch (e) {
      _errorMessage = e.toString();
      _state = ViewState.error;
    }
    notifyListeners();
  }

  Future<void> selectCity(CityLocation city) async {
    _selectedCity = city;

    // Add to recent searches without duplication
    _recentSearches.removeWhere((element) => element.id == city.id);
    _recentSearches.insert(0, city);
    if (_recentSearches.length > 5) {
      _recentSearches.removeLast();
    }

    await fetchWeatherForSelectedCity();
  }

  Future<void> fetchWeatherForSelectedCity() async {
    if (_selectedCity == null) return;

    _state = ViewState.loading;
    notifyListeners();

    try {
      _weatherData = await _repository.getWeatherForCity(
        _selectedCity!.latitude,
        _selectedCity!.longitude,
      );
      _state = ViewState.success;
    } catch (e) {
      _errorMessage = e.toString();
      _state = ViewState.error;
    }
    notifyListeners();
  }
}
