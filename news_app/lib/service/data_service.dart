import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/model/articles.dart';

String apiKey = '9d97a9bc85b54dc8804f9ef68e5d3c5c';
String baseUrl = 'https://newsapi.org/v2/top-headlines';

// https://newsapi.org/v2/top-headlines?country=us&apiKey=9d97a9bc85b54dc8804f9ef68e5d3c5c

class News{
  Future<List<Article>?> getNews() async {
    List<Article>? list;
    String url = '$baseUrl?country=id&apiKey=$apiKey';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    }else{
      throw Exception("Error can't access this web");

    }

  }
  Future<List<Article>?> getNewsByCategory(String category) async {
    List<Article>? list;
    String url = '$baseUrl?country=id&apiKey=$apiKey&category=$category';
    var response = await http.get(Uri.parse(url));
    if(response.statusCode== 200){
      var data = jsonDecode(response.body);
      var result = data['articles'] as List;
      list = result.map<Article>((json) => Article.fromJson(json)).toList();
      print(response.body);
      return list;
    }else{
      throw Exception("Error can't access this web");

    }

  }
}