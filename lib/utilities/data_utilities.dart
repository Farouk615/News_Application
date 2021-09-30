import 'package:flutter/material.dart';
Widget loading(){
  return Padding(
    padding: const EdgeInsets.all(15),
    child: Container(
      child: Center(child: CircularProgressIndicator()),
    ),
  );
}
Widget noData(){
  return Container(
    child: Center(child: Text('no Data Available ')),
  );
}