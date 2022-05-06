import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// Bloc import
import 'package:pinch_assignment/src/presentation/bloc/games_bloc.dart';

// Pages Import
import 'package:pinch_assignment/src/presentation/pages/pages.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => GamesBloc())
      ],
      child: MaterialApp(
        localizationsDelegates: [ 
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
           const Locale('es', 'ES'),
         ],
        debugShowCheckedModeBanner: false,
        title: 'PinchGames',
        initialRoute: 'games',
        routes: {
         'games'      : (_) => GamesPage(),
         'game_detail': (_) => GameDetailPage()
        },
        theme: ThemeData.light().copyWith(
          appBarTheme: AppBarTheme(
            color: Colors.orange
          )
        ),
      )
    );
  }
}