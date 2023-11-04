import 'dart:convert';

import 'package:flutter_application_1/models.dart';
import 'package:http/http.dart' as http;

const String endpointRandomDrink =
    "http://www.thecocktaildb.com/api/json/v1/1/random.php";

String getEndpointForSpecificId(id) {
  return "www.thecocktaildb.com/api/json/v1/1/lookup.php?iid=$id";
}

Future<Drink> fetchRandomDrink() async {
  final response = await http.get(Uri.parse(endpointRandomDrink));

  if (response.statusCode == 200) {
    return Drink.fromJson(
        jsonDecode(response.body)["drinks"][0] as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load drink');
  }
}

// Future<http.Response> fetchCocktailById(id) {
//   return http.get(Uri.parse(getEndpointForSpecificId(id)));
// }
