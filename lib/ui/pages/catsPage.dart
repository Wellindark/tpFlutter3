import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tpflutter3/data/models/Cat.dart';
import 'package:tpflutter3/data/providers/CatsProvider.dart';
import 'package:tpflutter3/data/repository/CatsRepository.dart';

class CatsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _catPageState();
  static const String routeName = "/cats";
}

class _catPageState extends State<CatsPage> {
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
                      
                      return Image.network(
                          cat.data[position].url,
                      );

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