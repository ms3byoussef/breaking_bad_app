import 'package:breaking_bad/constant/colors.dart';
import 'package:flutter/material.dart';
import '../../constant/strings.dart';
import '../../data/model/character_model.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  const CharacterItem({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: MyColors.myWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(
          context,
          characterDetailsSCreen,
          arguments: character,
        ),
        child: GridTile(
          footer: Container(
            width: double.infinity,
            color: Colors.black38,
            alignment: Alignment.bottomCenter,
            child: Text(
              character.name!,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                height: 1.6,
                fontSize: 16,
                color: MyColors.myWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          child: Hero(
            tag: character.charId!,
            child: Container(
                color: MyColors.myGray,
                child: character.img!.isNotEmpty
                    ? FadeInImage.assetNetwork(
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholderCacheHeight: 10,
                        placeholderCacheWidth: 100,
                        placeholder: "assets/images/loading.gif",
                        image: character.img!)
                    : Image.asset('assets/images/placeholder.jpg')),
          ),
        ),
      ),
    );
  }
}
