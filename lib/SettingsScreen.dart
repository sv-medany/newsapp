import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newsapp/AppConfigProvider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:newsapp/LanguageBottomSheet.dart';
import 'package:provider/provider.dart';
class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.headline1!.copyWith(color: Colors.black,fontSize: 20),),

          SizedBox(height: 8,),
          InkWell(
            onTap: (){
              showLanguageBottomSheet();
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                color: Colors.white
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                provider.applang=='en'?
                    Text(AppLocalizations.of(context)!.english):
                    Text(AppLocalizations.of(context)!.arabic),
                Icon(Icons.arrow_drop_down)
              ],

              ),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(context: context, builder: (context)=>LanguageBottomSheet());
  }
}
