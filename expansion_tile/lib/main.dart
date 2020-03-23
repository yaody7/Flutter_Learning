import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Expansion Tile',
  home: MainPage(),
  theme: ThemeData.dark()
));

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expansion Tile')),
      body: Center(
        child: ListView(
          children: <Widget>[
            Tile(),
            Tile(),
            Tile(),
            Tile(),
            Tile(),
          ],
        ),
      )
    );
  }
}

class Tile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text('Big Title'),
      leading: Icon(Icons.ac_unit),
      backgroundColor: Colors.grey,
      children: <Widget>[
        ListTile(
            title: Text('Small Title'),
            subtitle: Text('Detail')
        )
      ],
    );
  }
}
