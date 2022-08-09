import 'package:bloc/bloc.dart';
import 'package:breaking_bad/data/repository/character_repository.dart';
import 'package:flutter/material.dart';

import '../../../data/model/quote.dart';

part 'quote_state.dart';

class QuoteCubit extends Cubit<QuoteState> {
  CharacterRepository characterRepository;
  List<Quote> quotes = [];
  QuoteCubit(this.characterRepository) : super(QuoteInitial());
  void getQuotes(String charName) {
    characterRepository.getCharacterQuotes(charName).then((quotes) {
      emit(QuoteLoaded(quotes: quotes));
    });
  }
}
