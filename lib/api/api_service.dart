import 'dart:convert';

import 'package:app_rick_and_morty/models/character.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    if(response.statusCode == 200) {
      final List<dynamic> results = jsonDecode(response.body)['results'];
      print('Results --> ${results}');
      return results.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }
}