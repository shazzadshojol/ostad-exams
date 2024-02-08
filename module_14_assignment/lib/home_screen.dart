import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:module_14_assignment/images.dart';
import 'package:module_14_assignment/photo_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    getImagesFromApi();
  }

  List<ImagesFromAPI> imagesToShow = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Gallery App'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.network(imagesToShow[index].thumbnailUrl ?? 'Error'),
            title: Text(imagesToShow[index].title ?? 'Text not found'),
            onTap: () => onTapAction(imagesToShow[index]),
          ),
        ),
        itemCount: imagesToShow.length,
      ),
    );
  }

  Future<void> getImagesFromApi() async {
    Uri uri = Uri.parse('https://jsonplaceholder.typicode.com/photos');
    Response response = await get(uri);
    print(response);
    print(response.body);

    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      for (var item in decodedResponse) {
        ImagesFromAPI imagesApi = ImagesFromAPI(
          albumId: item['albumId'],
          id: item['id'],
          title: item['title'],
          url: item['url'],
          thumbnailUrl: item['thumbnailUrl'],
        );
        imagesToShow.add(imagesApi);
      }
      setState(() {});
    }
  }

  void onTapAction(ImagesFromAPI imagesFromAPI) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoDetails(imagesFromAPI: imagesFromAPI),
      ),
    );
    setState(() {});
  }
}
