import 'package:bwark/bloc/manga_source_bloc.dart';
import 'package:bwark/data/manga_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MangaMenu extends StatelessWidget {
  final MangaModel manga;

  const MangaMenu({Key? key, required this.manga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MangaSourceBloc, MangaSourceState>(
      buildWhen: (previous, current) {
        if (current is MangaSourceInitial) {
          BlocProvider.of<MangaSourceBloc>(context)
              .add(GetTotalChapters(name: manga.title));
        }
        return true;
      },
      builder: (context, state) {
        return const Material(
            color: Colors.black,
            child: Center(
              child: Text(
                'Manga Menu',
                style: TextStyle(color: Colors.white),
              ),
            ));
      },
    );
  }
}
