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
  Downsized? downsized;

  Images(this.original, this.downsized);
  Images.fromJson(Map<String, dynamic> json) {
    original = json['original'] != null
        ? Original.fromJson(
            json['original'],
          )
        : null;
    downsized = json['downsized'] != null
        ? new Downsized.fromJson(json['downsized'])
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

class Downsized {
  String? url;

  Downsized(this.url);

  Downsized.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['url'] = this.url;
    return data;
  }
}
