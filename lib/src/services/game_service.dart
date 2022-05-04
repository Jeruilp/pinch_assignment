import 'dart:io';
import 'package:dio/dio.dart';

// Ctes import
import 'package:pinch_assignment/utils/ctes.dart';
// Models import
import 'package:pinch_assignment/src/models/models.dart';


class GameService {
  GameService._privateConstructor();
  static final GameService _instance = 
    GameService._privateConstructor();
  
  factory GameService() {
    return _instance; 
  }

  final _dio = new Dio();

  Future<GameResponseList> getGames( ) async {

    final url      = igdb_uri;
    final token    = bearer_token;
    final clientId = client_id;

    Map<String, dynamic> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      "Client-ID": clientId,
      "Authorization": token,
    };

    try {
      final resp = await this._dio.post(
        url, 
        data: "fields age_ratings,aggregated_rating,aggregated_rating_count,checksum,cover.*,created_at,first_release_date,game_modes.*,genres.*,name,platforms,player_perspectives.*,rating,release_dates,screenshots.*,status,storyline,summary,tags,themes; where cover.image_id != null & genres != null; limit 100;",
        options: Options(headers: headers));
        final data = GameResponseList.fromJson(resp.data);
      return data;
    } catch (e) {

    }
  }
}