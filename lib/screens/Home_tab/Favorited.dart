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
      return Column(
        children: [
          _drawAuthorRow(Colors.deepOrange),
          _drawItemRow(),
        ],
      );
    },
    itemCount: 20,);
  }
  Widget _drawAuthorRow(MaterialColor textcolor){
    return Row(
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
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Michael Adams',style: TextStyle(color: Colors.grey),),
                Row(
                  children: [
                    Text('15 min',style: TextStyle(color: Colors.grey)),
                    Icon(Icons.visibility),
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
    return Container();
  }
}
