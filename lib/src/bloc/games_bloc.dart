import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

// Models import
import 'package:pinch_assignment/src/models/models.dart';

part 'games_event.dart';
part 'games_state.dart';

class GamesBloc extends Bloc<GamesEvent, GamesState> {
  GamesBloc() : super( GamesInitialState() ) {

    on<OnLoadGamesEvent>( (event, emit) {
      print('OnLoadGamesEvent CALLED');
      emit( GamesSetState( event.games ));
    });
  }

}

