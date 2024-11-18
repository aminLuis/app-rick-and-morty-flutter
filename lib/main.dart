import 'package:app_rick_and_morty/screens/character_list_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty App',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: CharacterListScreen(),
    );
  }
}