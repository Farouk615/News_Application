import 'package:flutter/material.dart';
import 'package:news_application/Shared%20UI/Drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))

        ],
      ),
      drawer: Drawer(),
      body: Container(
        child: Text('welcome to the home page'),
      ),
    );
  }
}
