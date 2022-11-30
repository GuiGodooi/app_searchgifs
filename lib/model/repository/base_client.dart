import 'dart:convert';
import 'package:app_searchgifs/model/gif_model.dart';
import 'package:http/http.dart' as http;

const String baseUrl =
    'https://api.giphy.com/v1/gifs/trending?api_key=oGye8QvdJA8XjGTkIm96RODnzZzFhgrk&limit=25&rating=g';

var client = http.Client();

class BaseClient {
//metodo GET
  Future<dynamic> get(String api) async {
    var url = Uri.parse(baseUrl + api);

    var response = await client.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Falha ao carregar um post');
    }
  }
}

//   // //metodo put
//   // Future<dynamic> put(String api, dynamic object) async {
//   //   var url = Uri.parse(baseUrl + api);
//   //   var search = jsonEncode(object);

//   //   var response = await client.post(url, body: search);
//   //   if (response.body == 201) {
//   //     return response.body;
//   //   }
//   // }

