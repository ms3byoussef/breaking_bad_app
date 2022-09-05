class Character {
  int? charId;
  String? name;
  String? nickName;
  String? img;
  List<dynamic>? jobs;
  String? statesIfDeadOrAlive;
  List<dynamic>? appearanceOfSeasons;
  String? actorName;
  String? categoryForTwoSeries;
  List<dynamic>? betterCallSoulAppearance;
  Character({
    this.charId,
    this.name,
    this.nickName,
    this.img,
    this.jobs,
    this.statesIfDeadOrAlive,
    this.appearanceOfSeasons,
    this.actorName,
    this.categoryForTwoSeries,
    this.betterCallSoulAppearance,
  });
  Character.fromJson(Map<dynamic, dynamic> map)
      : charId = map['char_id'],
        name = map['name'],
        nickName = map['nickname'],
        img = map['img'],
        jobs = map['occupation'],
        statesIfDeadOrAlive = map['status'],
        appearanceOfSeasons = map['appearance'],
        actorName = map['portrayed'],
        categoryForTwoSeries = map['category'],
        betterCallSoulAppearance = map['better_call_saul_appearance'];

  Map<dynamic, dynamic> toJson() => {
        'char_id': charId,
        'name': name,
        'nickname': nickName,
        'img': img,
        'occupation': jobs,
        'status': statesIfDeadOrAlive,
        'appearance': appearanceOfSeasons,
        'portrayed': actorName,
        'category': categoryForTwoSeries,
        'better_call_saul_appearance': betterCallSoulAppearance,
      };

  Character copyWith({
    int? charId,
    String? name,
    String? nickName,
    String? img,
    List<dynamic>? jobs,
    String? statesIfDeadOrAlive,
    List<dynamic>? appearanceOfSeasons,
    String? actorName,
    String? categoryForTwoSeries,
    List<dynamic>? betterCallSoulAppearance,
  }) {
    return Character(
      charId: charId,
      name: name,
      nickName: nickName,
      img: img,
      jobs: jobs,
      statesIfDeadOrAlive: statesIfDeadOrAlive,
      appearanceOfSeasons: appearanceOfSeasons,
      actorName: actorName,
      categoryForTwoSeries: categoryForTwoSeries,
    );
  }
}
