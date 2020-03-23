import "package:flutter/material.dart";

void main() => runApp(MaterialApp(
  title: "Splash Screen",
  home: SplashPage(),
));

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{
  Animation _animation;
  AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 1.0,end: 0.0).animate(_controller);
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context){
              return Scaffold(
                appBar: AppBar(title: Text('Main Page')),
                body: Center(
                  child: Text('Main Page', style: TextStyle(fontSize: 50.0)),
                ),
              );
            }),
            (route) => route == null
        );
      }
    });
    _controller.forward();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.network('https://c-ssl.duitang.com/uploads/item/201510/26/20151026212004_wxaBz.jpeg',
          fit: BoxFit.cover,
        ),
      )
    );
  }
}
