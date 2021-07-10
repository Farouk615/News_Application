import 'package:flutter/cupertino.dart';

class PageModel {
  String _image;
  String _description;
  IconData icon;
  String _text;

  PageModel(this._image, this._description, this.icon, this._text);

  String get text => _text;

  String get description => _description;

  String get image => _image;

}