import 'package:app_rick_and_morty/models/character.dart';
import 'package:app_rick_and_morty/screens/character_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_rick_and_morty/api/api_service.dart';

class CharacterListScreen extends StatefulWidget {
  
  @override
  _CharacterListScreenState createState() => _CharacterListScreenState();
}

class _CharacterListScreenState extends State<CharacterListScreen> {
  late Future<List<Character>> futureCharacters;

  @override
  void initState() {
      super.initState();
      futureCharacters = ApiService.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty Characters'),
      ),
      body: FutureBuilder<List<Character>>(
        future: futureCharacters,
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final Characters = snapshot.data!;
            return ListView.builder(
              itemCount: Characters.length,
              itemBuilder: (context, index) {
                final Character = Characters[index];
                return ListTile(
                  leading: Image.network(Character.image),
                  title: Text(Character.name),
                  subtitle: Text('${Character.species} - ${Character.status}'),
                  onTap: () {
                    Navigator.push(
                      context, 
                        MaterialPageRoute(
                          builder: (context) => CharacterDetailScreen(character: Character),
                        ),
                      );
                  },
                );
              }
            );
          }
        },
      ),
    );
  }
}