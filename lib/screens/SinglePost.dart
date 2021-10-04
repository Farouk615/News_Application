import 'dart:math';

import 'package:flutter/material.dart';
import 'package:news_application/Models/Post.dart';
class SinglePost extends StatefulWidget {
  final Post post;

  SinglePost(this.post);

  @override
  _SinglePostState createState() => _SinglePostState();
}

class _SinglePostState extends State<SinglePost> {
  late final Post post;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height / 2.5,
          floating: true,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.post.featured_image), fit: BoxFit.fill
                )
              ),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context,position){
                  return Container(
                  height: 150,
                    color: generateRandomColor1(),
                  );
                },
                childCount : 25,
            ),
        )
      ],


    );
  }
  Color generateRandomColor1() {
    // Define all colors you want here
    const predefinedColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.black,
      Colors.white
    ];
    Random random = Random();
    return predefinedColors[random.nextInt(predefinedColors.length)];
  }
}
