import 'package:floor/floor.dart';
import 'package:pinch_assignment/src/domain/model/game.dart';


// Model for a single game
@entity
class GameDb {
  @PrimaryKey(autoGenerate: true)
  int id; 
  String name;
  String coverId;
  String description;
  double rating;

  GameDb({
    this.id,
    this.name,
    this.coverId,
    this.description,
    this.rating,});

  Game toGame() {
  return Game(
    this.id,
    this.name, 
    this.coverId,
    this.description,
    this.rating,
    [''],
  );
  }
}


