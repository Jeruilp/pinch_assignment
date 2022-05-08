
import 'package:pinch_assignment/src/data/datasource/local/games_database.dart';
import 'package:pinch_assignment/src/data/models/models.dart';
// Models import
import 'package:pinch_assignment/src/domain/model/game.dart';


class DaoLocal {
 

  DaoLocal._privateConstructor();
  static final DaoLocal _instance = 
    DaoLocal._privateConstructor();
  
  factory DaoLocal() {
    return _instance; 
  }


  

  @override
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

    final result = await _dao.retrieveGames();
    return result.map((e) => e.toGame()).toList();
  }


  Future<bool> hasGameDb() async {
    return (await getAllGameDb()).isNotEmpty; 
  }
}