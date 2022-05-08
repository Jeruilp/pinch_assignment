part of 'games_bloc.dart';

@immutable
abstract class GamesEvent {}


class OnLoadGamesEvent extends GamesEvent {
  final List<Game> games;
  OnLoadGamesEvent(this.games);
}


class LoadingGamesEvent extends GamesEvent {

}