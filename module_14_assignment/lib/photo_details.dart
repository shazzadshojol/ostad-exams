import 'package:flutter/material.dart';

import 'images.dart';

class PhotoDetails extends StatelessWidget {
  final ImagesFromAPI imagesFromAPI;

  PhotoDetails({super.key, required this.imagesFromAPI});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imagesFromAPI.url ?? 'Image not found'),
            SizedBox(height: 10),
            Text('ID: ${imagesFromAPI.id ?? 'id not found'}'),
            SizedBox(height: 10),
            Text(imagesFromAPI.title ?? 'Title not found'),
          ],
        ),
      ),
    );
  }
}
