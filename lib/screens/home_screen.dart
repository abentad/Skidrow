import 'package:Skidrow/models/games.dart';
import 'package:Skidrow/screens/more_info_screen.dart';
import 'package:Skidrow/widgets/mycard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  final List<Games> games;
  final List<Games> trendingGames;
  HomeScreen({this.games, this.trendingGames});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Games> games = [];
  List<Games> trendingGames = [];
  @override
  void initState() {
    super.initState();
    print(widget.games.length);
    print(widget.trendingGames.length);
    games.addAll(widget.games);
    trendingGames.addAll(widget.trendingGames);
  }

  _buildUi() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 40.0),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: _buildFeatures(),
          ),
        ],
      ),
    );
  }

  _buildFeatures() {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
            child: Text(
              'TRENDING',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  // fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        }
        if (index == 1) {
          return Container(
            height: 300.0,
            width: double.infinity,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return MyCard(
                  imageString: trendingGames[index].imageString,
                  gameName: '',
                  crackedBy: '',
                  height: 200,
                  width: 340,
                );
              },
              itemCount: trendingGames.length,
            ),
          );
        }
        //
        //
        if (index == 2) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'FEATURED & RECOMMENDED',
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  // fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        }
        //
        //
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => MoreInfo(
                  game: games[index - 3],
                ),
              ),
            );
          },
          child: MyCard(
            gameName: games[index - 3].gameName,
            crackedBy: games[index - 3].crackedBy,
            imageString: games[index - 3].imageString,
            height: 200,
            width: double.infinity,
          ),
        );
      },
      itemCount: games.length + 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Theme.of(context).secondaryHeaderColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: _buildUi(),
    );
  }
}
