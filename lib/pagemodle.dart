import 'package:flutter/material.dart';

class PageModel{
  String _title;
  String _description;
  IconData _icone;
  String _image;
  PageModel(this._title, this._description , this._icone,this._image);

  String get image => _image;

  IconData get icone => _icone;

  String get description => _description;

  String get title => _title;

}