import 'dart:convert';

void main() {
  String jsonString = '''
  {
    "id": 101,
    "name": "Spice Garden",
    "cuisine": "North Indian",
    "rating": 4.5,
    "isOpen": true
  }
  ''';

  Map<String, dynamic> restaurant = jsonDecode(jsonString);

  print("Restaurant Name: ${restaurant['name']}");
  print("Cuisine Type: ${restaurant['cuisine']}");
}
