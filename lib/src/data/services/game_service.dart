
import 'package:pinch_assignment/src/di/locator.dart';
import 'package:pinch_assignment/src/domain/model/game.dart';
import 'package:pinch_assignment/src/data/datasource/local/dao_local.dart';
import 'package:pinch_assignment/src/data/datasource/remote/dio_remote.dart';


class GameService {

  final _dioRemote = locator<DioRemote>();
  final _daoLocal = locator<DaoLocal>();
  

  @override
  Future<List<Game>> getGames( ) async {

    // Check if there is data on database
    final hasGameDb = await _daoLocal.hasGameDb();
    // Get data from remote API
    final resp = await _dioRemote.getGames();
    // If DB has data and remote resp is null => return data from database
    if (hasGameDb && resp == null) {
      return _daoLocal.getAllGameDb();
    // If DB has not data and remote resp is not null => Save data on db and return remote data
    } else if (!hasGameDb && resp != null){
      await _daoLocal.insertGamesDB(resp);
      return resp; 
    } else {
      return resp; 
    }

  }
}