part of 'games_bloc.dart';


@immutable
abstract class GamesState {
  final bool existGames;
  final bool isLoading; 
  final GameResponseList gamesList;

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
  final GameResponseList newGames;
  GamesSetState(this.newGames)
    : super( existGames: true, isLoading: false, gamesList: newGames );
}

class GamesLoadingState extends GamesState {
  final newIsLoading;
  GamesLoadingState(this.newIsLoading)
    : super( isLoading: true);
}