
import 'package:news_app/models/NewsArticle.dart';

class NewsArticleViewModel{
  NewsArticle _newsArticle;
  NewsArticleViewModel(this._newsArticle);

  String get title{
    return _newsArticle.title;
  }
  String get description{
    return _newsArticle.description;
  }
  String get imageUrl{
    return _newsArticle.urlToImage;
  }
  String get url{
    return _newsArticle.url;
  }

}