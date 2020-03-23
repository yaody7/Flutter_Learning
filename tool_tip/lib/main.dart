import 'package:flutter/material.dart';

void main()=>runApp(MaterialApp(
  title: 'Tool Tip',
  home: MainPage(),
));

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Tool Tip')),
      body: Center(
        child:Tooltip(
          child: Container(
            width: width / 2,
            height: height / 2,
            child: Image.network('https://c-ssl.duitang.com/uploads/item/201510/26/20151026212004_wxaBz.jpeg',
            fit: BoxFit.fill),
          ),
          message: 'Touch!!!!!!!!!'
        ),
      )
    );
  }
}
