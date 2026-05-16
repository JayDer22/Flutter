import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(

    ChangeNotifierProvider(
      create: (context) => CartProvider(),

      child: const MyApp(),
    ),
  );
}


class CartProvider extends ChangeNotifier {

  List<int> prices = [];

  int get totalPrice {

    int total = 0;

    for (int price in prices) {
      total += price;
    }

    return total;
  }

  void addItem(int price) {
    prices.add(price);
    notifyListeners();
  }

  void removeItem(int price) {
    prices.remove(price);
    notifyListeners();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: const ShoppingCartPage(),
    );
  }
}

// Shopping Cart Page
class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() =>
      _ShoppingCartPageState();
}

class _ShoppingCartPageState
    extends State<ShoppingCartPage> {

  List<Map<String, dynamic>> products = [

    {
      "name": "Shoes",
      "price": 1000,
    },

    {
      "name": "Watch",
      "price": 2000,
    },

    {
      "name": "Bag",
      "price": 1500,
    },
  ];

  @override
  Widget build(BuildContext context) {

    final cartProvider =
    Provider.of<CartProvider>(context);

    return Scaffold(

      appBar: AppBar(
        title: const Text("Shopping Cart"),
      ),

      body: Column(
        children: [

          Expanded(
            child: ListView.builder(

              itemCount: products.length,

              itemBuilder: (context, index) {

                return Card(
                  margin:
                  const EdgeInsets.all(10),

                  child: ListTile(

                    title: Text(
                      products[index]["name"],
                    ),

                    subtitle: Text(
                      "₹${products[index]["price"]}",
                    ),

                    trailing: Row(
                      mainAxisSize:
                      MainAxisSize.min,

                      children: [

                        IconButton(

                          onPressed: () {

                            cartProvider.addItem(
                              products[index]["price"],
                            );
                          },

                          icon: const Icon(
                            Icons.add,
                          ),
                        ),

                        IconButton(

                          onPressed: () {

                            cartProvider.removeItem(
                              products[index]["price"],
                            );
                          },

                          icon: const Icon(
                            Icons.remove,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          Container(
            padding:
            const EdgeInsets.all(20),

            child: Text(
              "Total Price: ₹${cartProvider.totalPrice}",

              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}