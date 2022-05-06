part of 'games_bloc.dart';

@immutable
abstract class GamesEvent {}


class OnLoadGamesEvent extends GamesEvent {
  final GameResponseList games;
  OnLoadGamesEvent(this.games);
}


class LoadingGamesEvent extends GamesEvent {
  final bool isLoading; 
  LoadingGamesEvent(this.isLoading);
}