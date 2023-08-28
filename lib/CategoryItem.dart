import 'package:flutter/material.dart';
import 'category.dart';
class CategoryItem extends StatelessWidget {
  Category category;
  int index;
  CategoryItem({required this.category, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
          bottomLeft: index%2==0?Radius.circular(16):Radius.circular(0),
          bottomRight: !(index%2==0)?Radius.circular(16):Radius.circular(0),
        ),
      ),
      child: Column(

        children: [
          Image.asset(category.imagePath,height: 120,),
          Text(category.title,style: Theme.of(context).textTheme.headline1,)
        ],
      ),


    );
  }
}
