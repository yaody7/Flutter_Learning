import 'package:flutter/material.dart';

class CustomRoute extends PageRouteBuilder{
  final Widget page;

  CustomRoute(this.page):super(
    transitionDuration:Duration(seconds: 1),
    pageBuilder:(context, animation1, animation2){
      return RotationTransition(
        turns: animation1,
        child: FadeTransition(
          opacity: animation1,
          child: page,
        ),
      );
    },
  );
}