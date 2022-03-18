import 'package:flutter/material.dart';
import 'package:news_app/pages/newsList.dart';
import 'package:news_app/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (ctx) => NewsArticleListViewModel(),
        child: NewsList(),
      ),
    );
  }
}