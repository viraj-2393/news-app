
import 'package:flutter/cupertino.dart';
import 'package:news_app/models/NewsArticle.dart';
import 'package:news_app/viewmodels/newsArticleViewModel.dart';
import '../services/webservice.dart';
class NewsArticleListViewModel extends ChangeNotifier{
  List<NewsArticleViewModel> articles = [];
  NewsArticleListViewModel(){
    _populateTopHeadlines();
  }
  void _populateTopHeadlines() async{
    List<NewsArticle> newsArticle = await WebService().fetchTopHeadlines();
    articles = newsArticle.map((article) => NewsArticleViewModel(article)).toList();
    notifyListeners();
  }
}