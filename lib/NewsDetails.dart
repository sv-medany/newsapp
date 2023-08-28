import 'package:flutter/material.dart';
import 'package:newsapp/ApiManager.dart';
import 'package:newsapp/NewsItem.dart';
import 'package:newsapp/model/NewsResponse.dart';

import 'model/SourcesResponse.dart';

class NewsDetails extends StatefulWidget {
  Source source;

  NewsDetails({required this.source});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  List<Articles> news=[];
  bool istop=false;
  bool fetchnext=false;
  final controller=ScrollController();
  int pagenum=1;
  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      if (controller.position.atEdge) {
        istop = controller.position.pixels == 0;
        if (!istop) {
          fetchnext = true;
          if(mounted) {
            setState(() {});
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(fetchnext){

      ApiManager.news_data(source: widget.source.id,pagenum: ++pagenum).then((NewsResp) {
        news.addAll(NewsResp.articles??[]);
        fetchnext=false;
        if(mounted){
        setState(() {
        });
      }});
    }
    return FutureBuilder(
        future: ApiManager.news_data(source: widget.source?.id ?? ''),
        builder: (context, snapshot) {
           if (snapshot.hasError) {
            return Column(
              children: [
                Text('Something went wrong'),
                SizedBox(height: 8,),
                ElevatedButton(onPressed: () {}, child: Text('Try Again'))
              ],
            );
          }
          else if (snapshot.data?.status == 'error') {
            return Column(
              children: [
                Text(snapshot.data?.message ?? 'Error'),
                SizedBox(height: 8,),
                ElevatedButton(onPressed: () {
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );

          }
           else if(snapshot.hasData){
             var list=snapshot?.data?.articles?.isNotEmpty;
              if(news.isEmpty){
                news=snapshot?.data?.articles ?? [];
              }
              else if(list! && news[0].title != snapshot.data?.articles?[0]?.title){
                WidgetsBinding.instance.addPostFrameCallback((_){
                  controller.jumpTo(0);
                });
                  news=snapshot?.data?.articles ?? [];
              }
              else if(!list!){
                news=[];
              }
             return ListView.builder(
               controller: controller,
               itemBuilder: (context, index) => NewsItem(article: news[index]),
               itemCount: news.length,
             );


           }
           else{
             return Center(child: CircularProgressIndicator());
           }


         // add item here
        });
  }
  }

