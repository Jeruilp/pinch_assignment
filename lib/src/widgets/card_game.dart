import 'package:flutter/material.dart';

// Models Import
import 'package:pinch_assignment/src/models/models.dart';

class GameCard extends StatelessWidget {
  final GameResponse game; 

  const GameCard({
    Key key,
    this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameName  = game.name;
    // final gameImage = game.cover.url;
    // final gameDescrip = game.description;
    // print(game.description);
    // print(game.cover.url);

    final size = MediaQuery.of(context).size;

    return Container(
      color  : Colors.white, 
      // width  : size.width * 0.75,
      padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
      child  : ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          shape  : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0)
          ),
         elevation  : 5.0,
         primary    : Colors.white,
         onPrimary  : Colors.black,
         side       : BorderSide(color: Colors.grey.shade700, width: 0.5),
         shadowColor: Colors.grey.shade700,
        ),

        // TODO navigator.pushnamed(context, 'game_Detail', arguments: this.game)
        onPressed: () {},
        child: FittedBox(
          fit  : BoxFit.contain,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(gameName),
              // Text(gameImage),
              // Text(gameDescrip)
            ],
          )
        ),
      )
      // width: double.infinity, 
      // height: 500,
    );
  }
}