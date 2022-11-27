import 'package:bwark/data/manga_model.dart';
import 'package:http/http.dart' as http;

import 'dart:async';
import 'dart:convert';

class MyAnimeListAPI {
  final _host = 'api.myanimelist.net';
  final _version = 'v2';
  final _accessToken =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjNhOTc2N2E3NWJjMWZjMDhjYzhjNzQwNDgxYjEwZTdmMDhjOTFmNDA3ODkzOWIwYjY4ZWQzOTJhODA2MjUwZDhjOWZlODUxZDE4MGM3ZGQzIn0.eyJhdWQiOiIwM2JmMjFlZGM4MzYzYzEyYjU2ODU5MDUyOGRjNGMxZSIsImp0aSI6IjNhOTc2N2E3NWJjMWZjMDhjYzhjNzQwNDgxYjEwZTdmMDhjOTFmNDA3ODkzOWIwYjY4ZWQzOTJhODA2MjUwZDhjOWZlODUxZDE4MGM3ZGQzIiwiaWF0IjoxNjY3MTYyNzA1LCJuYmYiOjE2NjcxNjI3MDUsImV4cCI6MTY2OTg0NDcwNSwic3ViIjoiMTUxNzA0MDciLCJzY29wZXMiOltdfQ.B55TiDHcwWzw7b6FqiVGOx7Nww-RoDyqgs-5kf4La5uI_SvB_BYnjbgnPoItCkYM-hyCOCU7nA3YwMkTrBxeqpUAxgi-xAHbf_BqIJYPdCk5LBNgYWu0gIaGJXVjohHn9Z5YkCjKHUcuUlt6Hv5hw6gf0fLK8_cgPEItNEZWZ1UeqQtORJRBG4tBJ7JkJSe90gNWvZoEVIS9sQL46eVwiV2OYreyl1TzhdliH_CFtAIWwJE35VpTI2YwZumUmYc2HiAZjkCd7HDu61kBPULHYEVGqFkrkO8wGSK8Lnk7CO8aNgzjIcnp49lEtvZBh7Y1JiAJ5rOjC8rgnZO0BOuGCA';

  Map<String, String> get _headers => {
        'content-type': 'application/vnd.api+json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $_accessToken',
      };

  Future<Map> _request(String path, Map<String, Object> params) async {
    final uri = Uri.https(_host, '$_version/$path', params);
    final results = await http.get(uri, headers: _headers);

    return json.decode(results.body);
  }

  Future<MangaModel> getMangaByName(String name) async {
    final result = await _request('manga', <String, String>{
      'q': name,
      'limit': '1',
      'fields':
          'id,title,main_picture,synopsis,start_date,rank,popularity,nsfw,status,genres,num_chapters,authors,recommendations'
    });

    return MangaModel.fromJson(result['data'][0]['node']);
  }

  Future<List<MangaModel>> getMangaByGenre(String genre) async {
    final result = await _request('manga/ranking', <String, String>{
      'ranking_type': 'manga',
      'limit': '100',
      'fields':
          'id,title,main_picture,synopsis,start_date,rank,popularity,nsfw,status,genres,num_chapters,authors,recommendations'
    });

    if (result.isNotEmpty && result['error'] == 'invalid_token') {
      getToken().then((value) => print(value));
    }

    return (result['data'] as List<dynamic>)
        .map<MangaModel>((data) => MangaModel.fromJson(data['node']))
        .toList();
  }
}

extension MyAnimeListAuth on MyAnimeListAPI {
  static const code =
      'def502006ffdf5c791a5b74f077e0be77bb54f11079e0f520e9db2f8d71524ac540385e45047ca1b7056b08126646062393e388154cf64328f6c7742202f9095632d97b70288bc5f92411fe9043c3027ea93c5f3c42928b843d49c41159d268e6c9cf625058987f4f40c92c49d16c84fa08ae5a69adfce24ce4b499c597e01bc8899b654df21f0a7116e660294bb0d1c5d1d9ce7d68d09d86b98be1338c2409001c3e9cb68bd62f0424e607fd370aab02ab0525834b6be383bece0bfc7ba96f64194501bc71bc6d8467b7fef3c788923087df2118708863b1e28f16b00f75d7a2aa1497614ed9ca641275f30c3045d569bda99679a1effa6c608599d1a2e53cc932dc76a4b36890c0252f1bac4a708ff8b075fa35c2dffb3364cc7512466194761f4f4662fca91505a9f323a9271e0ba7bd86a4e0088a2ebf312b47f8ad5108c2ea282eeab93b68fca01d9b4a13d58cf46ae410dbbaa9649a351bce1eb5783ec5dbb165605c7d1c1d01a4776f5ac93ea954bd1440d4055e3d732644db6c85f689a15a0933a66eb33d033c61e01893948a2a0df0aa3';
  static const refresh =
      'def502003a9031ac337a24e2bb96e56b471bc28328b584ada4cc8b413133005e3b4d40084b789aed9fde7c24af6b4e627eefcea6a5436ff32f35e4f7b4d418d895ff71b63fb6bc639d8e103f4f6dbb05fd90ad982';

  Future authorize() async {
    final uri = Uri.https('myanimelist.net', 'v1/oauth2/authorize', {
      'response_type': 'code',
      'client_id': '03bf21edc8363c12b568590528dc4c1e',
      'state': 'ok',
      'code_challenge': 'C5kAY9f5fdzoVu_iwLCN0JZpO0LfC76PVE-qWClk8-A',
    });
    await http.get(uri);
  }

  Future<dynamic> getToken() async {
    final response = await http.post(
      Uri.https('myanimelist.net', 'v1/oauth2/token'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'client_id': '03bf21edc8363c12b568590528dc4c1e',
        'grant_type': 'authorization_code',
        'code': MyAnimeListAuth.code,
        'code_verifier': 'C5kAY9f5fdzoVu_iwLCN0JZpO0LfC76PVE-qWClk8-A',
      },
    );

    return jsonDecode(response.body);
  }

  Future<dynamic> refreshToken() async {
    final results = await http.post(
      Uri.https('myanimelist.net', 'v1/oauth2/token'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: {
        'client_id': '03bf21edc8363c12b568590528dc4c1e',
        'grant_type': 'refresh_token',
        'refresh_token': MyAnimeListAuth.refresh,
      },
    );

    return jsonDecode(results.body);
  }
}

// id,
// title,
// main_picture,
// alternative_titles,
// start_date,
// end_date,
// synopsis,
// mean,
// rank,
// popularity,
// num_list_users,
// num_scoring_users,
// nsfw,
// created_at,
// updated_at,
// media_type,
// status,
// genres,
// my_list_status,
// num_volumes,
// num_chapters,
// authors{first_name,last_name},
// pictures,
// background,
// related_anime,
// related_manga,
// recommendations,
// serialization{name}
