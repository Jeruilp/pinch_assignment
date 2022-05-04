import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    new Future.delayed(Duration.zero, () async {
      final gamesBloc = BlocProvider.of<GamesBloc>(context);
      // Service to load the games data from API 
      final dynamic response = await gameService.getGames();
      // if called ok, call to bloc event
      if (response != null) {
        print(response);
        gamesBloc.add( OnLoadGamesEvent(response) );
      } else {
        print('Error al recibir datos ${response.status}');
      }
    });
 
    // Add games data to BLOC 

    // Add games data to FLOOR (database)
    super.initState();
    
  }


  @override
  Widget build(BuildContext context) {
    // GameResponse game = new GameResponse();
    // game.name = 'Pokemon';
    // game.cover.url = 'uri image';
    // game.description = 'asdfasdfasdf';

    return Scaffold(
      appBar: AppBar(
        title: Text('Games'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon( Icons.search_outlined ),
            onPressed: () {},
          )
        ],
      ),
      body: BlocBuilder<GamesBloc, GamesState>(
        builder: (context, state) {
          return state.existGames 
            ? Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  controller: _scrollController,
                  itemCount: state.gamesList.games.length,
                  itemBuilder: (_, i) {
                    return GameCard(game: state.gamesList.games[i]);
                  },
                )
              ])
            // TODO este widget crearlo a parte
            : const Center(child:Text('No hay juegos cargados'));
        },
      )
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Games Page'),
    //     elevation: 10,
    //   ),
    //   body: BlocBuilder<GamesBloc, GamesState>(
    //     builder: (_, state) {
    //       return SingleChildScrollView(
    //         child: Column(
    //           children: [

    //         ],),
    //       );
    //     }
    //   )
      
    // );
  }
}