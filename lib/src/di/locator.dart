// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';

// import 'package:pinch_assignment/src/data/datasource/remote/dio_remote.dart';
// import 'package:pinch_assignment/src/data/datasource/remote/remote.dart';

// import 'package:pinch_assignment/src/data/services/game_service.dart';
// import 'package:pinch_assignment/src/domain/services/abstract_game_service.dart';

// final getIt = GetIt.I;


// Future<void> initializeDI() async{
//   await _data();
//   await _domain();
//   await _view();
// }

// void _data() async {

//   getIt.registerSingleton<Remote>(DioRemote(Dio()));
//   getIt.registerSingleton<AbstractGameService>(GameService(getIt.get()));
// }

// void _domain() async {}

// void _view() async {}