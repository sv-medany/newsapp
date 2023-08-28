import 'package:flutter/material.dart';
import 'package:newsapp/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageBottomSheet extends StatefulWidget{
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
     provider=Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        provider.applang=='en'?selectedWidget("english"):selectedWidget("arabic"),
        provider.applang=='en'?InkWell(
            onTap: (){provider.changelang('ar');}
            ,child: unselectedWidget("arabic")):InkWell(
            onTap: (){provider.changelang('en');}
            ,child: unselectedWidget("english"))
      ],
    );
  }

  Widget selectedWidget(String applanguage){
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        applanguage=='english'?Text(AppLocalizations.of(context)!.english):
        Text(AppLocalizations.of(context)!.arabic),
          Icon(Icons.check,size: 20,)
        ],
      ),
    );
  }
  Widget unselectedWidget(String applanguage){
    return Container(
      padding: EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          applanguage=='english'?Text(AppLocalizations.of(context)!.english):
          Text(AppLocalizations.of(context)!.arabic),
        ],
      ),
    );
  }
}
