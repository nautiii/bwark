part of 'myanimelist_bloc.dart';

abstract class MyAnimeListState {
  const MyAnimeListState();
}

class MyAnimeListLoading extends MyAnimeListState {}

class MyAnimeListMangaLoaded extends MyAnimeListState {
  final MangaModel manga;
  const MyAnimeListMangaLoaded(this.manga);
}

class MyAnimeListGenreLoaded extends MyAnimeListState {
  final List<MangaModel> mangaList;
  const MyAnimeListGenreLoaded(this.mangaList);
}

class MyAnimeListError extends MyAnimeListState {
  final String? message;
  const MyAnimeListError(this.message);
}
