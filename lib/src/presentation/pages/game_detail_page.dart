import 'package:flutter/material.dart';

import 'package:pinch_assignment/src/domain/model/game.dart';
import 'package:pinch_assignment/src/presentation/widgets/widgets.dart';

class GameDetailPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final Game game = ModalRoute.of(context).settings.arguments;
    
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

