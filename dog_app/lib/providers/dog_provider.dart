import 'package:flutter/material.dart';
import '../models/dog_model.dart';
import '../services/dog_service.dart';

class DogProvider extends ChangeNotifier {
  List<Dog> _dogs = [];
  List<Dog> get dogs => _dogs;

  DogProvider() {
    getDogs();
  }

  void getDogs() async {
    try {
      _dogs = await DogService.getDogs();
      notifyListeners();
    } catch (e) {
      print('Error: $e');
    }
  }
}
