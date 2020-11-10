import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;

_fetchData() async {
  String url = 'https://www.skidrow-games.com/';
  var response = await http.get(url);
  if (response.statusCode == 200) {
    dom.Document document = parser.parse(response.body);
    final postsNameClass = document.querySelectorAll(".post > h2 > a");
    // final postsImgClass =
    //     document.querySelectorAll(".post .post-excerpt > center > p > img");
    // final postsCrackedByClass =
    //     document.querySelectorAll(".post .post-excerpt > center > p > span");

    // final postsTrendingClass =
    //     document.querySelectorAll("#text-5 > div > p > a > img");
    //
    //
    //
    // for (var i = 0; i < 12; i++) {
    //   games.add(
    //     Games(
    //       imageString:
    //           postsImgClass[i].attributes['data-lazy-src'].toString(),
    //       gameName: postsNameClass[i].text.toString().trim(),
    //       crackedBy: postsCrackedByClass[i].text.toString().trim(),
    //     ),
    //   );
    // }
    // for (Games game in games) {
    //   print(game.imageString);
    //   print(game.gameName);
    //   print(game.crackedBy);
    // }
    // for (var i = 0; i < postsTrendingClass.length; i++) {
    //   print(postsTrendingClass[i].attributes['data-lazy-src']);
    // }
    print(postsNameClass.length);
  }
}

void main() {
  _fetchData();
}
