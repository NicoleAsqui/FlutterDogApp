import 'package:flutter/material.dart';
import '../models/dog_model.dart';

class DogDetails extends StatelessWidget {
  final Dog dog;

  const DogDetails({required this.dog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${dog.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${dog.description}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Hypoallergenic: ${dog.hypoallergenic}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Placeholder for camera functionality
                // Implement camera functionality in the future
              },
              child: Text('Take a Picture'),
            ),
          ],
        ),
      ),
    );
  }
}
