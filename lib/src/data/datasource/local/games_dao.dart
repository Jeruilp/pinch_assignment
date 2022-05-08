import 'package:floor/floor.dart';
import 'package:pinch_assignment/src/data/datasource/local/gamedb.dart';


@dao
abstract class GamesDbDAO {
  @insert
  Future<void> insertGames(List<GameDb> games);

  @insert 
  Future<void> insertOneGame(GameDb game);

  @Query ('SELECT * FROM GameDb')
  Future<List<GameDb>> retrieveGames();


}
