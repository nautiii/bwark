import 'package:bwark/data/manga_model.dart';
import 'package:bwark/ui/shared/manga_modal.dart';
import 'package:flutter/material.dart';

class MangaCategory extends StatelessWidget {
  final String title;
  final bool displayTitle;
  final List<MangaModel> list;

  const MangaCategory(
      {Key? key,
      required this.title,
      this.displayTitle = true,
      required this.list})
      : super(key: key);

  Widget mangaCard(BuildContext context, MangaModel manga) => InkWell(
        onTap: () => showMangaModal(context, manga),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Image.network(manga.attributes!.image!, fit: BoxFit.cover, width: 110.0),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (displayTitle == true)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.deepOrange.shade50,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          SizedBox(
            height: 150.0,
            child: ListView.builder(
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemBuilder: (BuildContext context, int index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: mangaCard(context, list[index]),
                    )),
          ),
        ],
      ),
    );
  }
}
