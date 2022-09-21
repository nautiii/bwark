import 'package:bwark/data/manga_model.dart';
import 'package:bwark/resources/api_myanimelist.dart';

class MyAnimeListRepository {
  final _provider = MyAnimeListAPI();

  Future<MangaModel> getMangaByName(String name) =>
      _provider.getMangaByName(name);

  Future<List<MangaModel>> getMangaByGenre(String category) =>
      _provider.getMangaByGenre(category);
}