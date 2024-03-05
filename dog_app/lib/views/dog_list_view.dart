import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dog_provider.dart';
import '../widgets/dog_card.dart';

class DogListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dogProvider = Provider.of<DogProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Dog List View')),
      body: (dogProvider.dogs.isEmpty)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: dogProvider.dogs.length,
              itemBuilder: (context, index) {
                return DogCard(dog: dogProvider.dogs[index]);
              },
            ),
    );
  }
}
