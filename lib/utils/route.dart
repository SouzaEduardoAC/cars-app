import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page) => Navigator.push(
    context, MaterialPageRoute(builder: (BuildContext context) => page));

Future pushReplacement(BuildContext context, Widget page) => Navigator.pushReplacement(
    context, MaterialPageRoute(builder: (BuildContext context) => page));
