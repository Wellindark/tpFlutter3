import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tpflutter3/ui/pages/catsPage.dart';
import 'package:tpflutter3/ui/pages/favouriteCats.dart';


void main() => runApp(
   MyApp(),
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: <String, WidgetBuilder>{
        FavouriteCatsPage.routeName: (BuildContext context) => FavouriteCatsPage(),
      },
      home: CatsPage(),
    );
  }
}
