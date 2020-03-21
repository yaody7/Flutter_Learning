import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder{
  final Widget page;

  CustomRoute(this.page):super(
    transitionDuration:Duration(seconds: 1),
    pageBuilder:(context, animation1, animation2){
      return page;
    },
    transitionsBuilder:(context, animation1, animation2, child){
      return RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0)
            .animate(CurvedAnimation(
              parent: animation1,
              curve: Curves.fastOutSlowIn
            )),
        child: FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0)
              .animate(CurvedAnimation(
              parent: animation1,
              curve: Curves.fastOutSlowIn
          )),
          child: child,
        ),
      );
    }
  );
}