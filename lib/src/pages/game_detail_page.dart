import 'package:flutter/material.dart';
import 'package:pinch_assignment/src/models/game_response.dart';

class GameDetailPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final GameResponse game = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Detail'),
        centerTitle: true,
      ),
      body: Text(game.name)
      
    );
  }
}