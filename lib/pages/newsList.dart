
import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/newsArticleListViewModel.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget{
  NewsArticleListViewModel _newsArticleListViewModel = NewsArticleListViewModel();
  @override
  Widget build(BuildContext context) {
    final vm  = Provider.of<NewsArticleListViewModel>(context);
  return Scaffold(
    appBar: AppBar(
      title: const Text('Top News'),
      centerTitle: true,
    ),
    body: ListView.builder(
      itemCount: vm.articles.length,
      itemBuilder: (ctx,index){
        return ListTile(
          leading:Container(
            width: 100,
            height: 100,
            child: vm.articles[index].imageUrl == null ? Image.asset('assets/images/placeholder.jpg') : Image.network(vm.articles[index].imageUrl,fit: BoxFit.cover,),
          ) ,
          title: Text(vm.articles[index].title),
        );
      },
    ),
  );
  }
}