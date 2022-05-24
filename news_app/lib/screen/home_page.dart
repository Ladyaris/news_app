import 'package:flutter/material.dart';
import 'package:news_app/model/articles.dart';
import 'package:news_app/service/data_service.dart';
import 'package:news_app/utils/utils.dart';

import 'news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    News news = News();
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: const DecorationImage(
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1615000363959-e52262d2c75b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGJsYWNrJTIwY2F0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60'
                ))
          ),
          width: 10,
          margin: EdgeInsets.all(5),
        ),
        title: Text('Good Morning', style: titleArticle.copyWith(
          fontSize: 20
        ),),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.bookmark, color: Colors.blue,)
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: news.getNews(),
          builder: (context, snapshot) => snapshot.data != null
      ? NewsPage(snapshot.data as List<Article>)
              : const Center(child: CircularProgressIndicator())
      )
      );
  }
}
