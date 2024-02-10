import 'package:flutter/material.dart';

import 'images.dart';

class PhotoDetails extends StatelessWidget {
  final ImagesFromAPI imagesFromAPI;

  const PhotoDetails({super.key, required this.imagesFromAPI});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(imagesFromAPI.url ?? 'Image not found'),
              const SizedBox(height: 10),
              Text(imagesFromAPI.title ?? 'Title not found'),
              const SizedBox(height: 10),
              Text('ID: ${imagesFromAPI.id ?? 'id not found'}'),
            ],
          ),
        ),
      ),
    );
  }
}
