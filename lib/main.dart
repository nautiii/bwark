import 'package:bwark/bloc/manga_source_bloc.dart';
import 'package:bwark/bloc/myanimelist_bloc.dart';
import 'package:bwark/data/index_model.dart';
import 'package:bwark/firebase_options.dart';
import 'package:bwark/resources/mangascantrad_source.dart';
import 'package:bwark/theme.dart';

import 'package:bwark/ui/bottom_bar.dart';
import 'package:bwark/ui/pages/download_page.dart';
import 'package:bwark/ui/pages/home_page.dart';
import 'package:bwark/ui/pages/like_page.dart';
import 'package:bwark/ui/pages/recommendation_page.dart';
import 'package:bwark/ui/header_bar.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(App());
}

class App extends StatelessWidget {
  final MyAnimeListBloc _malBloc = MyAnimeListBloc();
  final MangaSourceBloc _msBloc = MangaSourceBloc();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    List<Widget> widgetOptions = <Widget>[
      const HomePage(),
      const RecommendationPage(),
      const LikePage(),
      const DownloadPage(),
    ];

    return MaterialApp(
      theme: bwarkTheme,
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider<IndexModel>(
        create: (_) => IndexModel(),
        child: Consumer<IndexModel>(
          builder: (_, model, child) => Scaffold(
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                MultiBlocProvider(
                  providers: [
                    BlocProvider<MyAnimeListBloc>(
                      create: (_) => _malBloc
                        ..add(const GetMALMultipleManga(genre: 'seinen')),
                    ),
                    BlocProvider<MangaSourceBloc>(
                      create: (_) => _msBloc..setSource(MangaScanTradSource()),
                    ),
                  ],
                  child: widgetOptions.elementAt(model.index),
                ),
                child!,
              ],
            ),
            bottomNavigationBar: BottomBar(model: model),
          ),
          child: const HeaderBar(),
        ),
      ),
    );
  }
}
