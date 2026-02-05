import 'package:flutter/material.dart';

import 'UI/home.dart';

void main() {
  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application Quiz",
      home: MyWidget(
          color: Color(0xFF7BC4DD),
          textSize: 40.0)
  ));
}