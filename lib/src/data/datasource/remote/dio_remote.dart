import 'dart:io';
import 'package:dio/dio.dart';

import 'package:pinch_assignment/src/data/datasource/remote/remote.dart';
// Ctes import
import 'package:pinch_assignment/src/presentation/utils/ctes.dart';
// Models import
import 'package:pinch_assignment/src/data/models/models.dart';


class DioRemote extends Remote {
  // GameService._privateConstructor();
  // static final GameService _instance = 
  //   GameService._privateConstructor();
  
  // factory GameService() {
  //   return _instance; 
  // }

  final Dio _dio; 
  DioRemote(this._dio);
  
  final url      = igdb_uri;
  final token    = bearer_token;
  final clientId = client_id;
  
  @override
  Future<GameResponseList> getGames( ) async {

    Map<String, dynamic> headers = {
      HttpHeaders.contentTypeHeader: "application/json",
      "Client-ID"    : clientId,
      "Authorization": token,
    };
    try {
      final resp = await this._dio.post(
        url, 
        data: "fields age_ratings,aggregated_rating,aggregated_rating_count,checksum,cover.*,created_at,first_release_date,game_modes.*,genres.*,name,platforms,player_perspectives.*,rating,release_dates,screenshots.*,status,storyline,summary,tags,themes; where cover.image_id != null & genres != null; limit 40;",
        options: Options(headers: headers));
        final data = GameResponseList.fromJson(resp.data);
      return data;
    } catch (e) {
      // TODO 
    }
  }
}