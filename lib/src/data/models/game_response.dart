import 'dart:convert';

// Models import
import 'package:pinch_assignment/src/data/models/models.dart';
import 'package:pinch_assignment/src/domain/model/game.dart';


// Model for a single game
GameResponse gameResponseFromJson(String str) =>
  GameResponse.fromJson(json.decode(str));

class GameResponse {
  GameResponse({
    this.id,
    this.name,
    this.cover,
    this.coverId,
    this.screenshots,
    this.description,
    this.rating,
  });

  int id; 
  String name;
  CoverResponse cover;
  String coverId; 
  List<ScreenshotResponse> screenshots;
  String description;
  double rating;


  factory GameResponse.fromJson(Map<String, dynamic> json) =>
    GameResponse(
      id          : json["id"],
      name        : json["name"],
      cover       : json["cover"] == null ? null : CoverResponse.fromJson(json["cover"]),
      coverId     : json["cover"] == null ? null : CoverResponse.fromJson(json["cover"]).imageId,
      screenshots : json["screenshots"] == null ? null : (json["screenshots"] as List).map((i) => new ScreenshotResponse.fromJson(i)).toList(),
      description : json["summary"],
      rating      : json["rating"],
    );



    Map<String, dynamic> toMap() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['id'] = this.id;
      data['name'] = this.name; 
      data['coverId'] = this.cover.imageId;
      data['description'] = this.description;
      data['rating'] = this.rating; 
      data['screenshots'] = (this.screenshots).map((e) => e.imageId);
      return data; 
    }
  
  // factory GameResponse.fromGame(Game game) {
  //   return GameResponse(
  //     id  : game.id,
  //     name: game.name,
  //     coverId: game.coverId,
  //     rating : game.rating,
  //     description: game.description,

  //   );
  // }

  Game toGame() {

    return Game(
      this.id,
      this.name, 
      this.cover.imageId,
      this.description,
      this.rating,
      (this.screenshots.map((e) => e.imageId)).toList(),
    );
  }
  
}



// Model for a list of games
GameResponseList gameResponseListFromJson(String str) =>
    GameResponseList.fromJson(json.decode(str));

class GameResponseList {
  GameResponseList({
    this.list, 
  });

  List<GameResponse> list;


 factory GameResponseList.fromJson(List json) =>
    GameResponseList(
      list: json.map((i) => new GameResponse.fromJson(i)).toList(),
    );


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String,dynamic>();
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toMap()).toList();
    }
    return data; 
  }
}




