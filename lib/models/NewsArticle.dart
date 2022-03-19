class NewsArticle{
  final String title;
  final String description;
  final String urlToImage;
  final String url;

  NewsArticle({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.url
    });
  
  factory NewsArticle.fromJSON(Map<String,dynamic> json){
    return NewsArticle(
      title: json["title"] == null ? '':json["title"],
      description: json["description"] == null ? '':json['description'],
      urlToImage: json["urlToImage"] == null ? '':json['urlToImage'],
      url: json["url"] == null ? '':json['url']
    );
  }
}