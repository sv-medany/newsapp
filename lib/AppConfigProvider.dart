import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class AppConfigProvider extends ChangeNotifier{
  String applang='en';
  void changelang(String newlang) async{
    final sharedpref=await SharedPreferences.getInstance();
    if(newlang==applang){
      return;
    }
    applang=newlang;
    sharedpref.setString("language", applang);
    notifyListeners();
  }
}