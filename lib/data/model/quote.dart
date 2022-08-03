class Quote {
  String quote;
  Quote({required this.quote});
  Quote.fromJson(Map<dynamic, dynamic> map) : quote = map['quote'];
}
