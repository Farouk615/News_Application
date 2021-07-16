import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List<MaterialColor> textcolor = [
    Colors.deepOrange,
    Colors.teal,
    Colors.cyan,
    Colors.brown,
  ];

Random random = Random();
  MaterialColor _getRandomColor(){
    return textcolor[random.nextInt(textcolor.length)];
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context,int index){
      return Card(
        child: Column(
          children: [
            _drawAuthorRow(Colors.deepOrange),
            _drawItemRow(),
          ],
        ),
      );
    },
    itemCount: 20,);
  }
  Widget _drawAuthorRow(MaterialColor textcolor){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                    image:DecorationImage(
                    image: ExactAssetImage('assets/images/back.jpg'),
                     fit: BoxFit.cover
                  ),
                ),
             width: 40,
                height: 20,
                margin: EdgeInsets.all(12),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5,),
                  Text('Michael Adams',style: TextStyle(color: Colors.grey),),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Text('15 min',style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 10,),
                      Icon(Icons.visibility),
                      SizedBox(width: 10,),
                      Text('Lifestyle',style: TextStyle(color: _getRandomColor()),),
                    ],
                  )
                ],
              )
            ],
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            color: Colors.grey,
            onPressed: () {},
          ),
        ],
      );

  }
  Widget _drawItemRow(){
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30 , top: 15 , bottom: 15,right: 20),
          child: Container(
            width: MediaQuery.of(context).size.height * 0.25,
            height: MediaQuery.of(context).size.height * 0.15 ,
            decoration: BoxDecoration(
              image:DecorationImage(
                  image: ExactAssetImage('assets/images/back.jpg'),
                  fit: BoxFit.cover
              ),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tech Tent: Old phones and safe social', style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),
              SizedBox(width: 10,),
              Text('We also talk about the future of work as the robots advance, and we ask whether a retro phone',style: TextStyle(fontSize: 20,height: 1.25,color:Colors.grey),),
            ],
          ),
        )
      ],
    );
  }
}
