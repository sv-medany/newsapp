import 'package:flutter/material.dart';
import 'package:newsapp/ApiManager.dart';
import 'package:newsapp/NewsItem.dart';
import 'package:newsapp/model/NewsResponse.dart';

class ItemSearch extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    return[ IconButton(onPressed: (){showResults(context);}, icon: Icon(Icons.search,size: 16,))];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.cancel_outlined,size: 15,));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return FutureBuilder<NewsResponse>(
        future: ApiManager.searchnews(query),
        builder:(context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child:CircularProgressIndicator(),);
          }
          else if(snapshot.hasError){
            return Column(
              children: [Text('An error has occured'
              ),
              ElevatedButton(onPressed: (){}, child: Text('Try again'))
              ],
            );
          }
         if(snapshot.data?.status !='ok') {
           return Column(
             children: [
               Text(snapshot.data?.message ?? 'Error'),
               SizedBox(height: 8,),
               ElevatedButton(onPressed: () {
               }, child: Text('Try Again'))
             ],
           );
         }
         var articles=snapshot?.data?.articles ?? [];
         return ListView.builder(itemBuilder: (context,index){
           return NewsItem(article: articles[index]);
         },
         itemCount: articles?.length,
         );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
 return Center(child: Text('Suggestions'),);
  }

}