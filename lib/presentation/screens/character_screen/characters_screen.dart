import 'package:breaking_bad/constant/colors.dart';
import 'package:breaking_bad/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubit/character/character_cubit.dart';
import '../../../data/model/character_model.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({Key? key}) : super(key: key);

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  late List<Character> allCharacter;
  late List<Character> searchedForCharacter;
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  buildSearchFeild() {
    return TextField(
      controller: _searchController,
      cursorColor: MyColors.myGray,
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        border: InputBorder.none,
        hintText: 'Find A Character',
        hintStyle: TextStyle(color: MyColors.myGray, fontSize: 18),
      ),
      onChanged: (searchedCharacter) {
        addSearchedItem(searchedCharacter);
      },
    );
  }

  void addSearchedItem(String searchedCharacter) {
    searchedForCharacter = allCharacter
        .where((character) =>
            character.name!.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget>? _buildAppBarAction() {
    if (_isSearching) {
      return [
        IconButton(
            onPressed: () {
              setState(() {
                _searchController.clear();
                Navigator.pop(context);
              });
            },
            icon: const Icon(
              Icons.clear,
              color: MyColors.myGray,
            ))
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearch,
            icon: const Icon(
              Icons.search,
              color: MyColors.myGray,
            ))
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _closeSearch));
    setState(() {
      _isSearching = true;
    });
  }

  void _closeSearch() {
    setState(() {
      _searchController.clear();
      _isSearching = false;
    });
  }

  @override
  void initState() {
    BlocProvider.of<CharacterCubit>(context).getAllCharaters();
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
      itemCount: _searchController.text.isEmpty
          ? allCharacter.length
          : searchedForCharacter.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemBuilder: (context, index) => CharacterItem(
        character: _searchController.text.isEmpty
            ? allCharacter[index]
            : searchedForCharacter[index],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: _buildAppBarAction(),
        backgroundColor: MyColors.myYellow,
        leading: _isSearching
            ? const BackButton(
                color: Colors.black,
              )
            : const SizedBox(),
        title: _isSearching
            ? buildSearchFeild()
            : const Text(
                "Characters",
                style: TextStyle(fontSize: 22, color: MyColors.myGray),
              ),
      ),
      body: buildBlocWidget(),
    );
  }
}
