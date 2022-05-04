part of 'games_bloc.dart';


@immutable
abstract class GamesState {
  final bool existGames;
  final GameResponseList gamesList;

  const GamesState({
    this.existGames = false,
    this.gamesList,
  });
}

class GamesInitialState extends GamesState {
  const GamesInitialState(): super( existGames: false, gamesList: null );
}

class GamesSetState extends GamesState {
  final GameResponseList newGames;
  GamesSetState(this.newGames)
    : super( existGames: true, gamesList: newGames );
}