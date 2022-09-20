import 'package:bwark/data/manga_model.dart';
import 'package:bwark/resources/api_myanimelist.dart';

class MyAnimeListRepository {
  final _provider = MyAnimeListAPI();

  Future<MangaModel> getMangaByName(String name) =>
      _provider.getMangaByName(name);
  Future<List<MangaModel>> getMangaByCategory(String category) =>
      _provider.getMangaByCategory(category);
}
