import 'package:Skidrow/widgets/mycard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 2),
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
            ),
            MyCard(
              imageString: 'assets/images/1.png',
              gameName: 'ASSASSINS CREED VALHALLA',
              crackedBy: 'cracked by Codex',
            ),
            MyCard(
              imageString: 'assets/images/2.jpg',
              gameName: 'DESPERADOS 3',
              crackedBy: 'cracked by Codex',
            ),
            MyCard(
              imageString: 'assets/images/3.jpg',
              gameName: 'THE LAST SHOW',
              crackedBy: 'cracked by Codex',
            ),
          ],
        ),
      ),
    );
  }
}
