import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/weather_viewmodel.dart';
import '../widgets/state_views.dart';
import 'weather_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _onCitySelected(WeatherViewModel viewModel, dynamic city) async {
    // Show a small loading indicator or handle selection cleanly
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );

    await viewModel.selectCity(city);

    if (!mounted) return;
    Navigator.pop(context); // Dismiss loading dialog

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const WeatherDetailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<WeatherViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Search'),
        actions: [
          IconButton(
            icon: Text(
              viewModel.isCelsius ? '°C' : '°F',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            onPressed: () => viewModel.toggleUnit(),
            tooltip: 'Toggle Unit',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search city (e.g., London, Tokyo)...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          viewModel.searchCities('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                viewModel.searchCities(value);
              },
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _buildBody(viewModel),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(WeatherViewModel viewModel) {
    switch (viewModel.state) {
      case ViewState.loading:
        return const LoadingView();
      case ViewState.error:
        return ErrorView(
          message: viewModel.errorMessage,
          onRetry: () => viewModel.searchCities(_searchController.text),
        );
      case ViewState.empty:
        return const EmptyView(message: 'No cities found.');
      case ViewState.initial:
      case ViewState.success:
        if (_searchController.text.isEmpty) {
          if (viewModel.recentSearches.isEmpty) {
            return const EmptyView(
                message: 'Search for a city to get weather details.');
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Recent Searches',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: viewModel.recentSearches.length,
                  itemBuilder: (context, index) {
                    final city = viewModel.recentSearches[index];
                    return ListTile(
                      leading: const Icon(Icons.history),
                      title: Text(city.name),
                      subtitle:
                          Text('${city.admin1 ?? ''}, ${city.country ?? ''}'),
                      onTap: () => _onCitySelected(viewModel, city),
                    );
                  },
                ),
              ),
            ],
          );
        }

        return ListView.builder(
          itemCount: viewModel.searchResults.length,
          itemBuilder: (context, index) {
            final city = viewModel.searchResults[index];
            return Card(
              child: ListTile(
                title: Text(city.name),
                subtitle: Text('${city.admin1 ?? ''}, ${city.country ?? ''}'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () => _onCitySelected(viewModel, city),
              ),
            );
          },
        );
    }
  }
}
