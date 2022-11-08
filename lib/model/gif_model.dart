import 'package:app_searchgifs/model/model_gifs.dart';

class Gif {
  String? id;
  String? url;
  String? bitlyGifUrl;
  String? title;
  Images? images;

  Gif(
    this.id,
    this.url,
    this.bitlyGifUrl,
    this.title,
    this.images,
  );

  Gif.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    bitlyGifUrl = json['bitlyGifUrl'];
    title = json['title'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
  }
}

class Images {
  Original? original;

  Images(this.original);
  Images.fromJson(Map<String, dynamic> json) {
    original = json['original'] != null
        ? Original.fromJson(
            json['original'],
          )
        : null;
  }
}

class Original {
  String? url;

  Original(this.url);
  Original.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}
