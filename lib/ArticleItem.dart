import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/model/NewsResponse.dart';
import 'package:newsapp/myTheme.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleItem extends StatelessWidget {
  static String routename = 'article';

  @override
  Widget build(BuildContext context) {
    var article = ModalRoute
        .of(context)
        ?.settings
        ?.arguments as Articles;
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage('assets/images/pattern.png'),
              fit: BoxFit.cover)
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text('News App', style: Theme
              .of(context)
              .textTheme
              .headline1,),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? '',
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),

              ),
              SizedBox(height: 5,),
              Text(article.source?.name ?? '', style: Theme
                  .of(context)
                  .textTheme
                  .headline1!
                  .copyWith(color: myTheme.grey,

                  fontSize: 15),),
              Text(article.title ?? '', style: Theme
                  .of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: myTheme.grey)),
              Text(article.publishedAt ?? '', textAlign: TextAlign.right,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline1
                      ?.copyWith(color: myTheme.grey,
                      fontSize: 16
                  )),
              SizedBox(height: 5,),
              Text(article.description ?? '', style: Theme
                  .of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(color: Colors.black,
                  fontSize: 18
              )),
              SizedBox(height: 10,),
              InkWell(
                onTap: (){
                  LaunchUrl(article?.url ?? '');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('View Full Article', style: Theme
                        .of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(color: myTheme.grey)),
                    Icon(Icons.arrow_forward_ios_outlined, size: 16,)
                  ],
                ),
              )


            ],
          ),
        ),
      ),
    )

    ;
  }

  Future<void> LaunchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}