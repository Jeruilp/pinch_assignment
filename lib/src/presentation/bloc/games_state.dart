part of 'games_bloc.dart';


@immutable
abstract class GamesState {
  final bool existGames;
  final bool isLoading; 
  final List<Game> gamesList;

  const GamesState({
    this.existGames = false,
    this.isLoading  = false,
    this.gamesList,
  });
}

class GamesInitialState extends GamesState {
  const GamesInitialState(): super( existGames: false, isLoading: false, gamesList: null );
}

class GamesSetState extends GamesState {
  final List<Game> newGames;
  GamesSetState(this.newGames)
    : super( existGames: true, isLoading: false, gamesList: newGames );
}

class GamesLoadingState extends GamesState {
  GamesLoadingState()
    : super( isLoading: true);
}