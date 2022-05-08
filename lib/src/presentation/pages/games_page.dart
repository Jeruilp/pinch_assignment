import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

// BLOC import
import 'package:pinch_assignment/src/presentation/bloc/games_bloc.dart';
// Service import
import 'package:pinch_assignment/src/data/services/game_service.dart';
// Widgets import
import 'package:pinch_assignment/src/presentation/widgets/card_game.dart';


class GamesPage extends StatefulWidget {
  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
    
  @override
  void initState() {
    
    _loadGames();
    
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games'),
        centerTitle: true,
        actions: [
        ],
      ),
      body: BlocBuilder<GamesBloc, GamesState>(
        builder: (context, state) {
          return state.existGames && !state.isLoading
            ? RefreshIndicator(
              onRefresh: _loadGames,
              child: ListView.builder(
                physics    : BouncingScrollPhysics(),
                shrinkWrap : true,
                itemCount  : state.gamesList.length,
                itemBuilder: (_, i) {
                  return GameCard(game: state.gamesList[i]);
                },
              ),
            )
            : Center(child: CircularProgressIndicator());
        },
      )
    );
  }

  // Function to load/refresh games data
  // Llamada a servicio el game service llama a remote o local y des
  // ADDS to BLOC
  Future<void> _loadGames() async {
    GameService _gameService = new GameService();
    final gamesBloc = BlocProvider.of<GamesBloc>(context);

    gamesBloc.add( LoadingGamesEvent());

    // Get games service 
    final dynamic response = await _gameService.getGames();

      if (response != null) {
        // Add games data to BLOC 
        gamesBloc.add( OnLoadGamesEvent(response) );
      } else {
      //   Toast.show("It's been a problem loading the data",
      //     duration: 3,
      //     gravity: Toast.center,
      //     backgroundColor: Colors.black87);
      }
  }
}