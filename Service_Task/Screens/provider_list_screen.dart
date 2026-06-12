import 'package:flutter/material.dart';
import 'package:work_space/Screens/provider_detail_screen.dart';
import 'package:work_space/model/Data.dart';

class ProviderListScreen extends StatefulWidget {
  final String serviceName;

  const ProviderListScreen({
    super.key,
    required this.serviceName,
  });

  @override
  State<ProviderListScreen> createState() => _ProviderListScreenState();
}

class _ProviderListScreenState extends State<ProviderListScreen> {
  final Dummydata dummydata = Dummydata();

  final Set<String> _favorite = {};

  @override
  Widget build(BuildContext context) {
    final filterProvider = dummydata.Provider
        .where(
          (p) =>
      p.service.toLowerCase() ==
          widget.serviceName.toLowerCase(),
    )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.serviceName} Providers'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: filterProvider.length,
        itemBuilder: (context, index) {
          final provider = filterProvider[index];
          final isFavorite = _favorite.contains(provider.name);

          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            child: ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),

              trailing: IconButton(
                icon: Icon(
                  isFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                ),
                color: isFavorite ? Colors.red : null,
                onPressed: () {
                  setState(() {
                    if (isFavorite) {
                      _favorite.remove(provider.name);
                    } else {
                      _favorite.add(provider.name);
                    }
                  });
                },
              ),

              title: Text(
                provider.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Experience: ${provider.experience}',
                  ),
                  Text(
                    'Rating: ⭐ ${provider.rating}',
                  ),
                  Text(
                    'Phone: ${provider.phone}',
                  ),
                ],
              ),

              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(
                builder: (context) =>
                    ProviderDetailScreen( Provider: provider,),
                   ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}