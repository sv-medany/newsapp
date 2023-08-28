import 'package:flutter/material.dart';
import 'package:newsapp/ApiManager.dart';
import 'package:newsapp/TabContainer.dart';
import 'package:newsapp/category.dart';
import 'package:newsapp/model/SourcesResponse.dart';

class CategoryDetails extends StatefulWidget {
  Category category;
  CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>

      (future: ApiManager.fetchdata(widget.category?.id ?? ''),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something went wrong'),
                SizedBox(height: 8,),
                ElevatedButton(onPressed: (){}, child: Text('Try Again'))
              ],
            );
          }
          if(snapshot.data?.status !='ok'){
            return Column(
              children: [
                Text(snapshot.data?.message ?? 'Error'),
                SizedBox(height: 8,),
                ElevatedButton(onPressed: (){setState(() {

                });}, child: Text('Try Again'))
              ],
            );
          }
          var sourceslist=snapshot.data?.sources ?? [];
          return TabContainer(sourceslist: sourceslist);
        });
  }
}
