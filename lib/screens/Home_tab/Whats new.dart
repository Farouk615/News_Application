import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WhatsUp extends StatefulWidget {
  const WhatsUp({Key? key}) : super(key: key);

  @override
  _WhatsUpState createState() => _WhatsUpState();
}

class _WhatsUpState extends State<WhatsUp> {

  TextStyle _headerstyle = TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // if the elements are bigger than the page it will scroll
      child: Column(
        children: [
          _drawHeader(),
          _writeTitle('Top Stories'),
          _drawTopStoriesCard(),
          _drawLineBreaker(),
          _drawTopStoriesCard(),
          _drawLineBreaker(),
          _drawTopStoriesCard(),
          _writeTitle('Recent Updates'),
          _drawRecentUpdates(),
          _drawRecentUpdates(),

        ],),
    );
  }
  Widget _drawRecentUpdates(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width * 0.25 ,
              decoration: BoxDecoration(
                  image:DecorationImage(
                      image: ExactAssetImage('assets/images/back.jpg'),
                      fit: BoxFit.cover
                  )
              ),
            )
          ],
        ),

      ),
    );

  }
  Widget _drawHeader(){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: ExactAssetImage('assets/images/back.jpg'), fit: BoxFit.fill),
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
                child: Text('How Terriers & Royals Gatecrashe Final',style: _headerstyle,),
              ),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do',style: TextStyle(color: Colors.white),),
            ],),
        ),
      ),
    );

  }
  Widget _writeTitle(String title){
    return Text(title,style: TextStyle(color: Colors.grey,),);
  }
  Widget _drawTopStoriesCard(){
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
                              image: ExactAssetImage('assets/images/back.jpg'), fit: BoxFit.fill
                          ),

                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 100),
                              child: Text('The World Global Warming Annual Summit ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 200),
                                    child: Text('Michael Adams'),
                                  ),
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
          )

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
