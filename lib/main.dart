import 'package:flutter/material.dart';
import 'package:news_application/utilities/MyTheme.dart';
import 'Api/Authors_api.dart';
import 'Models/author.dart';
import 'screens/Walkthrough.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Walkthrough(),
      theme: AppTheme.appTheme,
    );
  }
}
