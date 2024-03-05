import 'package:flutter/material.dart';
import '../models/dog_model.dart';

class DogDetails extends StatelessWidget {
  final Dog dog;

  const DogDetails({required this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dog Details')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${dog.name}'),
            Text('Description: ${dog.description}'),
            // Agregar más detalles según sea necesario
          ],
        ),
      ),
    );
  }
}
