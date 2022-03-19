
import 'package:flutter/cupertino.dart';
import 'package:news_app/models/NewsArticle.dart';
import 'package:news_app/viewmodels/newsArticleViewModel.dart';
import '../services/webservice.dart';
enum LoadingStatus {
  completed,
  searching,
  empty
}
class NewsArticleListViewModel extends ChangeNotifier{
  List<NewsArticleViewModel> articles = [];
  NewsArticleListViewModel(){
    _populateTopHeadlines();
  }
  var loadingStatus = LoadingStatus.completed;
  void _populateTopHeadlines() async{
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticle = await WebService().fetchTopHeadlines();
    articles = newsArticle.map((article) => NewsArticleViewModel(article)).toList();
    this.loadingStatus = this.articles.isEmpty ? LoadingStatus.empty: LoadingStatus.completed;
    notifyListeners();
  }

  void search(String keyword) async{
    this.loadingStatus = LoadingStatus.searching;
    notifyListeners();
    List<NewsArticle> newsArticles = await WebService().fetchHeadlinesByKeyword(keyword);
    articles = newsArticles.map((article) => NewsArticleViewModel(article)).toList();
    this.loadingStatus = this.articles.isEmpty ? LoadingStatus.empty: LoadingStatus.completed;
    notifyListeners();
  }
}