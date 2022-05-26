import 'dart:convert';

import 'package:login_test/models/food.dart';
import 'package:http/http.dart' as http;

class FoodApi {
  static Future<List<Food>> getFood(String query) async {
    final url = Uri.parse(
        'https://anirudh-walia.github.io/jsonhostt/FOODcsvjson.json');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List foods = json.decode(response.body);

      return foods.map((json) => Food.fromJson(json)).where((food) {
        final nameLower = food.name.toLowerCase();
        final servingLower = food.serving.toLowerCase();
        final calories = food.calories.toString().toLowerCase();
        final searchLower = query.toLowerCase();

        return nameLower.contains(searchLower) ||
            servingLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }
}