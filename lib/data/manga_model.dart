class MangaModel {
  late final int id;
  late final String title;

  MangaModel({required this.id, required this.title});

  MangaModel.fromJson(dynamic json)
      : id = json['id'],
        title = json['title'];
}
