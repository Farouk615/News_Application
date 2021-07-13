import 'package:flutter/material.dart';

class WhatsUp extends StatefulWidget {
  const WhatsUp({Key? key}) : super(key: key);

  @override
  _WhatsUpState createState() => _WhatsUpState();
}

class _WhatsUpState extends State<WhatsUp> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( // if the elements are bigger than the page it will scroll
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(image: ExactAssetImage('assets/images/placeholder.jpeg'), fit: BoxFit.fill),
          ),
         width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.25,
          child: Column(children: [
            Text('How terriers and royals get crush finals'),
            Text('Apple Color Emoji'),
          ],),
        ),
      ],),
    );
  }
}
