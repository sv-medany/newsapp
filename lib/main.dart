import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/HomeScreen.dart';
import 'package:newsapp/myTheme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AppConfigProvider.dart';
import 'ArticleItem.dart';

void main(){
  runApp(ChangeNotifierProvider(
      create: (context)=>AppConfigProvider(),
      child: myApp()));
}
class myApp extends StatelessWidget {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
     provider=Provider.of<AppConfigProvider>(context);
    initsharedpref();
      return MaterialApp(
      localizationsDelegates:AppLocalizations.localizationsDelegates,
      supportedLocales:AppLocalizations.supportedLocales,
      routes:{HomeScreen.routename:(context)=>HomeScreen() ,
      ArticleItem.routename:(context)=>ArticleItem()
      },
      locale: Locale(provider.applang),
      initialRoute:HomeScreen.routename ,
      theme: myTheme.mytheme,
    );
  }
  void initsharedpref()async{
    final prefs= await SharedPreferences.getInstance();
    String? lang =prefs.getString("language")??"english";
      provider.changelang(lang);
  }
}
