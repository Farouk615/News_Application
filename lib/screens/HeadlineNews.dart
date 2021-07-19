import 'package:flutter/material.dart';
import 'package:news_application/Shared%20UI/Drawer.dart';

import 'Home_tab/Favorited.dart';
import 'Home_tab/Popular.dart';
import 'Home_tab/Whats new.dart';
class HeadlineNew extends StatefulWidget {
  const HeadlineNew({Key? key}) : super(key: key);

  @override
  _HeadlineNewState createState() => _HeadlineNewState();
}

class _HeadlineNewState extends State<HeadlineNew> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Explore'),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
            IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
          ],
          bottom: TabBar(tabs: [
            Tab(text: 'WHATS NEW',),
            Tab(text: 'POPULAR',),
            Tab(text: 'FAVORITED',),
          ],
          ),
        ),
        drawer: MyDrawer(),
        body: Center(
            child: TabBarView(children: [
              Favorite(),
              Popular(),
              Favorite(),
            ],)
        ),
      ),
    );
}}
