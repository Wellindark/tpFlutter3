import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tpflutter3/data/models/Cat.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../dioHelper.dart';
class CatsProvider{

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<Response> getCats() async {
    var dio = Dio();
    dio.options.headers["x-api-key"] = "0c549e1c-bfb2-4ad9-92f0-6c6986db578e";

    Response catsResponse = await dio.get("https://api.thecatapi.com/v1/images/search?limit=10");

    return catsResponse;
  }

  Future<CatImage> getCatV2() async{
    DioHelper dioHelper = DioHelper.instance;
    final resp = await dioHelper.get("/ditto");
    var test = jsonDecode(resp);
    return CatImage.fromJson(test);
  }

}