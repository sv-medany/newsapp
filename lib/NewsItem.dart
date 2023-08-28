import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/ArticleItem.dart';
import 'package:newsapp/myTheme.dart';

import 'model/NewsResponse.dart';

class NewsItem extends StatelessWidget {
  Articles article;
  NewsItem({required this.article});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
      Navigator.of(context).pushNamed(ArticleItem.routename,
      arguments: article
      );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 8),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             Container(
               clipBehavior: Clip.antiAlias,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(16),
               ),
               child: CachedNetworkImage(
                 imageUrl: article!.urlToImage ?? '',
                 placeholder: (context, url) => CircularProgressIndicator(),
                 errorWidget: (context, url, error) => Icon(Icons.error),
               ),

             ),
             SizedBox(height: 5,),
             Text(article?.source?.name ?? '',style: Theme.of(context).textTheme.headline1!.copyWith(color: myTheme.grey ,

             fontSize: 15),),
             Text(article?.title ?? '',style: Theme.of(context).textTheme.headline1?.copyWith(color: myTheme.grey)),
             Text(article?.publishedAt ?? '' ,textAlign: TextAlign.right,)
           ],
         ),
      ),
    );
  }
}
