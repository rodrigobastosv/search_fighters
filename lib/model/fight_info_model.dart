class FightInfoModel {
  dynamic result;
  dynamic opponent;
  dynamic event;
  dynamic date;
  dynamic method;
  dynamic round;

  FightInfoModel({
    required this.result,
    required this.opponent,
    required this.event,
    required this.date,
    required this.method,
    required this.round,
  });

  static FightInfoModel fromJson(Map<String, dynamic> json) {
    return FightInfoModel(
      result: json['result'],
      opponent: json['opponent'],
      event: json['event'],
      date: json['date'],
      method: json['method'],
      round: json['round'],
    );
  }
}
