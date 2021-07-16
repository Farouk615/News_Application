import 'package:flutter/material.dart';
import 'package:news_application/screens/Home_tab/Popular.dart';
import 'package:news_application/screens/Home_tab/Whats%20new.dart';
import 'Home_tab/Favorited.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> navMenu= [
    'Explore',
    'Headline new',
    'Read Later',
    'Videos',
    'Photos',
    'Settings',
    'Layout',
  ];
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
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.only(top: 150 ),
            child: ListView.builder(itemBuilder: (BuildContext context,int index){
              return ListTile(
                title: Text(navMenu[index]),
                trailing: Icon(Icons.chevron_right),
                onTap: (){},
              );
            },
            itemCount: 7,),
          ),
        ),
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
