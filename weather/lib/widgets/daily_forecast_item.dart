import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weather_data.dart';
import '../viewmodels/weather_viewmodel.dart';
import '../utils/weather_code_mapper.dart';

class DailyForecastItem extends StatelessWidget {
  final DailyForecast daily;
  final WeatherViewModel viewModel;

  const DailyForecastItem({
    super.key,
    required this.daily,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final dayString = DateFormat('EEEE').format(daily.date);
    final maxTemp = viewModel.convertTemp(daily.maxTemperature);
    final minTemp = viewModel.convertTemp(daily.minTemperature);
    final unitSymbol = viewModel.isCelsius ? '°C' : '°F';
    final weatherInfo = WeatherCodeMapper.getMapping(daily.weatherCode);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: Text(
                dayString,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            Icon(weatherInfo.icon, color: Colors.blueAccent, size: 28),
            Text(
              '${maxTemp.toStringAsFixed(0)}$unitSymbol / ${minTemp.toStringAsFixed(0)}$unitSymbol',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
