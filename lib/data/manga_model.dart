class MangaModel {
  late final int id;
  late final String title;
  late final String img;

  MangaModel({required this.id, required this.title, required this.img});

  MangaModel.fromJson(dynamic json)
      : id = json['id'],
        title = json['title'],
        img = json['main_picture']['medium'];
}
