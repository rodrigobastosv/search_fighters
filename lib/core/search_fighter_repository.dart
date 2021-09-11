import 'package:search_fighters/model/fighter_model.dart';

abstract class SearchFighterRepository {
  Future<List<FighterModel>> getFighters(String term);
}