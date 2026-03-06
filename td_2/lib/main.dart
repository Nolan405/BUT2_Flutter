import 'package:dev_mobile/theme/mytheme.dart';
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