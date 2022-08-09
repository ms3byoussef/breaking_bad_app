import 'package:bloc/bloc.dart';
import 'package:breaking_bad/data/repository/character_repository.dart';
import 'package:flutter/material.dart';

import '../../../data/model/character_model.dart';


part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterRepository characterRepository;
  List<Character> characters = [];
  CharacterCubit(this.characterRepository) : super(CharacterInitial());
  List<Character> getAllCharaters() {
    characterRepository.getAllCharacters().then((characters) {
      emit(CharacterLoaded(characters: characters));
      characters = characters;
    });
    return characters;
  }
}
