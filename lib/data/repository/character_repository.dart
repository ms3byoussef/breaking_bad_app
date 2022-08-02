import 'package:breaking_bad/data/model/character_model.dart';
import 'package:breaking_bad/data/web_services/character_web_services.dart';

class CharacterRepository {
  final CharaterWebServices? charaterWebServices;
  CharacterRepository(this.charaterWebServices);
  Future<List<Character>> getAllCharacters() async {
    final characters = await charaterWebServices!.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
