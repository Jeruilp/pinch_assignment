import 'dart:convert';

PlayerPerspecResponse playerPerspecResponseFromJson(String str) => PlayerPerspecResponse.fromJson(json.decode(str));
class PlayerPerspecResponse {
  PlayerPerspecResponse({
    this.id,
    this.name
  });

  int id; 
  String name; 

  factory PlayerPerspecResponse.fromJson(Map<String, dynamic> json) =>
    PlayerPerspecResponse(
      id  : json["id"],
      name: json["name"]
    );

}