import 'dart:io';
import 'package:dio/dio.dart';

import 'package:pinch_assignment/src/data/datasource/remote/remote.dart';
import 'package:pinch_assignment/src/domain/services/abstract_game_service.dart';
import 'package:pinch_assignment/src/data/models/models.dart';
import 'package:pinch_assignment/src/presentation/utils/ctes.dart';


class GameService extends AbstractGameService{
  // final Remote _remote; 

  // GameService(this._remote);

  // @override
  // Future<GameResponseList> getGames() async {
  //   final data = await _remote.getGames();
  //   // TODO añadir a local con floor
  //   return data; 
  // }
  GameService._privateConstructor();
  static final GameService _instance = 
    GameService._privateConstructor();
  
  factory GameService() {
    return _instance; 
  }

  final _dio = new Dio();

  @override
  Future<GameResponseList> getGames( ) async {

    final url      = igdb_uri;
    final token    = bearer_token;
    final clientId = client_id;

    Map<String, dynamic> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      "Client-ID"    : clientId,
      "Authorization": token,
    };

    try {
      final resp = await this._dio.post(
        url, 
        data: "fields age_ratings,aggregated_rating,aggregated_rating_count,checksum,cover.*,created_at,first_release_date,game_modes.*,genres.*,name,platforms,player_perspectives.*,rating,release_dates,screenshots.*,status,storyline,summary,tags,themes; where cover.image_id != null & genres != null; limit 40; sort popularity desc;",
        options: Options(headers: headers));
        final data = GameResponseList.fromJson(resp.data);
      return data;
    } catch (e) {
      // TODO 
    }
  }
}