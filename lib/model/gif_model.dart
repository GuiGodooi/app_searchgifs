class Gif {
  String? id;
  String? url;
  String? bitlyGifUrl;
  String? title;
  Images? images;
  User? user;

  Gif(
    this.id,
    this.url,
    this.bitlyGifUrl,
    this.title,
    this.images,
    this.user,
  );

  Gif.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    bitlyGifUrl = json['bitlyGifUrl'];
    title = json['title'];
    images = json['images'] != null ? Images.fromJson(json['images']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
}

class Images {
  Original? original;
  Downsized? downsized;
  FixedHeight? fixedHeightStill;

  Images(
    this.original,
    this.downsized,
    this.fixedHeightStill,
  );

  Images.fromJson(Map<String, dynamic> json) {
    original = json['original'] != null
        ? Original.fromJson(
            json['original'],
          )
        : null;
    downsized = json['downsized'] != null
        ? new Downsized.fromJson(json['downsized'])
        : null;
    fixedHeightStill = json['fixed_height'] != null
        ? new FixedHeight.fromJson(json['fixed_height'])
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

class FixedHeight {
  String? url;

  FixedHeight(this.url);

  FixedHeight.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['url'] = this.url;
    return data;
  }
}

class User {
  String? display_name;

  User(this.display_name);
  User.fromJson(Map<String, dynamic> json) {
    display_name = json['display_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['display_name'] = this.display_name;
    return data;
  }
}
