import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/weather_viewmodel.dart';
import '../widgets/hourly_forecast_item.dart';
import '../widgets/daily_forecast_item.dart';
import '../widgets/state_views.dart';
import '../utils/weather_code_mapper.dart';

class WeatherDetailScreen extends StatelessWidget {
  const WeatherDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WeatherViewModel>();
    final city = viewModel.selectedCity;

    return Scaffold(
      appBar: AppBar(
        title: Text(city?.name ?? 'Weather Details'),
        actions: [
          IconButton(
            icon: Text(
              viewModel.isCelsius ? '°C' : '°F',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onPressed: () => viewModel.toggleUnit(),
          ),
        ],
      ),
      body: _buildContent(viewModel),
    );
  }

  Widget _buildContent(WeatherViewModel viewModel) {
    switch (viewModel.state) {
      case ViewState.loading:
        return const LoadingView();
      case ViewState.error:
        return ErrorView(
          message: viewModel.errorMessage,
          onRetry: () => viewModel.fetchWeatherForSelectedCity(),
        );
      case ViewState.empty:
        return const EmptyView(message: 'No weather data available.');
      case ViewState.initial:
      case ViewState.success:
        final weather = viewModel.weatherData;
        if (weather == null) return const EmptyView(message: 'No data found.');

        final temp = viewModel.convertTemp(weather.currentTemperature);
        final unitSymbol = viewModel.isCelsius ? '°C' : '°F';
        final weatherInfo =
            WeatherCodeMapper.getMapping(weather.currentWeatherCode);

        return RefreshIndicator(
          onRefresh: () => viewModel.fetchWeatherForSelectedCity(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Current Weather Card
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${temp.toStringAsFixed(1)}$unitSymbol',
                                  style: const TextStyle(
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  weatherInfo.label,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              weatherInfo.icon,
                              size: 64,
                              color: Colors.blueAccent,
                            ),
                          ],
                        ),
                        const Divider(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildWeatherDetailItem(
                              Icons.water_drop,
                              'Humidity',
                              '${weather.currentHumidity}%',
                            ),
                            _buildWeatherDetailItem(
                              Icons.air,
                              'Wind Speed',
                              '${weather.currentWindSpeed} km/h',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // Hourly Forecast
                const Text(
                  'Hourly Forecast',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: weather.hourlyForecasts.length,
                    itemBuilder: (context, index) {
                      return HourlyForecastItem(
                        hourly: weather.hourlyForecasts[index],
                        viewModel: viewModel,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                // 7-Day Forecast
                const Text(
                  '7-Day Forecast',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: weather.dailyForecasts.length,
                  itemBuilder: (context, index) {
                    return DailyForecastItem(
                      daily: weather.dailyForecasts[index],
                      viewModel: viewModel,
                    );
                  },
                ),
              ],
            ),
          ),
        );
    }
  }

  Widget _buildWeatherDetailItem(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(color: Colors.grey, fontSize: 12)),
            Text(value,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ],
        ),
      ],
    );
  }
}
