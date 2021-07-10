import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PageModel.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({Key? key}) : super(key: key);

  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  List<PageModel> pages = <PageModel>[];

void _addPages(){
  pages.add(PageModel('assets/images/bg.jpg','Welcome',Icons.ac_unit_rounded,'1) Making friends is easy as waving your hand back and forth in easy'));
  pages.add(PageModel('assets/images/city2.jpg','Welcome',Icons.sports_football,'2) now making a girlfriend may seem a little bit more complicated but its easier than you think'));
  pages.add(PageModel('assets/images/city3.jpg','Welcome',Icons.icecream_outlined,'3) you defenitely can seduce any women you want its all about confidence '));
  pages.add(PageModel('assets/images/city4.jpg','Welcome',Icons.access_alarm,'4) you are a wizard'));

}

  @override
  Widget build(BuildContext context) {

_addPages();


        return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(itemBuilder: (context,index){// context 3ibara self wala this et index howa index mtaa page view
          return Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: ExactAssetImage(pages[index].image), fit: BoxFit.fill)
                ),
              ),
              Align(
                alignment : Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // 3ala9tou maa contents mte3ou
                  children: <Widget>[
                    Transform.translate(offset: Offset(0,-50),
                    child: Icon(pages[index].icon,size: 80,color: Colors.white,)),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text('Welcome',style: TextStyle(color: Colors.white,fontSize: 35),),
                    ),
                    Text( pages[index].text,style: TextStyle(color: Colors.white)),
                  ],
                ),
              )
            ],
          );
          },
          itemCount: pages.length, ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(

                  width: double.infinity,
                  child: ElevatedButton(style: ButtonStyle(),
                    onPressed: ()
                    {},
                    child: Text('Get Strated',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),


                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
