class Manga {
  late final int id;
  late final String title;

  Manga.fromJson(dynamic json)
      : id = json['id'],
        title = json['title'];
}
