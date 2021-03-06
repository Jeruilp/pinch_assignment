import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

// Models Import
import 'package:pinch_assignment/src/domain/model/game.dart';

class GameCard extends StatelessWidget {
  final Game game; 

  const GameCard({
    Key key,
    this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'game_detail', arguments: this.game);
      },
      
      child: Container(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        height : 200.0,
        child: Row(
          children: [
            _Cover(game: game),
            SizedBox( width: 15.0 ),
            _Body(game: game),
          ],
        ),
      )
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key key,
    @required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment : MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                game.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color     : Colors.black,
                  fontSize  : 18.0
                )),
                SizedBox( height: 15.0 ),
                Text(
                  game.description,
                  overflow : TextOverflow.ellipsis,
                  maxLines : 4,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color   : Colors.black87,
                    fontSize: 14.0
                  )),
                SizedBox( height: 25.0 ),
                _RatingWidget(game: game)
            ],
          ),
        ],
      ),
    );
  }
}

class _Cover extends StatelessWidget {
  const _Cover({
    Key key,
    @required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag  : game.id,
      child: AspectRatio(
        aspectRatio: 3/4,
        child: Container(
          decoration  : BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            image       : DecorationImage(
              image: NetworkImage("https://images.igdb.com/igdb/image/upload/t_cover_big/${game.coverId}.jpg"),
              fit  : BoxFit.cover
            ),
        ),
        ),
      ),
    );
  }
}

class _RatingWidget extends StatelessWidget {
  const _RatingWidget({
    Key key,
    @required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      itemSize : 16.0,
      minRating: 1,
      direction: Axis.horizontal,
      itemCount: 5,
      initialRating  : game.rating / 20,
      allowHalfRating: true,
      itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
      ratingWidget: RatingWidget(
        full : Icon(Icons.star, color: Colors.deepOrange),
        half : Icon(Icons.star_half, color: Colors.deepOrange),
        empty: Icon(Icons.star_border, color: Colors.deepOrange)
      ),
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }
}