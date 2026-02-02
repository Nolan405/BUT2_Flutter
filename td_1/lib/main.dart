import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'UI/home.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application Quizz",
      home: MyWidget(
          color: Colors.teal,
          textSize: 40.0)
  ));
}