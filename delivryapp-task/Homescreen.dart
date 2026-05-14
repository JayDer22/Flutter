import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  // SEARCH CONTROLLER

  TextEditingController searchController =
  TextEditingController();

  String searchText = "";

  // ALL ITEMS

  final List<Map<String, String>> allItems = [

    // PIZZAS

    {
      "image":
      "https://images.unsplash.com/photo-1513104890138-7c749659a591",
      "name": "Cheese Pizza",
      "price": "₹299",
      "category": "Pizza",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1548365328-9f547fb0953b",
      "name": "Farmhouse Pizza",
      "price": "₹399",
      "category": "Pizza",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1604382354936-07c5d9983bd3",
      "name": "Paneer Pizza",
      "price": "₹449",
      "category": "Pizza",
    },

    // BURGERS

    {
      "image":
      "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
      "name": "Veg Burger",
      "price": "₹149",
      "category": "Burger",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1550547660-d9450f859349",
      "name": "Cheese Burger",
      "price": "₹199",
      "category": "Burger",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1520072959219-c595dc870360",
      "name": "Chicken Burger",
      "price": "₹249",
      "category": "Burger",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1572802419224-296b0aeee0d9",
      "name": "Double Patty Burger",
      "price": "₹299",
      "category": "Burger",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1553979459-d2229ba7433b",
      "name": "Spicy Burger",
      "price": "₹219",
      "category": "Burger",
    },

    // DRINKS

    {
      "image":
      "https://images.unsplash.com/photo-1517701604599-bb29b565090c",
      "name": "Cold Coffee",
      "price": "₹99",
      "category": "Drinks",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1513558161293-cdaf765ed2fd",
      "name": "Mojito",
      "price": "₹129",
      "category": "Drinks",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1499636136210-6f4ee915583e",
      "name": "Chocolate Shake",
      "price": "₹149",
      "category": "Drinks",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1509042239860-f550ce710b93",
      "name": "Hot Coffee",
      "price": "₹89",
      "category": "Drinks",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1544145945-f90425340c7e",
      "name": "Strawberry Shake",
      "price": "₹159",
      "category": "Drinks",
    },

    // DESSERTS

    {
      "image":
      "https://images.unsplash.com/photo-1606313564200-e75d5e30476c",
      "name": "Brownie",
      "price": "₹129",
      "category": "Deserts",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1570197788417-0e82375c9371",
      "name": "Ice Cream",
      "price": "₹89",
      "category": "Deserts",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1551024601-bec78aea704b",
      "name": "Chocolate Cake",
      "price": "₹199",
      "category": "Deserts",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1488477181946-6428a0291777",
      "name": "Donuts",
      "price": "₹149",
      "category": "Deserts",
    },

    {
      "image":
      "https://images.unsplash.com/photo-1464306076886-da185f6a9d05",
      "name": "Cup Cake",
      "price": "₹99",
      "category": "Deserts",
    },
  ];

  // ITEM CONTAINER

  Widget itemContainer(
      String image,
      String name,
      String price,
      ) {

    return Container(

      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius: BorderRadius.circular(18),

        boxShadow: [

          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Row(

        children: [

          ClipRRect(

            borderRadius: BorderRadius.circular(15),

            child: Image.network(

              image,

              height: 95,
              width: 95,

              fit: BoxFit.cover,

              errorBuilder:
                  (context, error, stackTrace) {

                return Container(

                  height: 95,
                  width: 95,

                  color: Colors.grey.shade300,

                  child: const Icon(
                    Icons.image,
                    size: 40,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: 15),

          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(

                  name,

                  maxLines: 1,

                  overflow:
                  TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(

                  "Delicious & Fresh",

                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),

                const SizedBox(height: 10),

                Row(

                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: [

                    Text(

                      price,

                      style: const TextStyle(

                        fontSize: 18,

                        color: Colors.orange,

                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    Container(

                      decoration: BoxDecoration(

                        color: Colors.orange,

                        borderRadius:
                        BorderRadius.circular(10),
                      ),

                      child: const Padding(

                        padding: EdgeInsets.all(6),

                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // FILTER ITEMS

  List<Map<String, String>> getFilteredItems(
      String category) {

    List<Map<String, String>> items =
    category == "All"
        ? allItems
        : allItems.where((item) {
      return item["category"] ==
          category;
    }).toList();

    if (searchText.isNotEmpty) {

      items = items.where((item) {

        return item["name"]!
            .toLowerCase()
            .contains(
          searchText.toLowerCase(),
        );
      }).toList();
    }

    return items;
  }

  // BUILD LIST

  Widget buildList(String category) {

    List<Map<String, String>> items =
    getFilteredItems(category);

    if (items.isEmpty) {

      return const Center(

        child: Text(

          "No Item Found",

          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return ListView.builder(

      itemCount: items.length,

      itemBuilder: (context, index) {

        return itemContainer(

          items[index]["image"]!,
          items[index]["name"]!,
          items[index]["price"]!,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(

      length: 5,

      child: Scaffold(

        backgroundColor:
        Colors.grey.shade100,

        appBar: AppBar(

          backgroundColor: Colors.white,

          elevation: 0,

          title: const Text(

            "Pizzaa Hub",

            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),

          actions: [

            IconButton(

              onPressed: () {},

              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 28,
              ),
            ),
          ],
        ),

        body: SafeArea(

          child: Column(

            children: [

              // TOP IMAGE

              Container(

                margin:
                const EdgeInsets.symmetric(
                  horizontal: 15,
                ),

                child: ClipRRect(

                  borderRadius:
                  BorderRadius.circular(20),

                  child: SizedBox(

                    height: 170,
                    width: double.infinity,

                    child: Image.network(

                      "https://images.unsplash.com/photo-1504674900247-0877df9cc836",

                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // RESTAURANT NAME

              const Padding(

                padding:
                EdgeInsets.symmetric(
                  horizontal: 18,
                ),

                child: Align(

                  alignment:
                  Alignment.centerLeft,

                  child: Text(

                    "Snack Street",

                    style: TextStyle(
                      fontSize: 26,
                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),

              const Padding(

                padding:
                EdgeInsets.symmetric(
                  horizontal: 18,
                ),

                child: Align(

                  alignment:
                  Alignment.centerLeft,

                  child: Text(

                    "⭐ 4.7   Pizza • Burger • Drinks • Desert",

                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // SEARCH BAR

              Padding(

                padding:
                const EdgeInsets.symmetric(
                  horizontal: 15,
                ),

                child: TextFormField(

                  controller:
                  searchController,

                  onChanged: (value) {

                    setState(() {

                      searchText = value;
                    });
                  },

                  decoration: InputDecoration(

                    hintText: "Search Food",

                    prefixIcon:
                    const Icon(Icons.search),

                    filled: true,

                    fillColor:
                    Colors.white,

                    contentPadding:
                    const EdgeInsets.symmetric(
                      vertical: 15,
                    ),

                    border: OutlineInputBorder(

                      borderRadius:
                      BorderRadius.circular(15),

                      borderSide:
                      BorderSide.none,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // TAB BAR

              const TabBar(

                isScrollable: true,

                labelColor: Colors.orange,

                unselectedLabelColor:
                Colors.black54,

                indicatorColor: Colors.orange,

                labelStyle: TextStyle(
                  fontWeight:
                  FontWeight.bold,
                  fontSize: 16,
                ),

                tabs: [

                  Tab(text: "All"),

                  Tab(text: "Pizza"),

                  Tab(text: "Burger"),

                  Tab(text: "Drinks"),

                  Tab(text: "Deserts"),
                ],
              ),

              // TAB VIEW

              Expanded(

                child: TabBarView(

                  children: [

                    buildList("All"),

                    buildList("Pizza"),

                    buildList("Burger"),

                    buildList("Drinks"),

                    buildList("Deserts"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}