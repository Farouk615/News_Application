import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/screens/HomePage.dart';
import 'package:page_view_indicator/page_view_indicator.dart';
import '../Models/PageModel.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({Key? key}) : super(key: key);

  @override
  _WalkthroughState createState() => _WalkthroughState();

}

class _WalkthroughState extends State<Walkthrough> {
  late List<PageModel> pages ;
  ValueNotifier<int> pageValueNotifier = ValueNotifier(0);


void _addPages(){
  pages = <PageModel>[];
  pages.add(PageModel('assets/images/city.jpg','Welcome',Icons.ac_unit_rounded,'1) Making friends is easy as waving your hand back and forth in easy'));
  pages.add(PageModel('assets/images/city2.jpg','Welcome',Icons.sports_football,'2) now making a girlfriend may seem a little bit more complicated but its easier than you think'));
  pages.add(PageModel('assets/images/citys.jpg','Welcome',Icons.icecream_outlined,'3) you defenitely can seduce any women you want its all about confidence '));
  pages.add(PageModel('assets/images/city4.jpg','Welcome',Icons.access_alarm,'4) you are a wizard'));
}
  Widget _displayPageIndicators(int length){
    return PageViewIndicator(
      pageIndexNotifier: pageValueNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
        size: 8.0,
        color: Colors.grey,
      ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
        scale: CurvedAnimation(
          parent: animationController,
          curve: Curves.ease,
        ),
        child: Circle(
          size: 8.0,
          color: Colors.red,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

_addPages();


        return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(itemBuilder: (context,index){ // context 3ibara self wala this et index howa index mtaa page view
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
          itemCount: pages.length,
            onPageChanged: (index) {
              pageValueNotifier.value=index;
            },
          ),
          Transform.translate( // page indicator
            offset: Offset(0,150), // translation of page indicator
            child: Align(
              alignment: Alignment.center,
              child: Container(
                child: _displayPageIndicators(pages.length),
             ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: SizedBox(

                  width: double.infinity,
                  child: ElevatedButton(style: ButtonStyle(),
                      onPressed: () {
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                      );
                      },
                    child: Text('Get Started',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}



