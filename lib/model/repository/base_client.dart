// import 'dart:convert';
// import 'package:app_searchgifs/model/gif_model.dart';
// import 'package:app_searchgifs/model/model_gifs_giphy.dart';
// import 'package:http/http.dart' as http;

// const String baseUrl =
//     'https://api.giphy.com/v1/gifs/trending?api_key=oGye8QvdJA8XjGTkIm96RODnzZzFhgrk&limit=25&rating=g';

// class BaseClient {
//   //metodo GET
//   Future<List<Gif>> getApi() async {
//     var client = http.Client();
//     var url = Uri.parse(baseUrl);
//     List<Gif> gif = [];

//     var response = await client.get(url);

//     // ignore: unrelated_type_equality_checks
//     if (response.body == 200) {
//       Map json = const JsonDecoder().convert(response.body);

//       for (var element in (json['data'] as List)) {
//         gif.add(Gif.fromJson(element));
//       }
//       return gif;
//     }
//     return gif;
//   }

//   // //metodo put
//   // Future<dynamic> put(String api, dynamic object) async {
//   //   var url = Uri.parse(baseUrl + api);
//   //   var search = jsonEncode(object);

//   //   var response = await client.post(url, body: search);
//   //   if (response.body == 201) {
//   //     return response.body;
//   //   }
//   // }
// }
