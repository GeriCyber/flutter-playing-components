import 'package:flutter/cupertino.dart';
import 'package:flutter_playing_components/src/pages/alert_page.dart';
import 'package:flutter_playing_components/src/pages/avatar_page.dart';
import 'package:flutter_playing_components/src/pages/card_page.dart';
import 'package:flutter_playing_components/src/pages/home_page.dart';

Map<String, WidgetBuilder> gerAppRoutes() {
  return <String, WidgetBuilder> {
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
  };
}