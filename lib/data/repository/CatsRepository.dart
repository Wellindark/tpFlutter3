import 'package:dio/dio.dart';
import 'package:tpflutter3/data/models/Cat.dart';
import 'package:tpflutter3/data/providers/CatsProvider.dart';
class CatsRepository {
  CatsRepository._privateConstructor();
  static final CatsRepository _instance = CatsRepository._privateConstructor();
  static CatsRepository get instance => _instance;

  Future<CatImage> firstCat() async {
    Response response = await CatsProvider().getCats();
    if(response.data is List){
      List data = response.data;
      List<CatImage> cats = data.map((object) => CatImage.fromJson(object)).toList();
      return cats[0];
    } else if(response.statusCode == 204){
      return null;
    }
  }
  Future<List<CatImage>> getCats() async {

    Response response = await CatsProvider().getCats();
    if(response.data is List){
      List data = response.data;
      List<CatImage> cats = data.map((object) => CatImage.fromJson(object)).toList();
      return cats;
    } else if(response.statusCode == 204){
      return null;
    }
  }
}