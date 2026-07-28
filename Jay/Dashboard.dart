Requirements
Develop the application using Flutter and Dart.

Follow the MVVM architecture.

Use a suitable networking approach such as Dio or the http package for API communication.

Use async/await for asynchronous operations.

Parse API responses using appropriate Dart models and JSON serialization.

Implement loading, error, and empty states.

Support searching weather by city.

Display the following on the city details screen:

Current weather information.

Hourly (time-wise) temperature forecast.

7-day weather forecast.

Ensure the hourly forecast is presented in a horizontal scrolling list, showing:

Time.

Weather icon.

Temperature.

Ensure the code is clean, well-structured, reusable, and maintainable.

Follow Flutter best practices for responsive UI and widget composition.

Bonus (Optional)
Current location support.

Recent searches.

Temperature unit switch (°C/°F).

Smooth animations.

Accessibility support.



  https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m&models=dwd_icon_seamless





You are an expert Flutter developer and Software Architect. 

Your task is to build a complete, production-ready Weather Application in Flutter using Dart, following the MVVM (Model-View-ViewModel) architecture.

### Requirements & Architecture Guidelines:
1. **Architecture**: Clean MVVM architecture. Separate presentation (Views/Widgets), logic (ViewModels/Providers/State), network/data layers (Services/Repositories), and data models.
2. **State Management**: Use `Provider` (or standard `ChangeNotifier` / `StateNotifier`) for state management.
3. **Networking**: Use `dio` or `http` for API requests. Include robust error handling and timeout handling.
4. **Data Sources**:
   - City Search/Geocoding API: `https://geocoding-api.open-meteo.com/v1/search?name={city_name}&count=5`
   - Weather Forecast API: `https://api.open-meteo.com/v1/forecast?latitude={lat}&longitude={lon}&current=temperature_2m,relative_humidity_2m,wind_speed_10m,weather_code&hourly=temperature_2m,weather_code&daily=weather_code,temperature_2m_max,temperature_2m_min&timezone=auto`
5. **UI & Feature Set**:
   - **Search Screen**: City search bar with recent search history support.
   - **City Details Screen**:
     - **Current Weather**: Temperature, weather condition icon/text, humidity, wind speed.
     - **Hourly Forecast**: Horizontal scrolling list displaying Time, Weather Icon, and Temperature.
     - **7-Day Forecast**: Vertical list showing Day, Weather Icon, Max Temp, and Min Temp.
   - **States**: Explicit support for Loading, Error (with retry button), and Empty/Initial states.
   - **Unit Toggle**: Support switching between Celsius (°C) and Fahrenheit (°F).
6. **Code Quality**:
   - Complete, non-truncated code for every file. Do NOT use placeholders or comments like `// TODO: implement rest`.
   - Responsive layout using standard Flutter best practices.
   - Clear model parsing with JSON serialization methods.

---

### File Structure to Implement:
Please provide the complete code for each of the following files separately, formatted with the exact file path above each code block:

1. `pubspec.yaml`
2. `lib/main.dart`
3. `lib/models/city_location.dart`
4. `lib/models/weather_data.dart`
5. `lib/services/api_service.dart`
6. `lib/repositories/weather_repository.dart`
7. `lib/viewmodels/weather_viewmodel.dart`
8. `lib/views/search_screen.dart`
9. `lib/views/weather_detail_screen.dart`
10. `lib/widgets/hourly_forecast_item.dart`
11. `lib/widgets/daily_forecast_item.dart`
12. `lib/widgets/state_views.dart` (Loading, Error, and Empty states)
13. `lib/utils/weather_code_mapper.dart` (Utility to map Open-Meteo weather codes to Icons and labels)

Generate the complete file code sequentially for each file listed above.
  
