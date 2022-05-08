import 'package:get_it/get_it.dart';

import 'package:pinch_assignment/src/data/services/game_service.dart';
import 'package:pinch_assignment/src/data/datasource/local/dao_local.dart';
import 'package:pinch_assignment/src/data/datasource/remote/dio_remote.dart';



final GetIt locator = GetIt.I;

void setupLocator() {

  locator.registerFactory(() => GameService());
  locator.registerFactory(() => DioRemote());
  locator.registerFactory(() => DaoLocal());

}

