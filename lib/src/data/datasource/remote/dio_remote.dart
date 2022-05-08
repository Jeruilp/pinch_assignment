import 'dart:io';
import 'package:dio/dio.dart';

// Ctes import
import 'package:pinch_assignment/src/presentation/utils/ctes.dart';
// Models import
import 'package:pinch_assignment/src/domain/model/game.dart';
import 'package:pinch_assignment/src/data/models/models.dart';


class DioRemote {
 

  DioRemote._privateConstructor();
  static final DioRemote _instance = 
    DioRemote._privateConstructor();
  
  factory DioRemote() {
    return _instance; 
  }

  final _dio = new Dio();
  

  @override
  Future<List<Game>> getGames( ) async {

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
        data: "fields checksum,cover.*,name,rating,screenshots.*,status,summary; where cover.image_id != null; limit 40; sort popularity desc;",
        options: Options(headers: headers));
        final data = GameResponseList.fromJson(resp.data);
      return data.list.map((e) => e.toGame()).toList();
    } catch (e) {
    }
  }
}