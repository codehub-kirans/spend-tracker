import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:spend_tracker/pages/home/widgets/custom_text.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var amount = "1203";
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          size: 40,
          color: Colors.yellow,
        ),
        title: const Text("Home"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => print('click'),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _TotalBudget(amount: amount),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            height: MediaQuery.of(context).size.height - 176,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _BarLine(100, Colors.red, 'Withdraw', 506),
                _BarLine(400, Colors.green, 'Withdraw', 1706),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _BarLine extends StatelessWidget {
  const _BarLine(
    this.height,
    this.color,
    this.label,
    this.amount, {
    Key key,
  }) : super(key: key);
  final double height;
  final Color color;
  final String label;
  final int amount;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: height,
          width: 100,
          color: color,
        ),
        Text(label),
        Text('\$$amount'),
      ],
    );
  }
}

class _TotalBudget extends StatelessWidget {
  const _TotalBudget({
    Key key,
    @required this.amount,
  }) : super(key: key);

  final String amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.all(10),
      alignment: Alignment.center,
      child: Text(
        '\$$amount',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.green,
              Colors.white54,
              Colors.blueGrey,
            ],
            stops: [0.85, 0.95, 1],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(4, 4),
            ),
          ]),
    );
  }
}
