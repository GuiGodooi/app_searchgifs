import 'dart:convert';
import 'package:flutter/material.dart';
import '../gif_model.dart';
import 'package:http/http.dart' as http;

class GifReposotiry extends ChangeNotifier {
  List<Gif> giphyList = [];

  List<Gif> get allGifs => giphyList;

  GifReposotiry() {
    _setupGif();
  }

  Future _setupGif() async {
    Uri url = Uri.parse(
      'https://api.giphy.com/v1/gifs/trending?api_key=oGye8QvdJA8XjGTkIm96RODnzZzFhgrk&limit=25&rating=g',
    );

    await http.get(url).then((value) {
      if (value.statusCode == 200) {
        Map json = const JsonDecoder().convert(value.body);

        for (var value in (json['data'] as List)) {
          giphyList.add(Gif.fromJson(value));
        }
      }
    });
  }
}
