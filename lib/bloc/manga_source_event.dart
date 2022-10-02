part of 'manga_source_bloc.dart';

abstract class MangaSourceEvent {
  const MangaSourceEvent();
}

class GetTotalChapters extends MangaSourceEvent {
  final String name;
  const GetTotalChapters({required this.name});
}
