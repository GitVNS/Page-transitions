import 'package:flutter/material.dart';

class ScalePageTransition extends PageRouteBuilder {
  final Widget child;

  ScalePageTransition({
    required this.child,
  }) : super(
            opaque: false,
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
      scale: Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutExpo,
        ),
      ),
      child: child,
    );
  }
}

class SlidePageTransition extends PageRouteBuilder {
  final Widget child;
  final AxisDirection direction;

  SlidePageTransition({
    required this.child,
    required this.direction,
  }) : super(
            opaque: false,
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: getOffset(direction),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutExpo,
        ),
      ),
      child: child,
    );
  }

  Offset getOffset(AxisDirection direction) {
    switch (direction) {
      case AxisDirection.left:
        return const Offset(-1, 0);
      case AxisDirection.right:
        return const Offset(1, 0);
      case AxisDirection.up:
        return const Offset(0, 1);
      case AxisDirection.down:
        return const Offset(0, -1);
    }
  }
}
