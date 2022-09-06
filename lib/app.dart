
import 'package:ewmateam/views/home_screen.dart';
import 'package:flutter/material.dart';


class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: ThemeData(

        primaryColor: Colors.redAccent,

      ),
    );
  }
}