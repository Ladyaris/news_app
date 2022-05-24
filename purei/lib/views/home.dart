import 'package:flutter/material.dart';
import 'package:purei/models/about.api.dart';
import 'package:purei/models/about.dart';
import 'package:purei/views/widgets/about_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<About> _about;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getAbout();
  }

  Future<void> getAbout() async {
    _about = await AboutApi.getAbout();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.gamepad),
              SizedBox(width: 10),
              Text('The Games')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: _about.length,
          itemBuilder: (context, index) {
            return AboutCard(
                title: _about[index].name,
                genre: _about[index].genre,
                rating: _about[index].rating.toString(),
                thumbnailUrl: _about[index].images);
          },
        ));
  }
}