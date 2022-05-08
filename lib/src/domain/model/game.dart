

import 'package:pinch_assignment/src/data/datasource/local/gamedb.dart';

class Game {
  final int id; 
  final String name; 
  final String coverId; 
  final String description; 
  final double rating; 
  final List<String> screenshots; 

  Game(this.id, this.name, this.coverId, this.description, this.rating, this.screenshots);


  GameDb toGameDb() {

    return GameDb(
      id: this.id,
      name: this.name, 
      coverId: this.coverId,
      description: this.description,
      rating: this.rating,
    );
  }

}