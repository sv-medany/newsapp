import 'package:flutter/material.dart';
import 'package:newsapp/myTheme.dart';

class Category{
  String id;
  String title;
  String imagePath;
  Color color;
  Category({required this.id,required this.title,required this.imagePath,required this.color});
  static List<Category> getallcategories(){

    return [
      Category(id: 'sports', title: 'Sports', imagePath: 'assets/images/sports.png', color: myTheme.redColor),
      Category(id: 'general', title: 'General', imagePath: 'assets/images/Politics.png', color: myTheme.blueColor),
      Category(id: 'health', title: 'Health', imagePath: 'assets/images/health.png', color: myTheme.pinkColor),
      Category(id: 'business', title: 'Business', imagePath: 'assets/images/bussines.png', color: myTheme.goldColor),
      Category(id: 'technology', title: 'Technology', imagePath: 'assets/images/environment.png', color: myTheme.blueitem),
      Category(id: 'science', title: 'Science', imagePath: 'assets/images/science.png', color: myTheme.yellow),
      Category(id: 'entertainment', title: 'Entertainment', imagePath: 'assets/images/environment.png', color: myTheme.pinkColor),
    ];
  }
}