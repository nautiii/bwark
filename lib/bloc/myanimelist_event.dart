part of 'myanimelist_bloc.dart';

abstract class MyAnimeListEvent {
  const MyAnimeListEvent();
}

class GetMyAnimeListSingleManga extends MyAnimeListEvent {
  final String manga;
  const GetMyAnimeListSingleManga({required this.manga});
}
class GetMyAnimeListMultipleManga extends MyAnimeListEvent {
  final String category;
  const GetMyAnimeListMultipleManga({required this.category});
}
