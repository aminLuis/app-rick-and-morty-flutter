import 'package:app_rick_and_morty/models/character.dart';
import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(character.image, height: 200),
            ),
            SizedBox(height: 16),
            Text('Name: ${character.name}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 8),
            Text('Status: ${character.status}', style: TextStyle(fontSize: 16),),
            SizedBox(height: 8),
            Text('Species: ${character.species}', style: TextStyle(fontSize: 16),),
          ],
        ),
      ),
    );
  }
}