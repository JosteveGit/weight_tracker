import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double size;
  final bool useHero;
  final IconData ratherIcon;
  const Logo({
    Key key,
    this.size,
    this.useHero = true,
    this.ratherIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeroMode(
      enabled: useHero,
      child: Hero(
        tag: "logo",
        child: Container(
          width: size,
          height: size,
          child: FittedBox(
            child: Container(
              padding: EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.8),
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: EdgeInsets.all(30),
                child: Icon(
                 ratherIcon ?? Icons.fitness_center_rounded,
                  size: 120,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
