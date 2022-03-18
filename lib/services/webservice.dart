import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/NewsArticle.dart';
class WebService{
  Future<List<NewsArticle>> fetchTopHeadlines() async{
    final  url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&apiKey=cea99baa516f4f47840021763eb6c03a");
    final response = await http.get(url);
    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      List list = result['articles'];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    }else{
      throw Exception('Failed to get top news!');
    }
  }
}