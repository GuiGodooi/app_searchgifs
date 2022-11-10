import 'dart:convert';
import '../gif_model.dart';
import 'package:http/http.dart' as http;

class GifReposotiry {
  Future<List<Gif>> getGif() async {
    Uri url = Uri.parse(
      'https://api.giphy.com/v1/gifs/trending?api_key=oGye8QvdJA8XjGTkIm96RODnzZzFhgrk&limit=25&rating=g',
    );
    List<Gif> gifList = [];

    final resultado = await http.get(url);
    if (resultado.statusCode == 200) {
      Map json = const JsonDecoder().convert(resultado.body);

      for (var element in (json['data'] as List)) {
        gifList.add(Gif.fromJson(element));
      }
      return gifList;
    }
    return gifList;
  }
}
