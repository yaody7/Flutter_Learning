import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  title: 'Wrap Layout',
  theme: ThemeData.light(),
  home: MainPage()
));

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _photoList = List();
  @override
  void initState() {
    _photoList.add(AddButton());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Wrap Layout')),
      body: Center(
        child: Container(
          width: double.infinity,
          height: height / 2,
          child: Wrap(
            children: _photoList,
          ),
        )
      ),
    );
  }

  Widget AddButton(){
    return GestureDetector(
      onTap: (){
        setState(() {
          if(_photoList.length < 16) {
            _photoList.insert(0, Photo());
          }
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80,
          height: 80,
          color: Colors.grey,
          child: Center(
            child:Icon(Icons.add)
          ),
        ),
      ),
    );
  }
}


class Photo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 80,
          height: 80,
          color: Colors.yellow,
          child: Center(
            child:Text('Photo')
          ),
        ),
    );
  }
}
