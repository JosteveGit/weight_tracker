import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weight_tracker/utils/functions/anim_utils.dart';
import 'package:weight_tracker/utils/functions/dev_utils.dart';
import 'package:weight_tracker/utils/navigation/navigator.dart';
import 'package:weight_tracker/utils/widgets/bg.dart';
import 'package:weight_tracker/utils/widgets/custom_button.dart';
import 'package:weight_tracker/utils/widgets/logo.dart';

import 'dashboard_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    );
    Timer(Duration(seconds: 1), () {
      _controller.forward();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(color: BarColor.white);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Stack(
          children: [
            BG(),
            SafeArea(
              child: Container(
                color: Colors.transparent,
                width: double.maxFinite,
                height: double.maxFinite,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Logo(),
                      AnimatedBuilder(
                        animation: _animation,
                        child: Column(
                          children: [
                            Container(
                              height: 90,
                              width: 3,
                              color: Colors.blue.withOpacity(0.8),
                            ),
                            CustomButton(
                              text: "Sign in",
                              onPressed: () {
                                pushTo(context, DashboardPage());
                              },
                            ),
                          ],
                        ),
                        builder: (context, widget) {
                          return Transform.translate(
                            offset: Offset(
                              getAnimValue(
                                start: -90,
                                end: 0,
                                animation: _animation,
                              ),
                              getAnimValue(
                                start: -32,
                                end: 0,
                                animation: _animation,
                              ),
                            ),
                            child: Transform.rotate(
                              angle: dToR(
                                getAnimValue(
                                  start: 50,
                                  end: 0,
                                  animation: _animation,
                                ),
                              ),
                              child: widget,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimationController _controller;
  CurvedAnimation _animation;
}

