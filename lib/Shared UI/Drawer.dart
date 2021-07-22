import 'package:flutter/material.dart';
import 'package:news_application/screens/Instagram_feed.dart';
import 'package:news_application/screens/Twitter_feed.dart';
import '../Models/NavMenuItem.dart';
import '../screens/HeadlineNews.dart';
import '../screens/Walkthrough.dart';
class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
 List<NavMenuItem> navItem = [
   NavMenuItem('On Boarding', ()=> Walkthrough()),
   NavMenuItem('Headline news', ()=>HeadlineNew()),
   NavMenuItem('Twitter Feeds', ()=>TwitterFeed()),
   NavMenuItem('Instagram Feeds', ()=>InstagramFeed()),


 ];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 150 ),
        child: ListView.builder(itemBuilder: (BuildContext context,int index){
          return ListTile(
            title: Text(navItem[index].title),
            trailing: Icon(Icons.chevron_right),
            onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                return navItem[index].destination();
    },
              )
              );
            },
          );
        },
          itemCount: navItem.length,),
      ),
    );
  }
}
