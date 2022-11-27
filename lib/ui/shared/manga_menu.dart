import 'package:bwark/bloc/manga_source_bloc.dart';
import 'package:bwark/resources/mangascantrad_source.dart';
import 'package:bwark/data/manga_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MangaMenu extends StatelessWidget {
  final MangaModel manga;
  final MangaSourceBloc _msBloc = MangaSourceBloc();

  MangaMenu({Key? key, required this.manga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MangaSourceBloc>(
        create: (_) => _msBloc
          ..setSource(MangaScanTradSource())
          ..add(GetTotalChapters(name: manga.title)),
        child: BlocBuilder<MangaSourceBloc, MangaSourceState>(
          buildWhen: (previous, current) {
            // if (current is MangaSourceInitial) {
            //   BlocProvider.of<MangaSourceBloc>(context)
            //       .add(GetTotalChapters(name: manga.title));
            // }
            print(current);
            return true;
          },
          builder: (context, state) {
            if (state is MangaSourceTotalChaptersLoaded) {
              print(manga.title.toLowerCase().replaceAll('!', '').replaceAll(' ', '-'));
              return WebView(
                initialUrl: 'https://www.scan-vf.net/${manga.title.toLowerCase().replaceAll('!', '').replaceAll(' ', '-')}',
                navigationDelegate: (navigation) {
                  final host = Uri.parse(navigation.url).host;
                  print(navigation);
                  print(host);
                  if (host.contains('scan-vf.net')) {
                    return NavigationDecision.navigate;
                  }
                  return NavigationDecision.prevent;
                },
                javascriptMode: JavascriptMode.unrestricted,
              );
            } else if (state is MangaSourceError) {
              return const Material(
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Failed to load information',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );
            }
            return const Material(
              color: Colors.black,
              child: Center(
                child: Text(
                  'Loading...',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
          },
        ));
  }
}
