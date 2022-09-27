import 'package:bwark/bloc/myanimelist_bloc.dart';
import 'package:bwark/ui/shared/manga_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyAnimeListBloc, MyAnimeListState>(
        builder: (context, state) {
      if (state is MyAnimeListGenreLoaded) {
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            Image.asset(
              "lib/assets/home.png",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.fitHeight,
              filterQuality: FilterQuality.medium,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black, spreadRadius: 20, blurRadius: 18)
                ],
                color: Colors.black,
              ),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 16.0),
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
                              padding: const EdgeInsets.only(top: 16.0),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.info_outline),
                              )),
                        ],
                      )),
                  for (int a = 0; a < 4; a++)
                    MangaCategory(title: "Placeholder", list: state.mangaList),
                ],
              ),
            ),
          ],
        );
      } else if (state is MyAnimeListError) {
        return const Center(child: Text('Error API'));
      } else {
        return const Center(child: Text('Loading...'));
      }
    });
  }
}
