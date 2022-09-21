import 'package:bwark/data/manga_model.dart';
import 'package:bwark/ui/shared/manga_modal.dart';
import 'package:flutter/material.dart';

class MangaCategory extends StatelessWidget {
  final bool displayTitle;
  final List<MangaModel> list;

  const MangaCategory({Key? key, this.displayTitle = true, required this.list})
      : super(key: key);

  Widget manga(BuildContext context, String img) => InkWell(
        onTap: () => showMangaModal(context),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5.0),
          child: Image.network(img, fit: BoxFit.cover, width: 110.0),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (displayTitle == true)
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0, left: 20.0),
              child: Text(
                "Placeholder",
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
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: manga(context, list[index].img),
                    )),
          ),
        ],
      ),
    );
  }
}
