import 'package:bwark/bloc/myanimelist_bloc.dart';
import 'package:bwark/ui/shared/manga_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final MyAnimeListBloc _malBloc = MyAnimeListBloc();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _malBloc,
      child: BlocBuilder<MyAnimeListBloc, MyAnimeListState>(
          builder: (context, state) {
        if (state is MyAnimeListInitial) {
          _malBloc.add(const GetMyAnimeListMultipleManga(category: 'shonen'));
          return Container();
        } else {
          return SingleChildScrollView(
            child: Stack(
              children: [
                Image.asset(
                  "lib/assets/home.png",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  fit: BoxFit.fitHeight,
                  filterQuality: FilterQuality.medium,
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.35),
                  padding: const EdgeInsets.only(top: 50.0),
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.1],
                          colors: [Colors.transparent, Colors.black])),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(top: 50.0),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.favorite_border),
                                  )),
                              Text(
                                'Placeholder',
                                style: TextStyle(
                                    color: Colors.deepOrange.shade50,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w600),
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(top: 50.0),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.info_outline),
                                  )),
                            ],
                          )),
                      for (int a = 0; a < 4; a++) const MangaCategory(),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
