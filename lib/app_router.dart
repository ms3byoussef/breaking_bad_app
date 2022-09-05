// ignore_for_file: body_might_complete_normally_nullable

import 'package:breaking_bad/constant/strings.dart';
import 'package:breaking_bad/data/repository/character_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/character/character_cubit.dart';
import 'business_logic/cubit/quote/quote_cubit.dart';
import 'data/model/character_model.dart';
import 'data/web_services/character_web_services.dart';
import 'presentation/screens/character_details_screen/character_details_screen.dart';
import 'presentation/screens/character_screen/characters_screen.dart';

class AppRouter {
  late CharacterRepository characterRepository;
  late CharacterCubit characterCubit;
  AppRouter() {
    characterRepository = CharacterRepository(CharacterWebServices());
    characterCubit = CharacterCubit(characterRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CharacterCubit(characterRepository),
            child: const CharactersScreen(),
          ),
        );
      case characterDetailsSCreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => QuoteCubit(characterRepository),
            child: CharacterDetailsScreen(character: character),
          ),
        );
    }
  }
}
