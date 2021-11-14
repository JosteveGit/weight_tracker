import 'package:flutter/material.dart';
import 'package:weight_tracker/utils/widgets/logo.dart';

class WLoader extends StatefulWidget {
  final double size;
  const WLoader({
    Key key,
    this.size,
  }) : super(key: key);

  @override
  _WLoaderState createState() => _WLoaderState();
}

class _WLoaderState extends State<WLoader> with TickerProviderStateMixin {
  AnimationController animationController;
  var tween = Tween<double>(begin: 0, end: 1)
    ..chain(CurveTween(curve: Curves.ease));

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1))
          ..forward()
          ..repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: RotationTransition(
          turns: animationController.drive(tween),
          child: Center(
            child: Logo(
              size: widget.size ?? 100,
              useHero: false,
            ),
          ),
        ),
      ),
    );
  }
}
