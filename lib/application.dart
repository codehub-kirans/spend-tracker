import 'package:flutter/material.dart';
import 'pages/index.dart';
//import 'package:spend_tracker/pages/index.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kiran\'s Spend Tracker',
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}
