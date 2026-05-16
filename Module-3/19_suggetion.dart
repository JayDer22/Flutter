import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController searchController =
  TextEditingController();

  List<String> allItems = [
    "Apple",
    "Banana",
    "Mango",
    "Orange",
    "Grapes",
    "Pineapple",
    "Watermelon",
    "Strawberry",
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();

    filteredItems = allItems;
  }

  void filterSearch(String value) {

    setState(() {

      filteredItems = allItems.where((item) {

        return item.toLowerCase().contains(
          value.toLowerCase(),
        );

      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Search Bar"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [


            TextField(
              controller: searchController,

              onChanged: filterSearch,

              decoration: const InputDecoration(
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),


            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,

                itemBuilder: (context, index) {

                  return ListTile(
                    title: Text(filteredItems[index]),
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