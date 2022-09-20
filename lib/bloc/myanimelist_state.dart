part of 'myanimelist_bloc.dart';

abstract class MyAnimeListState {
  const MyAnimeListState();
}

class MyAnimeListInitial extends MyAnimeListState {}

class MyAnimeListLoading extends MyAnimeListState {}

class MyAnimeListMangaLoaded extends MyAnimeListState {
  final MangaModel manga;
  const MyAnimeListMangaLoaded(this.manga);
}

class MyAnimeListCategoryLoaded extends MyAnimeListState {
  final List<MangaModel> mangaList;
  const MyAnimeListCategoryLoaded(this.mangaList);
}

class MyAnimeListError extends MyAnimeListState {
  final String? message;
  const MyAnimeListError(this.message);
}
