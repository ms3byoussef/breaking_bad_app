import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breaking_bad/business_logic/cubit/quote/quote_cubit.dart';
import 'package:breaking_bad/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/character_model.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;
  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          character.nickName!,
          style: const TextStyle(
            color: MyColors.myWhite,
            fontSize: 22,
          ),
        ),
        background: Hero(
          tag: character.charId!,
          child: Image.network(
            character.img!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 35,
      color: MyColors.myYellow,
      endIndent: endIndent,
      thickness: 3,
    );
  }

  Widget checkIfQuotesAreLoaded(QuoteState state) {
    if (state is QuoteLoaded) {
      return displayRandomQuoteOrEmptySpace(state);
    } else {
      return showProgressIndicator();
    }
  }

  Widget displayRandomQuoteOrEmptySpace(state) {
    var quotes = (state).quotes;
    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            color: MyColors.myWhite,
            shadows: [
              Shadow(
                  color: MyColors.myYellow,
                  blurRadius: 7,
                  offset: Offset(0, 0)),
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            pause: const Duration(milliseconds: 500),
            animatedTexts: [
              FlickerAnimatedText(
                quotes[randomQuoteIndex].quote,
              ),
            ],
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }

  Widget showProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(color: MyColors.myYellow),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<QuoteCubit>(context).getQuotes(character.name!);

    return Scaffold(
      backgroundColor: MyColors.myGray,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.all(14),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('JOBs : ', character.jobs!.join(' / ')),
                      buildDivider(305),
                      characterInfo(
                          'Appeared in : ', character.categoryForTwoSeries!),
                      buildDivider(250),
                      characterInfo('Seasons : ',
                          character.appearnceOfSeasons!.join(' / ')),
                      buildDivider(280),
                      characterInfo(
                          ' DeadOrAlive : ', character.stutesIfDeadOrAlive!),
                      buildDivider(270),
                      character.betterCallSoulAppearnce!.isEmpty
                          ? const SizedBox()
                          : characterInfo('betterCallSoul Appearnce : ',
                              character.betterCallSoulAppearnce!.join(' / ')),
                      character.betterCallSoulAppearnce!.isEmpty
                          ? const SizedBox()
                          : buildDivider(150),
                      characterInfo(' Actor /Actress : ', character.actorName!),
                      buildDivider(270),
                      const SizedBox(
                        height: 30,
                      ),
                      BlocBuilder<QuoteCubit, QuoteState>(
                        builder: (context, state) {
                          return checkIfQuotesAreLoaded(state);
                        },
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
