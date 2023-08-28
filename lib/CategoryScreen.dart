import 'package:flutter/material.dart';
import 'package:newsapp/CategoryItem.dart';
import 'package:newsapp/category.dart';
import 'package:newsapp/myTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CategoryScreen extends StatelessWidget {
  @override
  var categorylist=Category.getallcategories();
  Function oncategorypressed;
  CategoryScreen({required this.oncategorypressed});
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.all(15),
              child: Text(AppLocalizations.of(context)!.pickyourinterest,style: Theme.of(context).textTheme.headline1!.copyWith(color: myTheme.darkblue),)),
          Expanded(
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
            ),
              itemBuilder: (context,index)=>InkWell(
                  onTap: (){
                    oncategorypressed(categorylist[index]);
                  }
                  ,child: CategoryItem(category: categorylist[index],index: index,)),

              itemCount: categorylist.length,
            ),
          )
        ],
      ),
    );
  }
}
