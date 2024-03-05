import 'package:flutter/material.dart';
import '../models/dog_model.dart';
import '../views/dog_details.dart';

class DogCard extends StatelessWidget {
  final Dog dog;

  const DogCard({required this.dog});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DogDetails(dog: dog),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(8),
        child: ListTile(
          title: Text(dog.name),
          subtitle: Text(dog.description),
        ),
      ),
    );
  }
}
