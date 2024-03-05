import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/dog_model.dart';

class DogService {
  static Future<List<Dog>> getDogs() async {
    final url = Uri.parse('https://dogapi.dog/api/v2/breeds');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final dogsData = jsonData['data'] as List<dynamic>;
      List<Dog> dogs = dogsData.map((data) => Dog.fromJson(data)).toList();
      return dogs;
    } else {
      throw Exception('Failed to load dogs');
    }
  }
}
