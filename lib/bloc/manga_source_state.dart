part of 'manga_source_bloc.dart';

abstract class MangaSourceState {
  const MangaSourceState();
}

class MangaSourceInitial extends MangaSourceState {}

class MangaSourceLoading extends MangaSourceState {}

class MangaSourceTotalChaptersLoaded extends MangaSourceState {
  final int total;
  const MangaSourceTotalChaptersLoaded(this.total);
}

class MangaSourceError extends MangaSourceState {
  final String? message;
  const MangaSourceError(this.message);
}
