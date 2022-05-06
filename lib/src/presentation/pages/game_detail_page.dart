import 'package:flutter/material.dart';

import 'package:pinch_assignment/src/data/models/game_response.dart';
import 'package:pinch_assignment/src/presentation/widgets/widgets.dart';

class GameDetailPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final GameResponse game = ModalRoute.of(context).settings.arguments;
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GameDetailBody(game: game),
            GameDetailScreenSlider(game: game)
          ],
        ),
      )
      
    );
  }
}

