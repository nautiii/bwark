import 'package:bwark/resources/repo_myanimelist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bwark/data/manga_model.dart';

part 'myanimelist_event.dart';
part 'myanimelist_state.dart';

class MyAnimeListBloc extends Bloc<MyAnimeListEvent, MyAnimeListState> {
  MyAnimeListBloc() : super(MyAnimeListLoading()) {
    final MyAnimeListRepository malRepo = MyAnimeListRepository();

    on<GetMALSingleManga>((event, emit) async {
      try {
        emit(MyAnimeListLoading());
        final manga = await malRepo.getMangaByName(event.manga);
        emit(MyAnimeListMangaLoaded(manga));
      } on Exception catch (_, error) {
        emit(MyAnimeListError(error.toString()));
      }
    });

    on<GetMALMultipleManga>((event, emit) async {
      try {
        emit(MyAnimeListLoading());
        final mangaList = await malRepo.getMangaByGenre(event.genre);
        emit(MyAnimeListGenreLoaded(mangaList));
      } on Exception catch (_, error) {
        emit(MyAnimeListError(error.toString()));
      }
    });
  }
}
