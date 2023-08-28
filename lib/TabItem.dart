import 'package:flutter/material.dart';
import 'package:newsapp/model/SourcesResponse.dart';
import 'package:newsapp/myTheme.dart';

class TabItem extends StatelessWidget {
  Source source;
  bool isfilled;
  TabItem({required this.source,required this.isfilled});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      decoration: BoxDecoration(
        color:isfilled? myTheme.greenColor:Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color:myTheme.greenColor),

      ),
      child: Text(source?.name ?? '',style: !isfilled?Theme.of(context).textTheme.headline1?.copyWith(color: myTheme.greenColor):Theme.of(context).textTheme.headline1,),

    );
  }
}
