import 'package:flutter/material.dart';

import 'Screens/HomeScreen.dart';

void main() {
  runApp( App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme:ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true ,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontFamily: 'tajawal',
            fontSize: 18.0,
          )


        )
      )
    );
  }
}
