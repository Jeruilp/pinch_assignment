import 'dart:convert';

// Models import
import 'package:pinch_assignment/src/data/models/models.dart';


// Model for a single game
GameResponse gameResponseFromJson(String str) =>
  GameResponse.fromJson(json.decode(str));

class GameResponse {
  GameResponse({
    this.id,
    this.name,
    this.cover,
    this.created,
    this.firstRelease,
    this.modes,
    this.genres,
    this.perspectives,
    this.screenshots,
    this.description,
    this.rating,
  });

  int id; 
  String name;
  CoverResponse cover;
  int created;
  int firstRelease;
  List<ModeResponse> modes;
  List<GenreResponse> genres;
  List<PlayerPerspecResponse> perspectives;
  List<ScreenshotResponse> screenshots;
  String description;
  double rating;


  factory GameResponse.fromJson(Map<String, dynamic> json) =>
    GameResponse(
      id          : json["id"],
      name        : json["name"],
      cover       : json["cover"] == null ? null : CoverResponse.fromJson(json["cover"]),
      created     : json["created_at"],
      firstRelease: json["first_release_date"],
      modes       : json["game_modes"] == null ? null : (json["game_modes"] as List).map((i) => new ModeResponse.fromJson(i)).toList(),
      genres      : json["genres"] == null ? null : (json["genres"] as List).map((i) => new GenreResponse.fromJson(i)).toList(),
      perspectives: json["player_perspectives"] == null ? null : (json["player_perspectives"] as List).map((i) => new PlayerPerspecResponse.fromJson(i)).toList(),
      screenshots : json["screenshots"] == null ? null : (json["screenshots"] as List).map((i) => new ScreenshotResponse.fromJson(i)).toList(),
      description : json["summary"],
      rating      : json["rating"],
    );
  
}



// Model for a list of games
GameResponseList gameResponseListFromJson(String str) =>
    GameResponseList.fromJson(json.decode(str));

class GameResponseList {
  GameResponseList({
    this.games, 
  });

  List<GameResponse> games;


 factory GameResponseList.fromJson(List json) =>
    GameResponseList(
      games: json.map((i) => new GameResponse.fromJson(i)).toList(),
    );

}




