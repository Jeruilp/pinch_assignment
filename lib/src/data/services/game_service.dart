
import 'package:pinch_assignment/src/data/datasource/local/dao_local.dart';
import 'package:pinch_assignment/src/data/datasource/remote/dio_remote.dart';
import 'package:pinch_assignment/src/domain/model/game.dart';


class GameService {
 

  GameService._privateConstructor();
  static final GameService _instance = 
    GameService._privateConstructor();
  
  factory GameService() {
    return _instance; 
  }

  final _dioRemote = new DioRemote();
  final _daoLocal  = new DaoLocal();
  

  @override
  Future<List<Game>> getGames( ) async {

    final hasGameDb = await _daoLocal.hasGameDb();
    final resp = await _dioRemote.getGames();
    if (hasGameDb && resp == null) {
      return _daoLocal.getAllGameDb();
    } else if (!hasGameDb && resp != null){
      await _daoLocal.insertGamesDB(resp);
      return resp; 
    } else {
      return resp; 
    }

  }
}