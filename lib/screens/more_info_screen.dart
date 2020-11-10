import 'package:Skidrow/models/games.dart';
import 'package:flutter/material.dart';

class MoreInfo extends StatefulWidget {
  final Games game;
  MoreInfo({this.game});
  @override
  _MoreInfoState createState() => _MoreInfoState();
}

class _MoreInfoState extends State<MoreInfo> {
  Games game;
  @override
  void initState() {
    super.initState();
    game = widget.game;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300.0,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(game.imageString),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
