import 'package:flutter/material.dart';
import 'customRoute.dart';
void main() => runApp(MaterialApp(
  title: 'NavigationTransition',
  home: FirstPage(),
  theme: ThemeData(
    primaryColor: Colors.lightBlue
  )
));

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('FirstPage', style: TextStyle(color: Colors.white, fontSize: 50.0)),
        elevation: 0.0,
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(Icons.navigate_next, color: Colors.white, size: 100.0,),
          onPressed: (){
            Navigator.of(context).push(CustomRoute(SecondPage())
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text('SecondPage', style: TextStyle(color: Colors.white, fontSize: 50.0)),
        elevation: 0.0,
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: MaterialButton(
          child: Icon(Icons.navigate_before, color: Colors.white, size: 100.0,),
          onPressed: (){
            Navigator.of(context).pop();
          }
        ),
      ),
    );
  }
}

