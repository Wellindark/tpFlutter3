import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tpflutter3/data/models/Cat.dart';
import 'package:tpflutter3/data/providers/CatsProvider.dart';
import 'package:tpflutter3/data/repository/CatsRepository.dart';

class FavouriteCatsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _favouriteCatPageState();
  static const String routeName = "/favouritecats";
}

// ignore: camel_case_types
class _favouriteCatPageState extends State<FavouriteCatsPage> {

  final _catsRepository = CatsRepository.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("LES CHATS")
        ),
        body: FutureBuilder(
            future: _catsRepository.getCats(),
            builder: (BuildContext context, AsyncSnapshot<List<CatImage>> cat) {
              if(cat.hasData){
                return ListView.builder(
                    itemCount: cat.data.length,
                    itemBuilder: (context, position){
                      return Image.network(cat.data[position].url);
                    }
                );
              } else {
                return CircularProgressIndicator();
              }
            }
        )
    );
  }
}