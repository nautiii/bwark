import 'package:bwark/data/manga_model.dart';
import 'package:bwark/ui/shared/modal/manga_modal.dart';
import 'package:flutter/material.dart';

class MangaCard extends StatelessWidget {
  final MangaModel manga;

  const MangaCard({Key? key, required this.manga}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showMangaModal(context, manga),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image.network(manga.attributes!.image!,
            fit: BoxFit.cover, width: 110.0),
      ),
    );
  }
}
