import 'package:Skidrow/models/games.dart';
import 'package:Skidrow/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  List<Games> games = [];
  List<Games> trendingGames = [];
  //
  //
  _fetchData() async {
    String url = 'https://www.skidrow-games.com/';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      dom.Document document = parser.parse(response.body);
      final postsNameClass = document.querySelectorAll(".post > h2 > a");
      final postsImgClass =
          document.querySelectorAll(".post .post-excerpt > center > p > img");
      final postsCrackedByClass =
          document.querySelectorAll(".post .post-excerpt > center > p > span");
      final postsTrendingClass =
          document.querySelectorAll("#text-5 > div > p > a > img");
      //
      //for featured games section
      for (var i = 0; i < postsNameClass.length; i++) {
        games.add(
          Games(
            imageString:
                postsImgClass[i].attributes['data-lazy-src'].toString(),
            gameName: postsNameClass[i].text.toString().trim(),
            crackedBy: postsCrackedByClass[i].text.toString().trim(),
          ),
        );
      }
      //for the trending section
      for (var i = 0; i < postsTrendingClass.length; i++) {
        trendingGames.add(
          Games(
            imageString: postsTrendingClass[i]
                .attributes['data-lazy-src']
                .toString()
                .trim(),
          ),
        );
      }
      Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (context) => HomeScreen(
            games: games,
            trendingGames: trendingGames,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
