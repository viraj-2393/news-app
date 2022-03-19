import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/NewsArticle.dart';
import 'package:news_app/utils/constants.dart';
class WebService{
  Future<List<NewsArticle>> fetchTopHeadlines() async{
    final  url = Uri.parse(Constants.TOP_HEADLINES_URL);
    final response = await http.get(url);
    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      List list = result['articles'];
      //print(list[0]['description']);
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    }else{
      throw Exception('Failed to get top news!');
    }
  }

  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async{
    final url = Uri.parse(Constants.headlinesFor(keyword.toString()));
    final response = await http.get(url);

    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      List list = result['articles'];
      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    }else{
      throw Exception('Failed to get news!');
    }
  }
}