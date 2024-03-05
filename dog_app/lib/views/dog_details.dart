import 'dart:io';
import 'package:flutter/material.dart';
import '../models/dog_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class DogDetails extends StatefulWidget {
  final Dog dog;

  const DogDetails({required this.dog});

  @override
  _DogDetailsState createState() => _DogDetailsState();
}

class _DogDetailsState extends State<DogDetails> {
  File? _imageFile;

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile == null) return;

    String fileName = basename(pickedFile.path);

    Directory capturesDirectory = Directory.systemTemp;
    String destinationFile = '${capturesDirectory.path}/$fileName';

    File sourceFile = File(pickedFile.path);
    File destination = File(destinationFile);

    await sourceFile.copy(destination.path);

    setState(() {
      _imageFile = destination;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${widget.dog.name}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Description: ${widget.dog.description}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Hypoallergenic: ${widget.dog.hypoallergenic}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _openCamera,
                    child: Text('Take a Picture'),
                  ),
                  SizedBox(height: 16),
                  _imageFile != null
                      ? Image.file(_imageFile!)
                      : Placeholder(
                          fallbackHeight: 200,
                          fallbackWidth: double.infinity,
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
