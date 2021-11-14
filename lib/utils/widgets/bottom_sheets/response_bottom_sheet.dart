import 'package:flutter/material.dart';
import 'package:weight_tracker/utils/navigation/navigator.dart';
import 'package:weight_tracker/utils/styles/colour_utils.dart';
import 'package:weight_tracker/utils/widgets/bg.dart';
import 'package:weight_tracker/utils/widgets/logo.dart';

import '../custom_button.dart';

class ResponseBottomSheet extends StatelessWidget {
  final String message;

  const ResponseBottomSheet({
    Key key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34),
          topRight: Radius.circular(34),
        ),
      ),
      child: Container(
        height: 448,
        decoration: BoxDecoration(
          color: Colors.black87.withOpacity(0.75),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(34),
            topRight: Radius.circular(34),
          ),
        ),
        width: double.maxFinite,
        child: Stack(
          overflow: Overflow.clip,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34),
                topRight: Radius.circular(34),
              ),
              child: Opacity(
                opacity: 1,
                child: BG(),
              ),
            ),
            Center(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 9),
                    Container(
                      width: 26,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Color(0xFFDADADA),
                        borderRadius: BorderRadius.circular(29),
                      ),
                    ),
                    SizedBox(height: 75),
                    Logo(
                      size: 120,
                      ratherIcon: Icons.check_rounded,
                    ),
                    SizedBox(height: 40),
                    Text(
                      "$message",
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 26),
                    CustomButton(
                      text: "Okay",
                      onPressed: () {
                        pop(context);
                      },
                      color: blue,
                    ),
                    SizedBox(
                      height: 20 + MediaQuery.of(context).padding.bottom,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
