import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite; 
import 'package:path/path.dart'; 
import 'package:floor/floor.dart';

import 'package:pinch_assignment/src/data/datasource/local/gamedb.dart';
import 'package:pinch_assignment/src/data/datasource/local/games_dao.dart';

part 'games_database.g.dart';

@Database(version: 1, entities: [GameDb])
abstract class GamesDatabase extends FloorDatabase {
  GamesDbDAO get gamesDbDAO; 
}