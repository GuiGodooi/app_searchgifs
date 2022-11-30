import 'package:app_searchgifs/model/repository/base_client.dart';
import 'package:flutter/material.dart';

import '../model/gif_model.dart';

class GifPresent extends ChangeNotifier {
  final BaseClient baseClient;

  GifPresent(this.baseClient);

  late List<Gif> gif = [];
  bool loading = true;

  void getListAPI() async {
    loading = false;
    notifyListeners();
  }
}
