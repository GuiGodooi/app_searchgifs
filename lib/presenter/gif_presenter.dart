import 'package:app_searchgifs/model/repository/gif_repository.dart';
import 'package:flutter/cupertino.dart';

import '../model/gif_model.dart';

class GifPresenter with ChangeNotifier {
  final GifReposotiry gifRepo;

  GifPresenter(this.gifRepo);

  late List<Gif> gifs = [];

  void getGif() async {
    gifs = await gifRepo.getGif();
    notifyListeners(); //Responsavel por notificar o Grind/ListView.builder;
  }
}
