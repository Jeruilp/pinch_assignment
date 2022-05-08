import 'package:pinch_assignment/src/domain/model/game.dart';
import 'package:pinch_assignment/src/data/datasource/local/games_database.dart';


class DaoLocal {

  Future<void> insertGamesDB( List<Game> games ) async {
    // Get database
    final database = await $FloorGamesDatabase.databaseBuilder('games_database.db').build();
    final _dao = database.gamesDbDAO;
    // Prepare data from models to database model 
    games.forEach((element) async {
      // Insert data in database
      await _dao.insertOneGame(element.toGameDb());
    });
  }

  Future<List<Game>> getAllGameDb() async {
    // Get database
    final database = await $FloorGamesDatabase.databaseBuilder('games_database.db').build();
    final _dao = database.gamesDbDAO;
    // Get games from database
    final result = await _dao.retrieveGames();
    return result.map((e) => e.toGame()).toList();
  }


  Future<bool> hasGameDb() async {
    return (await getAllGameDb()).isNotEmpty; 
  }
}