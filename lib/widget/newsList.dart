
import 'package:flutter/material.dart';
import '../viewmodels/newsArticleViewModel.dart';
import '../pages/newsArticleDetails.dart';

class NewsList extends StatelessWidget{
  final List<NewsArticleViewModel> articles;
  final Function(NewsArticleViewModel article) onSelected;
  NewsList(this.articles,this.onSelected);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (ctx,index){
        return ListTile(
          onTap: (){
            this.onSelected(articles[index]);
            //_showNewsArticleDetails(context,articles[index]);
          },
          leading:Container(
            width: 100,
            height: 100,
            child: articles[index].imageUrl == '' ? Image.asset('assets/images/placeholder.jpg',fit: BoxFit.cover,) : Image.network(articles[index].imageUrl,fit: BoxFit.cover,),
          ) ,
          title: Text(articles[index].title),
        );
      },
    );
  }
}