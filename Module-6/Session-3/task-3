import 'dart:convert';

class Product {
  String name;
  double price;

  Product({
    required this.name,
    required this.price,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      price: (json['price'] as num).toDouble(),
    );
  }
}

List<Product> getProducts(String jsonString) {
  List<dynamic> jsonData = jsonDecode(jsonString);

  return jsonData
      .map((item) => Product.fromJson(item))
      .toList();
}

void main() {
  String jsonString = '''
  [
    {
      "name": "Samsung Galaxy S24",
      "price": 79999
    },
    {
      "name": "Boat Rockerz 450",
      "price": 1499
    },
    {
      "name": "HP Laptop",
      "price": 54999
    }
  ]
  ''';

  List<Product> products = getProducts(jsonString);

  for (var product in products) {
    print("Name: ${product.name}, Price: ₹${product.price}");
  }
}
