import 'package:flutter/material.dart';

import 'package:pinch_assignment/src/data/models/models.dart';

class GameDetailBody extends StatelessWidget {
  const GameDetailBody({
    Key key,
    @required this.game,
  }) : super(key: key);

  final GameResponse game;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        mainAxisAlignment : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width : 150.0,
            height: 150.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage("https://images.igdb.com/igdb/image/upload/t_cover_big/${game.cover.imageId}.jpg")
              )
            ),
          ),
          SizedBox( height: 20.0 ),
          Text(
            game.name,
            overflow : TextOverflow.ellipsis,
            style: TextStyle(
              color     : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize  : 24.0,
            )
          ),
          SizedBox( height: 20.0 ),
          Text(
            game.description,
            // overflow : TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: TextStyle(
              color   : Colors.black87,
              fontSize: 14.0
            )
          )
        ],
      ),
    );
  }
}



class GameDetailScreenSlider extends StatelessWidget {
  const GameDetailScreenSlider({ Key key,
    @required this.game,
  }) : super(key: key);

  final GameResponse game; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width : MediaQuery.of(context).size.width * 0.95,
      height: 280,
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[

          Padding(
            padding: EdgeInsets.symmetric( horizontal: 20, vertical: 5 ),
            child  : Text('Screenshots', style: TextStyle( fontSize  : 24.0, fontWeight: FontWeight.bold ),)
          ),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount  : game.screenshots.length,
              itemBuilder: ( _, int i) => _Screenshot(screenshot: game.screenshots[i])),
          )
        ]
      ),
    );
  }
}





class _Screenshot extends StatelessWidget {
  const _Screenshot({ Key key,
    @required this.screenshot,
  }) : super(key: key);

  final ScreenshotResponse screenshot; 

  @override
  Widget build(BuildContext context) {
    return Container(
      width : 150,
      height: 3000,
      padding: EdgeInsets.symmetric( vertical: 20 ),
      // color :  Colors.blue,
      margin: EdgeInsets.symmetric( horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FadeInImage(
          placeholder: AssetImage('assets/no-image.jpg'), 
          image: NetworkImage("https://images.igdb.com/igdb/image/upload/t_cover_big/${screenshot.imageId}.jpg"),
          width: 130,
          height: 190,
          fit: BoxFit.cover),
      ),
    );
  }
}