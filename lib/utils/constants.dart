class Constants{
  static String TOP_HEADLINES_URL = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=cea99baa516f4f47840021763eb6c03a';
  static String headlinesFor(String keyword){
    return 'https://newsapi.org/v2/everything?q=$keyword&apiKey=cea99baa516f4f47840021763eb6c03a';
  }
}