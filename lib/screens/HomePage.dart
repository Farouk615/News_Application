import 'package:flutter/material.dart';
import 'package:news_application/Api/Posts_api.dart';
import 'package:news_application/Shared%20UI/Drawer.dart';
import 'package:news_application/screens/Home_tab/Popular.dart';
import 'package:news_application/screens/Home_tab/Whats%20new.dart';
import 'Home_tab/Favorited.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Posts_api posts_api = Posts_api();

  @override
  Widget build(BuildContext context) {
    posts_api.fetchAllPosts();
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
            WhatsUp(),
            Popular(),
            Favorite(),
          ],)
        ),
      ),
    );
  }
}
