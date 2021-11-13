import 'package:flutter/material.dart';
import 'package:weight_tracker/utils/styles/colour_utils.dart';

class DashboardItem extends StatelessWidget {
  final String mainText;
  final IconData icon;
  final String subText;
  final Color color;
  final VoidCallback onTap;
  const DashboardItem({
    Key key,
    this.mainText,
    this.icon,
    this.subText,
    this.color,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 165,
        margin: EdgeInsets.only(right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 26,
            ),
            SizedBox(height: 5),
            Text(
              mainText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              subText,
            )
          ],
        ),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: color ?? baseColor,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
