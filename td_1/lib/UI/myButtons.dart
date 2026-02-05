import 'package:flutter/material.dart';

final ButtonStyle myButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.blueGrey.shade900,
    padding: const EdgeInsets.symmetric(horizontal: 20),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    )
);