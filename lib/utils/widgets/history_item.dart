import 'package:flutter/material.dart';
import 'package:weight_tracker/pages/view_weight_page.dart';
import 'package:weight_tracker/utils/navigation/navigator.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        pushTo(context, ViewWeightPage());
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "30.9 ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 1),
                  child: Text(
                    "kg",
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                Spacer(),
                Text(
                  "20 Nov 2021, 13:20",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(width: 5),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 13,
                )
              ],
            ),
            SizedBox(height: 3),
            Divider(
              color: Colors.white.withOpacity(0.5),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
