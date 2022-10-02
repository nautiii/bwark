import 'package:bwark/resources/manga_source.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart' show parse;
import 'package:http/http.dart' as http;

class MangaScanTradSource implements MangaSource {
  @override
  Future<int> getTotalChapters(String name) async {
    final url = Uri.parse('https://www.mangascantrad.fr/manga/$name');
    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        Document document = parse(response.body);
        Element el = document.getElementsByClassName('wp-manga-chapter').first;

        return int.parse(el.text.split(' ')[1]);
      }
      throw response.reasonPhrase ?? 'http error';
    } on Exception {
      return -1;
    }
  }
}
