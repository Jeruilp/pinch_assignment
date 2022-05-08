import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:pinch_assignment/src/domain/model/game.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  GamesBloc() : super( GamesInitialState() ) {

    on<OnLoadGamesEvent>( (event, emit) {
      emit( GamesSetState( event.games ));
    });

    on<LoadingGamesEvent>( (event, emit) {
      emit( GamesLoadingState());
    });
  }

}

