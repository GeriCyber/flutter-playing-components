import 'package:flutter/material.dart';
import 'package:flutter_playing_components/src/pages/alert_page.dart';
import 'package:flutter_playing_components/src/routes/routes.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Playing w/ components',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: gerAppRoutes(),
      onGenerateRoute: (settings) => MaterialPageRoute(
        builder: (BuildContext context) => AlertPage()
      )
    );
  }
}