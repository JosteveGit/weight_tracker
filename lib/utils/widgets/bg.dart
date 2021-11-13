import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BG extends StatelessWidget {
  const BG({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: SvgPicture.asset(
        'assets/svgs/bg.svg',
        semanticsLabel: 'Splash',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        color: Colors.blue[200],
      ),
    );
  }
}
