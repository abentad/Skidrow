import 'package:Skidrow/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      // statusBarColor: Color(0xff101116),
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skidrow',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        // scaffoldBackgroundColor: Color(0xff101116),
        // primaryColor: Color(0xff101116),
        primaryColor: Colors.white,
        // secondaryHeaderColor: Color(0xff6b6b6e),
        secondaryHeaderColor: Colors.black,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoadingScreen(),
    );
  }
}

//6b6b6e
