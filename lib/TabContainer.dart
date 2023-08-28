import 'package:flutter/material.dart';
import 'package:newsapp/NewsDetails.dart';
import 'package:newsapp/TabItem.dart';
import 'package:newsapp/model/NewsResponse.dart';
import 'package:newsapp/model/SourcesResponse.dart';

class TabContainer extends StatefulWidget {
  List<Source> sourceslist;

  TabContainer({required this.sourceslist});

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  @override
  int selectedindex=0;


  Widget build(BuildContext context) {

    return DefaultTabController(
      length: widget.sourceslist.length,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.transparent,
            isScrollable: true,
            onTap: (index) {
              selectedindex = index;
              setState(() {

              });
            },
            tabs:widget.sourceslist.map((source) => TabItem(source: source, isfilled:selectedindex== widget.sourceslist.indexOf(source),) ).toList()
          ),
          Expanded(child: NewsDetails(source: widget.sourceslist[selectedindex],))
          

        ],
      ),



    );
  }
}
