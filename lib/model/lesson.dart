import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Lesson {
  String title;
  String level;
  double indicatorValue;
  int price;
  String content;

  Lesson(
      {required this.title, required this.level, required this.indicatorValue, required this.price, required this.content});
}

