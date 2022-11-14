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

  // Future<List<Gif>> searchGif() async {   API SEARCH
  //   Uri url = Uri.parse(
  //     'https://api.giphy.com/v1/gifs/search?api_key=jhqvxq3weCvnyk5JRBM3HOPLJrF2P6Yp&q=dogs&limit=25&offset=0&rating=g&lang=en',
  //   );
  //   List<Gif> searchList = [];

  //   final resultado = await http.get(url);
  //   if (resultado.statusCode == 200) {
  //     Map json = const JsonDecoder().convert(resultado.body);

  //     for (var element in (json['data'] as List)) {
  //       searchList.add(Gif.fromJson(element));
  //     }

  //     return searchList;
  //   }
  //   return searchList;
  // }
}
