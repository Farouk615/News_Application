import 'package:flutter/material.dart';
import 'package:news_application/Shared%20UI/Drawer.dart';
class TwitterFeed extends StatefulWidget {
  const TwitterFeed({Key? key}) : super(key: key);

  @override
  _TwitterFeedState createState() => _TwitterFeedState();
}

class _TwitterFeedState extends State<TwitterFeed> {
  List<String> titles = ['Cristina Meyers', 'Ayadi Mohamed Farouk','Jochi Tatsu','Cristina Meyers', 'Ayadi Mohamed Farouk','Jochi Tatsu','Cristina Meyers', 'Ayadi Mohamed Farouk','Jochi Tatsu',];
  List<String> identifiers = ['@Thomas', '@MrFarouk','@MrJochi','@Thomas', '@MrFarouk','@MrJochi','@Thomas', '@MrFarouk','@MrJochi',];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Twitter Feeds'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search)),],
      ),
      body: ListView.builder(itemBuilder: (BuildContext context, int index) {
    return Card(
    child: _drawcard(titles[index], identifiers[index]),
    );

  },  itemCount: 9, )
    );
  }
Widget _drawCircle(){
    return CircleAvatar(
      backgroundImage: ExactAssetImage('assets/images/back.jpg'),
    );
}
  Widget _drawcard(String name, String identifier) {
    return
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Row(
      children: [
      _drawCircle(),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            children: [
              Text(name,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15)),
              SizedBox(width: 5,),
              Text(identifier,style: TextStyle(color: Colors.grey),),
            ],
          ),
          SizedBox(height: 5,),
          Text('Fri, 12 May 2017 • 14.30')
        ],
        ),
      ),
      ]
    ),
     Padding(
       padding: const EdgeInsets.only(top: 13),
       child: Center(child: Text('We also talk about the future of work as the robots advance, and we ask whether a retro phone',style: TextStyle(fontSize: 20),)),
     ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
          Row(
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.twenty_two_mp)),
              Text('25'),

            ],
          )
        ]
    );
  }

}
