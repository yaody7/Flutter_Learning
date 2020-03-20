import 'package:flutter/material.dart';
class page extends StatelessWidget {
  final String title;
  page({Key key, @required this.title}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Text('This is ${this.title} page'),
      ),
    );
  }
}
