import 'package:pinch_assignment/src/data/models/models.dart';

abstract class AbstractGameService {

  Future<GameResponseList> getGames();
  
}