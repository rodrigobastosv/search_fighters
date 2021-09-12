import 'package:dio/dio.dart';
import 'package:search_fighters/core/search_fighter_repository.dart';
import 'package:search_fighters/model/fighter_model.dart';

class HttpSearchFighterRepository implements SearchFighterRepository {
  @override
  Future<List<FighterModel>> getFighters(String term) async {
    final response = await Dio().post(
      'http://ec2-54-185-199-58.us-west-2.compute.amazonaws.com:8080/fighters',
      data: {
        'nameOrNick': term,
      },
    );
    if (response.statusCode == 200) {
      final content = response.data['content'] as List;
      return List.generate(
          content.length, (i) => FighterModel.fromJson(content[i]));
    }
    return [];
  }
}
