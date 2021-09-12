import 'fight_info_model.dart';
import 'fighter_stats_model.dart';

class FighterModel {
  final int id;
  final String name;
  final String? imageUrl;
  final String? birth;
  final String country;
  final String? city;
  final dynamic age;
  final dynamic height;
  final dynamic weight;
  final FightStatsModel? wins;
  final FightStatsModel? losses;
  final dynamic draws;
  final List<FightInfoModel> fights;

  FighterModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.birth,
    required this.country,
    required this.city,
    required this.age,
    required this.height,
    required this.weight,
    required this.wins,
    required this.losses,
    required this.draws,
    required this.fights,
  });

  static FighterModel fromJson(Map<String, dynamic> json) {
    return FighterModel(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      birth: json['dateBirth'],
      country: json['country'],
      city: json['city'],
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
      wins: json['win'] != null ? FightStatsModel.fromJson(json['win']) : null,
      losses:
          json['loss'] != null ? FightStatsModel.fromJson(json['loss']) : null,
      draws: json['draws'],
      fights: getFights(json),
    );
  }

  static List<FightInfoModel> getFights(Map<String, dynamic> json) {
    final fights = <FightInfoModel>[];
    if (json['fights'] != null) {
      json['fights'].forEach((v) {
        fights.add(FightInfoModel.fromJson(v));
      });
    }
    return fights;
  }
}
