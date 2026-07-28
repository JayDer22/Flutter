import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weather_data.dart';
import '../viewmodels/weather_viewmodel.dart';
import '../utils/weather_code_mapper.dart';

class HourlyForecastItem extends StatelessWidget {
  final HourlyForecast hourly;
  final WeatherViewModel viewModel;

  const HourlyForecastItem({
    super.key,
    required this.hourly,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final timeString = DateFormat('jm').format(hourly.time);
    final temp = viewModel.convertTemp(hourly.temperature);
    final unitSymbol = viewModel.isCelsius ? '°C' : '°F';
    final weatherInfo = WeatherCodeMapper.getMapping(hourly.weatherCode);

    return Container(
      width: 80,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            timeString,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
          Icon(weatherInfo.icon, size: 32, color: Colors.blueAccent),
          Text(
            '${temp.toStringAsFixed(0)}$unitSymbol',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
