import 'package:breaking_bad/constant/colors.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
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
                        height: 300,
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
