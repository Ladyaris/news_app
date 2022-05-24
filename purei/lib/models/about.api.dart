import 'dart:convert';
import 'package:purei/models/about.dart';
import 'package:http/http.dart' as http;

class AboutApi {
  static Future<List<About>> getAbout() async {
    var uri = Uri.https('rawg-video-games-database.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-key": "97d6d0466bc546cab02de385918e5893",
      "x-rapidapi-host": "rawg-video-games-database.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];

    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return About.aboutFromSnapshot(_temp);
  }
}