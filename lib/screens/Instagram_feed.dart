import 'package:flutter/material.dart';
import 'package:news_application/Shared%20UI/Drawer.dart';
class InstagramFeed extends StatefulWidget {
  const InstagramFeed({Key? key}) : super(key: key);

  @override
  _InstagramFeedState createState() => _InstagramFeedState();
}

class _InstagramFeedState extends State<InstagramFeed> {
  List<String> titles = ['Cristina Meyers', 'Ayadi Mohamed Farouk','Jochi Tatsu','Cristina Meyers', 'Ayadi Mohamed Farouk','Jochi Tatsu','Cristina Meyers', 'Ayadi Mohamed Farouk','Jochi Tatsu',];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          title: Text('Twitter Feeds'),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search)),],
        ),
        body: ListView.builder(padding: EdgeInsets.all(12) ,itemBuilder: (BuildContext context, int index) {

          return Card(
            child: _drawcard(titles[index]),
          );

        },  itemCount: 9, )
    );

  }
  Widget _drawCircle(){
    return CircleAvatar(
      backgroundImage: ExactAssetImage('assets/images/back.jpg'),
    );}
  Widget _drawcard(String title){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: _drawCircle(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(title,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 15)),
                          SizedBox(width: 5,),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Text('Fri, 12 May 2017 • 14.30')
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.grey,)),
                    Text('25',style: TextStyle(color: Colors.grey),),
                  ],
                )
              ]
          ),
          Padding(
            padding: const EdgeInsets.all( 13),
            child: Center(child: Text('We also talk about the future of work as the robots ')),
          ),
          SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,

            child: Image(
                image: ExactAssetImage('assets/images/back.jpg'), fit: BoxFit.fill
            ),

          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  Text('10 Comments',style: TextStyle(color: Colors.orange,fontWeight: FontWeight.bold),),
                ],
              ),
              Row(
                children: [
                  TextButton(onPressed: (){}, child: Text('SHARE',style: TextStyle(color: Colors.orange),)),
                  TextButton(onPressed: (){}, child: Text('OPEN',style: TextStyle(color: Colors.orange)))

                ],
              )

            ],
          )
        ]
    );

  }

}
