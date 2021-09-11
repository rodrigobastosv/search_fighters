class FightStatsModel {
  final dynamic qtd;
  final dynamic knockout;
  final dynamic submission;
  final dynamic decision;

  FightStatsModel({
    required this.qtd,
    required this.knockout,
    required this.submission,
    required this.decision,
  });

  static FightStatsModel fromJson(Map<String, dynamic> json) {
    return FightStatsModel(
      qtd: json['qtd'],
      knockout: json['knockout'],
      submission: json['submission'],
      decision: json['decision'],
    );
  }
}
