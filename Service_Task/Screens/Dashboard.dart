import 'package:flutter/material.dart';
import 'package:work_space/Screens/provider_list_screen.dart';
import 'package:work_space/model/Data.dart';

import '../model/service_model.dart';
import 'carddesign.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Dummydata dummydata = Dummydata();

  List<ServiceModel> filteredServices = [];
  String searchQuery = '';
  final bool _showBottomNav = true;
  int _selectedBottomIndex = 0;

  @override
  void initState() {
    super.initState();
    filteredServices = dummydata.Servises;
  }

  void filterSearch(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredServices = dummydata.Servises;
      } else {
        filteredServices = dummydata.Servises
            .where(
              (service) => service.title
              .toLowerCase()
              .contains(query.toLowerCase()),
        )
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "Smart Services Marketplace",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.teal),
              child: Column(
                children: const [
                  CircleAvatar(
                    maxRadius: 40,
                    backgroundImage: AssetImage('img.png'),
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Jay Der",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("My profile"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text("About us"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("LogOut"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              onChanged: filterSearch,
              decoration: const InputDecoration(
                labelText: "Click to Search",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: filteredServices.length,
                itemBuilder: (context, index) {
                  return Carddesign(
                    onTap: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(
                          builder: (context) => ProviderListScreen(serviceName:  filteredServices[index].title,),
                         ),
                       );
                    },
                    model: filteredServices[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}