import 'package:bwark/resources/manga_source.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'manga_source_event.dart';
part 'manga_source_state.dart';

class MangaSourceBloc<T extends MangaSource>
    extends Bloc<MangaSourceEvent, MangaSourceState> {
  T? source;

  void setSource(T src) {
    source = src;
  }

  MangaSourceBloc({this.source}) : super(MangaSourceInitial()) {
    on<GetTotalChapters>((event, emit) async {
      try {
        emit(MangaSourceLoading());
        final int total = await source?.getTotalChapters(event.name) ?? -2;
        emit(MangaSourceTotalChaptersLoaded(total));
      } catch (_, error) {
        emit(MangaSourceError(error.toString()));
      }
    });
  }
}
