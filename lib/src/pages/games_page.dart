import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

// BLOC import
import 'package:pinch_assignment/src/bloc/games_bloc.dart';

// Model import
import 'package:pinch_assignment/src/models/models.dart';

// Service import
import 'package:pinch_assignment/src/services/game_service.dart';

// Widgets import
import 'package:pinch_assignment/src/widgets/card_game.dart';


class GamesPage extends StatefulWidget {
  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
  GameService gameService = new GameService();
  ScrollController _scrollController = new ScrollController();
  
  @override
  void initState() {
    // new Future.delayed(Duration.zero, () async {

      _pullRefresh();
     
    // });

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
          return state.existGames 
            ? RefreshIndicator(
              onRefresh: _pullRefresh,
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
  Future<void> _pullRefresh() async {
    final dynamic response = await gameService.getGames();
    final gamesBloc = BlocProvider.of<GamesBloc>(context);
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