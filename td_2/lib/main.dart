import 'package:dev_mobile/mytheme.dart';
import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "TD2",
    home: MyApp(),
    theme: MyTheme.dark(),
  ));
}