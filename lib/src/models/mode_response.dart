import 'dart:convert';

ModeResponse modeResponseFromJson(String str) => ModeResponse.fromJson(json.decode(str));
class ModeResponse {
  ModeResponse({
    this.id,
    this.name
  });

  int id; 
  String name; 

  factory ModeResponse.fromJson(Map<String, dynamic> json) =>
    ModeResponse(
      id  : json["id"],
      name: json["name"]
    );

}