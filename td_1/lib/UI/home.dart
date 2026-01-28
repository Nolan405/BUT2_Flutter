import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget{
  final Color color;
  final double textsize;
  final String message;
  const MyWidget(this.color,this.textsize,this.message);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quizz App"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        backgroundColor: color,
        body: Center(
            child: Text(
              message,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: textsize,
              ),
            )));
  }
}