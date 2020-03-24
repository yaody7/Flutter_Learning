import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  title: 'Draggable Widget',
  home: MainPage(),
));
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Color draggableColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Draggable Widget')),
      body: Stack(
        children: <Widget>[
          DraggableWidget(
            offset: Offset(80.0, 80.0),
            widgetColor: Colors.redAccent,
          ),
          DraggableWidget(
            offset: Offset(180.0, 80.0),
            widgetColor: Colors.blueAccent,
          ),
          Center(child:DragTarget(
              onAccept: (Color color){
                draggableColor = color;
              },
              builder: (arg1, arg2, arg3){
                return Container(
                  width: 200,
                  height: 200,
                  color: draggableColor,
                );
              },
            )
          )
        ],
      ),
    );
  }
}

class DraggableWidget extends StatefulWidget {
  final Offset offset;
  final Color widgetColor;
  DraggableWidget({Key key,this.offset,this.widgetColor})
      :super(key:key);
  @override
  _DraggableWidgetState createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget> {
  Offset offset;
  @override
  void initState() {
    this.offset = widget.offset;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: offset.dx,
      top: offset.dy,
      child: Draggable(
        data: widget.widgetColor,
        child: Container(
          width: 100.0,
          height: 100.0,
          color: widget.widgetColor,
        ),
        feedback: Container(
          width: 110.0,
          height: 110.0,
          color: widget.widgetColor.withOpacity(0.5)
        ),
        onDraggableCanceled: (velocity, offset){
          setState(() {
            this.offset = offset;
          });
        },
      )
    );
  }
}

