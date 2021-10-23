import 'package:flutter/material.dart';
import 'package:moblie_api/pages/guesspage/guesspage.dart';
import 'package:moblie_api/pages/guesspage/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black54),
            headline2: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            headline3: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            headline4: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        primarySwatch: Colors.indigo,
      ),
      routes: {
        GuessPage.routeName: (context) => const GuessPage(),
        ResultPage.routeName: (context) => const ResultPage(),
      },
      initialRoute: GuessPage.routeName,
    );
  }
}