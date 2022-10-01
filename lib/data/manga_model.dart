class MangaModel {
  late final int id;
  late final String title;
  late final MangaAttributes? attributes;

  MangaModel.fromJson(dynamic json)
      : id = json['id'],
        title = json['title'],
        attributes = MangaAttributes.fromJson(json);
}

class MangaAttributes {
  late final String? image;
  late final String? synopsis;
  late final int? rank;
  late final int? popularity;
  late final String? nsfw;
  late final String? status;
  late final String? startDate;
  late final List<dynamic>? genres;
  late final int? numChapters;
  late final List<dynamic>? authors;
  late final List<dynamic>? recommendations;

  MangaAttributes.fromJson(Map json)
      : image = json['main_picture']['medium'],
        synopsis = json['synopsis'],
        rank = json['rank'],
        popularity = json['popularity'],
        nsfw = json['nsfw'],
        status = json['status'],
        startDate = json['start_date'],
        genres = json['genres'],
        numChapters = json['num_chapters'],
        authors = json['authors'],
        recommendations = json['recommendations'];
}
