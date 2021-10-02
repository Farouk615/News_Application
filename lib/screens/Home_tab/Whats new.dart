import 'dart:html';
import 'package:news_application/utilities/data_utilities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:news_application/Models/Post.dart';
import 'package:news_application/Api/Posts_api.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../SinglePost.dart';
class WhatsUp extends StatefulWidget {
  const WhatsUp({Key? key}) : super(key: key);

  @override
  _WhatsUpState createState() => _WhatsUpState();
}

class _WhatsUpState extends State<WhatsUp> {
  Posts_api posts_api = Posts_api();

  TextStyle _headerstyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // if the elements are bigger than the page it will scroll
      child: FutureBuilder( // we wrap the content with a future builder
        future: posts_api.fetchAllPosts(),
        builder:(context, AsyncSnapshot snapshot) { // return of fetchAllPosts function recuperer here
          switch (snapshot.connectionState) {
            case ConnectionState.active :
              return loading();
            case ConnectionState.done :
              if (snapshot.error != null) {
                //TODO : handle error
                return loading();
              }
              else {
                if (snapshot.hasData) {
                  List<Post> posts = snapshot.data;
                  if (posts.length >=3){
                    Post post1 = snapshot.data[0]; // building posts
                    Post post2 = snapshot.data[1];
                    Post post3 = snapshot.data[2];
                    Post post4 = snapshot.data[4];

                    return Column(
                      children: [
                        _drawHeader(post4),
                        _writeTitle('Top Stories'),
                        _drawTopStoriesCard(post1),
                        _drawLineBreaker(),
                        _drawTopStoriesCard(post2),
                        _drawLineBreaker(),
                        _drawTopStoriesCard(post3),
                        _writeTitle('Recent Updates'),
                        _drawRecentUpdates(
                            'SPORT', 'Vettel is Ferrari Number One - Hamilton',
                            Colors.deepOrange,post3),
                        _drawRecentUpdates('LIFESTYLE',
                            'The City in Pakistan that Loves a British Hairstyles',
                            Colors.lightGreen,post2),
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery
                              .of(context)
                              .size
                              .width * 0.05,
                        )
                      ],);
                  }
                  else
                    return noData();
                }
                else {
                  //TODO : Handle error
                  return noData();
                }
              }
            case ConnectionState.waiting :
              return loading();
            case ConnectionState.none :
            //TODO : Handle error
              return loading();
          }
        }),
    );
  }
  Widget _drawRecentUpdates(String title ,  String header , MaterialColor color , Post post ){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: GestureDetector(
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return SinglePost(post);
            }));
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.25 ,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(post.featured_image),
                      fit: BoxFit.cover,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20 , top: 18),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(post.featured_image),
                        fit: BoxFit.cover,
                      )
                  ),
                  width: 95,
                  height: 18,
                  child: Text(post.title,textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20 , top: 15),
                child: Text(post.content,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20 , top: 10),
                    child: Icon(Icons.timer,color: Colors.grey,),
                  ),
                  Padding(
                    padding: const EdgeInsets.only( top: 10),
                    child: Text('15 min',style: TextStyle(color: Colors.grey),),
                  )
                ],
              )

            ],
          ),
        ),

      ),
    );

  }
  Widget _drawHeader(Post post){
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return SinglePost(post);
        }));
      },
      child: (
         Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(post.featured_image),
              fit: BoxFit.cover,
            )
          ),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,

          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 10 , right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Text(post.title,style: _headerstyle,),
                  ),
                  Text(post.content,style: TextStyle(color: Colors.white),),
                ],),
            ),
          ),
        )
      ),
    );
  }
  Widget _writeTitle(String title){
    return Text(title,style: TextStyle(color: Colors.grey,),);
  }
  Widget _drawTopStoriesCard(Post post){

      return Container(
        color: Color(0xfafafa),
        child: GestureDetector(
          onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return SinglePost(post);
            }));
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.15,
                              height: MediaQuery.of(context).size.width * 0.1,
                              child: Image.network(post.featured_image, fit: BoxFit.fill),
                            ),
                            Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 10 , top: 12 ),
                                  child : Center(child: Text(post.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize:13),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 25 , left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Michael Adams'),
                                      SizedBox(width: 50,),
                                      Icon(Icons.timer),
                                      Text(_parseHumanDateTime(post.date_written)),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      );

  }
  Widget _drawLineBreaker(){
    return Container(
      height: 1,
      color: Colors.black,
    );
  }
  String _parseHumanDateTime(String dateTime){
return dateTime;
  }

}

