import 'package:bottomnavigation/pages/EmailScreen.dart';
import 'package:bottomnavigation/pages/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:bottomnavigation/pages/AirplayScreen.dart';
import 'package:bottomnavigation/pages/EmailScreen.dart';
import 'package:bottomnavigation/pages/HomeScreen.dart';
import 'package:bottomnavigation/pages/PagesScreen.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _itemColor = Colors.green;
  List<Widget> _screenList = List();
  int _currentIndex = 0;
  @override
  void initState() {
    _screenList
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirplayScreen());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation'),
      ),
      body: _screenList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          itemBuilder(Icons.home, _itemColor, 'Home'),
          itemBuilder(Icons.email, _itemColor, 'Email'),
          itemBuilder(Icons.pages, _itemColor, 'Pages'),
          itemBuilder(Icons.airplay, _itemColor, 'Airplay')
        ],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
      ),
    );
  }
}

BottomNavigationBarItem itemBuilder(IconData iconData, Color color, String title){
  return BottomNavigationBarItem(
    icon: Icon(
      iconData,
      color: color,
    ),
    title: Text(
      title,
      style: TextStyle(color: color),
    )
  );
}


