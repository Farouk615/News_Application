import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/Api/Posts_api.dart';
import 'package:news_application/Models/Post.dart';
import 'package:news_application/utilities/data_utilities.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  _PopularState createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  @override
  Widget build(BuildContext context) {
    Posts_api posts_api = new Posts_api();
    return FutureBuilder(
      future: posts_api.fetchPopular(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState){
          case ConnectionState.active:
            return _loading();
          case ConnectionState.done:
            if (snapshot.error != null) {
              //TODO : handle error
              return _loading();
            }
            else {
              if (snapshot.hasData) {
                List<Post> posts = snapshot.data;
                  return ListView.builder(itemBuilder: (BuildContext context, int index) {
                    return _drawTopStoriesCard(posts[index]);
                  },
                    itemCount: 7,);
                }
                else{
                  return _noData();}}
          case ConnectionState.waiting:
            return _loading as Widget;
          case ConnectionState.none:
            return _loading as Widget;
        }
        }


    );
  }
  Widget _drawTopStoriesCard(Post post){
    Posts_api posts_api = Posts_api();
        return Container(
          color: Color(0xfafafa),
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
                              child: Image(
                                  image: NetworkImage(post.featured_image), fit: BoxFit.fill
                              ),

                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20 , top: 12),
                                  child: Expanded(child: Text(post.content,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 25 , left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(post.title),
                                      SizedBox(width: 50,),
                                      Icon(Icons.timer),
                                      Text('15 min'),
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
              ),
              _drawLineBreaker(),
            ],
          ),
        );
      }
  Widget _drawLineBreaker(){
    return Container(
      height: 1,
      color: Colors.black,
    );
  }
}
Widget _loading(){
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      child: Center(child: CircularProgressIndicator()),
    ),
  );
}
Widget _noData(){
  return Container(
    child: Center(child: Text('no Data Available ')),
  );
}