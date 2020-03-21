import 'package:flutter/material.dart';
import 'page.dart';

void main() => runApp(MaterialApp(
  title: 'KeepAlivePages',
  theme: ThemeData(primarySwatch: Colors.lightBlue),
  home: MainPage(),
));

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length:3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keep Alive Pages'),
        bottom: TabBar(
          controller: _tabController,
          tabs:[
            Icon(Icons.home),
            Icon(Icons.airplay),
            Icon(Icons.train)
          ]
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Page(),
          Page(),
          Page()
        ]
      ),
    );
  }
}
