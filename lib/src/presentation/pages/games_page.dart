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
  
  ScrollController _scrollController = new ScrollController();
  
  @override
  void initState() {
    
      _loadGames();
    // TODO Add games data to FLOOR (database)
    
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
          // TODO condición isLoading ? CircularProgress : ¿null?
          return state.existGames 
            ? RefreshIndicator(
              onRefresh: _loadGames,
              child: ListView.builder(
                physics    : BouncingScrollPhysics(),
                shrinkWrap : true,
                itemCount  : state.gamesList.games.length,
                itemBuilder: (_, i) {
                  return GameCard(game: state.gamesList.games[i]);
                },
              ),
            )
            // TODO create a widget 
            : const Center(child:Text('No loaded games'));
        },
      )
    );
  }

  // Function to load/refresh games data
  // TODO esto va al game Service, y el game service llama a remote o local y des
  // pues agrega al bloc la data
  Future<void> _loadGames() async {
    GameService _gameService = new GameService();
    final dynamic response = await _gameService.getGames();
    final gamesBloc = BlocProvider.of<GamesBloc>(context);
    //TODO
    print(response);
      if (response != null) {
        // Add games data to BLOC 
        gamesBloc.add( OnLoadGamesEvent(response) );
      } else {
        Toast.show("It's been a problem loading the data",
          duration: 3,
          gravity: Toast.center,
          backgroundColor: Colors.black87);
      }
      //TODO add data to FLOOR
  }
}