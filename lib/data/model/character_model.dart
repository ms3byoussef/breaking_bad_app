class Character {
  int? charId;
  String? name;
  String? nickName;
  String? img;
  List<dynamic>? jobs;
  String? stutesIfDeadOrAlive;
  List<dynamic>? appearnceOfSeasons;
  String? actorName;
  String? categoryForTwoSeries;
  List<dynamic>? betterCallSoulAppearnce;
  Character({
    this.charId,
    this.name,
    this.nickName,
    this.img,
    this.jobs,
    this.stutesIfDeadOrAlive,
    this.appearnceOfSeasons,
    this.actorName,
    this.categoryForTwoSeries,
    this.betterCallSoulAppearnce,
  });
  Character.fromJson(Map<dynamic, dynamic> map)
      : charId = map['char_id'],
        name = map['name'],
        nickName = map['nickname'],
        img = map['img'],
        jobs = map['occupation'],
        stutesIfDeadOrAlive = map['status'],
        appearnceOfSeasons = map['appearance'],
        actorName = map['portrayed'],
        categoryForTwoSeries = map['category'],
        betterCallSoulAppearnce = map['better_call_saul_appearance'];

  Map<dynamic, dynamic> toJson() => {
        'char_id': charId,
        'name': name,
        'nickname': nickName,
        'img': img,
        'occupation': jobs,
        'status': stutesIfDeadOrAlive,
        'appearance': appearnceOfSeasons,
        'portrayed': actorName,
        'category': categoryForTwoSeries,
        'better_call_saul_appearance': betterCallSoulAppearnce,
      };

  Character copyWith({
    int? charId,
    String? name,
    String? nickName,
    String? img,
    List<dynamic>? jobs,
    String? stutesIfDeadOrAlive,
    List<dynamic>? appearnceOfSeasons,
    String? actorName,
    String? categoryForTwoSeries,
    List<dynamic>? betterCallSoulAppearnce,
  }) {
    return Character(
      charId: charId,
      name: name,
      nickName: nickName,
      img: img,
      jobs: jobs,
      stutesIfDeadOrAlive: stutesIfDeadOrAlive,
      appearnceOfSeasons: appearnceOfSeasons,
      actorName: actorName,
      categoryForTwoSeries: categoryForTwoSeries,
    );
  }
}
