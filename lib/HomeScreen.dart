
import 'package:flutter/material.dart';
import 'package:newsapp/CategoryDetails.dart';
import 'package:newsapp/CategoryScreen.dart';
import 'package:newsapp/HomeDrawer.dart';
import 'package:newsapp/ItemSearch.dart';
import 'package:newsapp/SettingsScreen.dart';
import 'category.dart';
class HomeScreen extends StatefulWidget {
  static String routename="home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
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
          title: Text('News App',style: Theme.of(context).textTheme.headline1,),
          actions: [
            IconButton(onPressed: (){
              
              showSearch(context: context, delegate: ItemSearch());
            }, icon: Icon(Icons.search,size: 20,))
          ],
        ),
        drawer: Drawer(
          child: HomeDrawer(onRowpressed:onRowTap ),
        ),
        body:
        selecteditemdrawer==HomeDrawer.sett?SettingsScreen():
        selectedCategory==null?CategoryScreen(oncategorypressed: onCategorySelected): CategoryDetails(category: selectedCategory!,),
      ),
    );
  }

  Category? selectedCategory=null;

  onCategorySelected(Category category){
    selectedCategory = category;
    setState(() {

    });

  }
  String selecteditemdrawer=HomeDrawer.categ;
  void onRowTap(String x){
    if(x=='1'){
      selecteditemdrawer=HomeDrawer.categ;
      Navigator.pop(context);
      selectedCategory=null;
      setState(() {
      });
    }
    else{
      selecteditemdrawer=HomeDrawer.sett;

      Navigator.pop(context);
      selectedCategory=null;
      setState(() {

      });
     }
  }
}
