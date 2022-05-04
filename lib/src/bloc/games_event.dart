part of 'games_bloc.dart';

@immutable
abstract class GamesEvent {}

// class OnShowLoadingScrollEvent extends GamesEvent {
//   OnShowLoadingScrollEvent();
// }

// class OnHideLoadingScrollEvent extends GamesEvent {
//   OnHideLoadingScrollEvent();
// }

class OnLoadGamesEvent extends GamesEvent {
  final GameResponseList games;
  OnLoadGamesEvent(this.games);
}

// class OnScrollGamesEvent extends GamesEvent {
//   final GameResponseList games;

//   OnScrollGamesEvent(this.games);
// }