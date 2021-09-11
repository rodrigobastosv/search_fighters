import 'package:search_fighters/core/search_fighter_repository.dart';
import 'package:search_fighters/data/mock_data.dart';
import 'package:search_fighters/model/fighter_model.dart';

class MockSearchFighterRepository implements SearchFighterRepository {
  @override
  Future<List<FighterModel>> getFighters(String term) async {
    await Future.delayed(Duration(seconds: 1));

    return <FighterModel>[
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
      FighterModel.fromJson(jsonResponse),
    ];
  }
}
