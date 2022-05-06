import 'dart:convert';

GenreResponse genreResponseFromJson(String str) => GenreResponse.fromJson(json.decode(str));
class GenreResponse {
  GenreResponse({
    this.id,
    this.name
  });

  int id; 
  String name; 

  factory GenreResponse.fromJson(Map<String, dynamic> json) =>
    GenreResponse(
      id  : json["id"],
      name: json["name"]
    );

}