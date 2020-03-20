import 'package:flutter/material.dart';
import 'page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentState = 0;
  List<Widget> _pageList;
  @override
  void initState() {
    _pageList = List();
    _pageList
      ..add(page(title: 'Home'))
      ..add(page(title: 'Airplay'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_currentState],
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context){
                return Scaffold(
                  appBar: AppBar(title: Text('Middle'),),
                  body: Center(
                    child: Text('Middle Page'),
                  ),
                );
              }
          ));
        },
        backgroundColor: Colors.lightBlue,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.lightBlue,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(
                  Icons.home,
                  color: Colors.white
              ),
              onPressed: (){
                setState(() {
                  _currentState = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(
                  Icons.airplay,
                  color: Colors.white
              ),
              onPressed: (){
                setState(() {
                  _currentState = 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
