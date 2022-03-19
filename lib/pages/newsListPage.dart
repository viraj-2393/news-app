
import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/newsArticleListViewModel.dart';
import 'package:news_app/widget/newsList.dart';
import 'package:provider/provider.dart';

import '../viewmodels/newsArticleViewModel.dart';
import 'newsArticleDetails.dart';

class NewsListPage extends StatelessWidget{
  NewsArticleListViewModel _newsArticleListViewModel = NewsArticleListViewModel();
  final _controller = TextEditingController();
  Widget _buildList(BuildContext context,NewsArticleListViewModel vm){
    switch(vm.loadingStatus){
      case LoadingStatus.searching:
        return Align(child: CircularProgressIndicator(),);
      case LoadingStatus.empty:
        return Align(child: Text("No results found!"),);
      case LoadingStatus.completed:
        return Expanded(child: NewsList(vm.articles,(article){
          _showNewsArticleDetails(context, article);
        }));
    }
  }
  void _showNewsArticleDetails(BuildContext context,NewsArticleViewModel article){
    Navigator.push(context,MaterialPageRoute(
        builder: (context) => NewsArticleDetailsPage(article)
    ));
  }
  @override
  Widget build(BuildContext context) {
    final vm  = Provider.of<NewsArticleListViewModel>(context);
  return Scaffold(
    appBar: AppBar(
      title: const Text('Top News'),
      centerTitle: true,
    ),
    body: Column(
      children: [

        TextField(
          controller: _controller,
          onSubmitted: (value){
            //fetch all the news related to the keyword
            if(value.isNotEmpty){
              vm.search(value);
            }

          },
          decoration: InputDecoration(
            labelText: 'Enter search term',
            icon: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: (){
                _controller.clear();
              },
            )
          ),
        ),
        _buildList(context,vm),
      ],
    ),
  );
  }
}