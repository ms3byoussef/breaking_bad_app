import 'package:breaking_bad/business_logic/cubit/character_cubit.dart';
import 'package:breaking_bad/constant/colors.dart';
import 'package:breaking_bad/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/character_model.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacter;
  @override
  void initState() {
    allCharacter = BlocProvider.of<CharacterCubit>(context).getAllCharaters();
    super.initState();
  }

  buildBlocWidget() {
    return BlocBuilder<CharacterCubit, CharacterState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          allCharacter = state.characters;
          return buildLoadedListWidget();
        } else {
          return buildLoadingIndecator();
        }
      },
    );
  }

  buildLoadingIndecator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  buildLoadedListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGray,
        child: Column(
          children: [
            buildCharactersListWidget(),
          ],
        ),
      ),
    );
  }

  buildCharactersListWidget() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: allCharacter.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemBuilder: (context, index) => CharacterItem(
              character: allCharacter[index],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: const Text(
          "Characters",
          style: TextStyle(fontSize: 22, color: MyColors.myGray),
        ),
      ),
      body: buildBlocWidget(),
    );
  }
}
