import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:newsapp/myTheme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HomeDrawer extends StatelessWidget {
  static String categ='1';
 static  String sett='2';
  Function onRowpressed;
  HomeDrawer({required this.onRowpressed});
  @override
  Widget build(BuildContext context) {
    var x=MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          color: myTheme.greenColor,
          width: double.infinity,
          alignment: Alignment.center,
          height: x.height*0.15,
          child: Text('News App!',style: Theme.of(context).textTheme.headline1,
          textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: (){
              onRowpressed('1');
            },
            child: Row(
              children: [
                Icon(Icons.list,color: Colors.black,),
                SizedBox(width: 10,),
                Text(AppLocalizations.of(context)!.categories,style: Theme.of(context).textTheme.headline2,),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: InkWell(
            onTap: (){
              onRowpressed('2');
            },
            child: Row(
              children: [
                Icon(Icons.settings,color: Colors.black,),
                SizedBox(width: 10,),
                Text(AppLocalizations.of(context)!.settings,style: Theme.of(context).textTheme.headline2,),
              ],
            ),
          ),
        ),
      ],
      

    );
  }
}
