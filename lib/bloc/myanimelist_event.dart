part of 'myanimelist_bloc.dart';

abstract class MyAnimeListEvent {
  const MyAnimeListEvent();
}

class GetMALSingleManga extends MyAnimeListEvent {
  final String manga;
  const GetMALSingleManga({required this.manga});
}
class GetMALMultipleManga extends MyAnimeListEvent {
  final String genre;
  const GetMALMultipleManga({required this.genre});
}
