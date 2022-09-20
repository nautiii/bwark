import 'package:bwark/resources/repo_myanimelist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bwark/data/manga_model.dart';

part 'myanimelist_event.dart';
part 'myanimelist_state.dart';

class MyAnimeListBloc extends Bloc<MyAnimeListEvent, MyAnimeListState> {
  MyAnimeListBloc() : super(MyAnimeListInitial()) {
    final MyAnimeListRepository malRepo = MyAnimeListRepository();

    on<GetMyAnimeListSingleManga>((event, emit) async {
      try {
        emit(MyAnimeListLoading());
        final manga = await malRepo.getMangaByName(event.manga);
        emit(MyAnimeListMangaLoaded(manga));
      } on Exception catch (_, error) {
        emit(MyAnimeListError(error.toString()));
      }
    });

    on<GetMyAnimeListMultipleManga>((event, emit) async {
      try {
        emit(MyAnimeListLoading());
        final mangaList = await malRepo.getMangaByCategory(event.category);
        emit(MyAnimeListCategoryLoaded(mangaList));
      } on Exception catch (_, error) {
        emit(MyAnimeListError(error.toString()));
      }
    });
  }
}
