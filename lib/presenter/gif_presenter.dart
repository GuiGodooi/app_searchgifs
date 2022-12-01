import 'package:app_searchgifs/model/repository/gif_repository.dart';
import 'package:flutter/cupertino.dart';
import '../model/gif_model.dart';

class GifPresenter with ChangeNotifier {
  final GifReposotiry gifRepo;

  GifPresenter(this.gifRepo);

  late List<Gif> gifs = [];
  bool loading = true;

  void getGif() async {
    gifs = await gifRepo.getGif();
    loading = false;
    notifyListeners(); //Responsavel por notificar o Grind/ListView.builder;
  }
}
